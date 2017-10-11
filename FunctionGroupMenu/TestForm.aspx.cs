using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FunctionGroupMenu
{
    public partial class TestForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["userNo"] = TextBox1.Text;
            Session["PermitUserNo"] = TextBox1.Text;

            Response.Redirect("~/FunctionGroupMenu.aspx");
        }
    }
}