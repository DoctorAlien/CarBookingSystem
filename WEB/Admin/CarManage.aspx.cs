using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_UserManage : System.Web.UI.Page
{
    DataBase sql = new DataBase();
    DataSet ds = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        string sqlString = "select * from t_cars_base";
        ds = sql.GetDataSet(sqlString);
        Repeater1.DataSource = ds.Tables[0];
        Repeater1.DataBind();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string newClass = ddlClass.SelectedValue.ToString();
        string text=txtSearch.Text;
        string sqlString = "select * from t_cars_base where " + newClass + " like '%" + text + "%'";
        ds = sql.GetDataSet(sqlString);
        Repeater1.DataSource = ds.Tables[0];
        Repeater1.DataBind();
    }
}