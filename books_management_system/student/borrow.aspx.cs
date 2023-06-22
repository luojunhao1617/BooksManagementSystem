using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace books_management_system.student
{
    public partial class borrow : System.Web.UI.Page
    {
        private List<Book> books = null;//定义书单列表对象
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.MenuIndex = 1;

            object obj = Session["books"];//获取书单对象
            if (obj != null)
            {
                books = obj as List<Book>;//转换为书单列表
            }
            GridView1.DataSource = books;//设置GridView1数据源为书单列表
            GridView1.DataBind();//数据源绑定
        }
        /// <summary>
        /// 借书或者从书单中删除
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);//获取选择行号（从0开始）
            string bookid = GridView1.Rows[index].Cells[0].Text.ToString();//获取选择行第1列值，即图书编号
            if (e.CommandName == "Del")//移除书单
            {
                //根据图书编号移除书单中图书
                books.Remove(books.Single(b => b.no == bookid));
                GridView1.DataSource = books;
                GridView1.DataBind();
                lbMsg.Text = "";
            }
            else//借书
            {
                string sno = Session["uid"].ToString();//获取学号
                //先检查已经借了多少书（最多5本）
                string sql = string.Format("SELECT COUNT(*) FROM Borrow WHERE 学号='{0}'", sno);
                SqlDataReader dr = Dao.Read(sql);
                if (dr.Read() && ((int)dr[0]) >= 5)
                {
                    lbMsg.Text = "您的借书额度已满！请还书后再借哦~";
                    Dao.Close();
                    return;
                }
                //再检查该书是否借过
                sql = string.Format("SELECT * FROM Borrow WHERE 学号='{0}' AND 编号='{1}'", sno, bookid);
                dr = Dao.Read(sql);
                if (dr.Read())
                {
                    lbMsg.Text = "您已经借过这本书哦~";
                    Dao.Close();
                    return;
                }
                //借书期限90天
                sql = string.Format("INSERT INTO Borrow VALUES('{0}','{1}','{2}','{3}')"
                    , sno, bookid, DateTime.Now.ToShortDateString(), DateTime.Now.AddDays(90).ToShortDateString());
                Dao.Update(sql);
                Dao.Close();
                GridView2.DataBind();
                updateBookList(bookid, -1);//更新书单库存-1
                lbMsg.Text = "恭喜你！借书成功！";
            }

        }
        /// <summary>
        /// 更新书单，step为1库存加1，step为-1库存减1
        /// </summary>
        /// <param name="bookId"></param>
        /// <param name="step"></param>
        void updateBookList(string bookId, int step)
        {
            if (books != null)
            {
                Book book = books.Where(b => b.no == bookId).FirstOrDefault();
                if (book != null)
                {
                    book.stock += step;
                    GridView1.DataSource = books;
                    GridView1.DataBind();
                }
            }
        }
        /// <summary>
        /// 实现还书方法
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);//获取选择行号（从0开始）
            string sno = Session["uid"].ToString();//获取学号
            string bookid = GridView2.Rows[index].Cells[0].Text.ToString();//获取选择行第1列值，即图书编号
            string sql = string.Format("DELETE FROM Borrow WHERE 学号='{0}' AND 编号='{1}'", sno, bookid);
            Dao.Update(sql);
            Dao.Close();
            GridView2.DataBind();
            updateBookList(bookid, 1);//更新书单库存+1
            lbMsg.Text = "还书成功！";

        }
    }
}