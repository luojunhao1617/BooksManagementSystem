using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace books_management_system.student
{
    public partial class query : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.MenuIndex = 0;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        //加入书单
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);//获取选择行号（从0开始）
            TableCellCollection cells = GridView1.Rows[index].Cells;//获取列集
            int stock = Convert.ToInt32(cells[5].Text);//获取库存量
            if (stock > 0)
            {
                object obj = Session["books"];//获取名字为books的session对象
                List<Book> books;//书单列表
                if (obj != null)
                {
                    books = obj as List<Book>;//把Object对象转化成List对象
                }
                else
                {
                    books = new List<Book>();
                }
                string no = cells[0].Text;
                //判断选择书是否存在于书单里
                if (books.Exists(b => b.no == no))//Lqing语句
                {
                    lbMsg.Text = "您已经选过了哦~";
                    return;
                }
                Book book = new Book()//使用属性实例化图书类
                {
                    no = no,
                    name = cells[1].Text,
                    author = cells[2].Text,
                    ver = cells[3].Text,
                    press = cells[4].Text,
                    stock = stock
                };
                books.Add(book);//加入书单列表
                Session["books"] = books;//保存书单到Session
                lbMsg.Text = "您已成功加入书单，点击“图书借阅”可以查看哦~";
            }
            else
            {
                lbMsg.Text = "不好意思，已经借完了哦~";
            }

        }
        

    }
    /// <summary>
    /// 图书实体类
    /// </summary>
    class Book
    {
        public string no { get; set; }//编号
        public string name { get; set; }//书名
        public string author { get; set; }//作者
        public string ver { get; set; }//版本
        public string press { get; set; }//出版社
        public int stock { get; set; }//库存
    }
}