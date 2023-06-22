using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace books_management_system
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string uid = txtUid.Text.Trim();
            string pwd = txtPwd.Text.Trim();
            string role = rlbRole.SelectedValue;
            string sql = string.Format("getUser '{0}','{1}'", role, uid);
            if (uid.Length > 0 && pwd.Length > 0)
            {
                SqlDataReader dr = Dao.Read(sql);
                if (dr.Read())
                {
                    string pwd1 = dr["密码"].ToString();
                    if (pwd == pwd1)
                    {
                        Session["uid"] = uid;
                        Session["name"] = dr["姓名"].ToString();
                        Session["role"] = role;
                        Session["pwd"] = pwd;
                        switch (role)
                        {
                            case "学生":
                                Response.Redirect("~/student/query.aspx");
                                break;
                            case "教师":
                                Response.Redirect("~/teacher/bookedit.aspx");
                                break;
                        }
                    }
                    else
                    {
                        lbMsg.Text = "密码错误！";
                    }
                }
                else
                {
                    lbMsg.Text = "用户名不存在！";
                }
                Dao.Close();
            }
            else
            {
                lbMsg.Text = "用户名和密码不能为空！";
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}