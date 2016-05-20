using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_AddUser : System.Web.UI.Page
{
    DataBase sql = new DataBase();
    DataSet ds = null;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        string code = txtCode.Text;
        string brand = txtBrand.Text;
        string type = txtType.Text;
        string description = txtDescription.Text;

        string sqlStrig = "insert into t_cars_base values(@code,@brand,@type,@description)";
        SqlParameter[] values = new SqlParameter[]{
        
        new SqlParameter("@code",code),
        new SqlParameter("@brand",brand),
        new SqlParameter("@type",type),
        new SqlParameter("@description",description)
        };
        if (sql.UpdateData(sqlStrig, values) == 1)
        {
            Response.Redirect("CarManage.aspx");
        }
        else
        {

        }
    }
}