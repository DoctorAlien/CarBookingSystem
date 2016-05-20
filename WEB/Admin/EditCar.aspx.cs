using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_EditUser : System.Web.UI.Page
{
    DataBase sql = new DataBase();
    DataSet ds = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int cid = int.Parse(Request.QueryString["cid"]);
            string sqlString = "select * from t_cars_base where cid=" + cid;
            SqlDataReader sdr = sql.GetDataReader(sqlString);
            if (sdr.HasRows)
            {
                while (sdr.Read())
                {
                    txtCid.Text = cid.ToString();
                    txtCode.Text = sdr["code_"].ToString();
                    txtBrand.Text = sdr["brand_"].ToString();
                    txtType.Text = sdr["type_"].ToString();
                    txtDescription.Text = sdr["description_"].ToString();
                }
            } sdr.Close(); 
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        int cid = int.Parse(txtCid.Text);
        string code = txtCode.Text;
        string brand = txtBrand.Text;
        string type = txtType.Text;
        string description = txtDescription.Text;

        string sqlStrig = "update t_cars_base set code_=@code,brand_=@brand,type_=@type,description_=@description where cid=@cid";
        SqlParameter[] values = new SqlParameter[]{
        new SqlParameter("@cid",cid),
        new SqlParameter("@code",code),
        new SqlParameter("@brand",brand),
        new SqlParameter("@type",type),
        new SqlParameter("@description",description)
        };
        if (sql.UpdateData(sqlStrig,values)==1)
        {
            Response.Redirect("CarManage.aspx");
        }
        else { 

        }
    }
}