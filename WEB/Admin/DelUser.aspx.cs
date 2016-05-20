using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_DelUser : System.Web.UI.Page
{
    DataBase sql = new DataBase();
    DataSet ds = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        int uid = int.Parse(Request.QueryString["uid"]);
        string sqlString = "delete from t_users_base where uid=" + uid;
        if (sql.UpdateData(sqlString)==1)
        {
            Response.Redirect("UserManage.aspx");
        }
    }
}