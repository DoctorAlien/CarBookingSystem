using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_DelCar : System.Web.UI.Page
{
    DataBase sql = new DataBase();
    DataSet ds = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        int cid = int.Parse(Request.QueryString["cid"]);
        string sqlString = "delete from t_cars_base where cid="+cid;
        if (sql.UpdateData(sqlString) == 1)
        {
            Response.Redirect("CarManage.aspx");
        }
        else {
            Response.Redirect("CarManage.aspx");
        }
        

    }
}