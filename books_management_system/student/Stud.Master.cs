using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace books_management_system.student
{
    public partial class Stud : System.Web.UI.MasterPage
    {
        public int MenuIndex { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            studmenu.Items[MenuIndex].Selected = true;
        }
    }
}