using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace books_management_system.student
{
    public partial class changePwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.MenuIndex = 2;
        }

        protected void confirm_Click(object sender, EventArgs e)
        {
            string old = txtOldPwd.Text.ToString();//输入旧密码
            string pwd = txtNewPwd1.Text.ToString();//输入新密码
            string pwd2 = txtNewPwd2.Text.ToString();//输入确认密码
            string uid = Session["uid"].ToString();//登录账号
            string pwd0 = Session["pwd"].ToString();//原密码
            if (old.Length > 0 && pwd.Length > 0 && pwd2.Length > 0)//若输入不空
            {
                if (old == pwd0)//若输入旧密码与原密码相同
                {
                    if (pwd == pwd2)//若新密码两次输入相同
                    {
                        //SQL语句：修改学生表密码
                        string sql = string.Format("UPDATE Student SET 密码='{0}' WHERE 学号='{1}'", pwd, uid);
                        Dao.Update(sql);//执行更新密码SQL语句
                        Dao.Close();//关闭数据库连接
                        lbMsg.Text = "密码修改成功！";
                        Session["pwd"] = pwd;//更新Session密码
                    }
                    else
                    {
                        lbMsg.Text = "两次密码输入不一致！";
                    }
                }
                else
                {
                    lbMsg.Text = "旧密码错误！";
                }
            }
            else
            {
                lbMsg.Text = "旧密码或新密码或确认密码不能空！";
            }

        }
    }
}