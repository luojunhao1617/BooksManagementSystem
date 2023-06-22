using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace books_management_system.teacher
{
    public partial class bookedit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.MenuIndex = 0;
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
    }
}