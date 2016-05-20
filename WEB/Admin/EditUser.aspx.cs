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
            int uid = int.Parse(Request.QueryString["uid"]);
            string sqlString = "select * from t_users_base where uid=" + uid;
            SqlDataReader sdr = sql.GetDataReader(sqlString);
            if (sdr.HasRows)
            {
                while (sdr.Read())
                {
                    txtUid.Text = uid.ToString();
                    txtUserName.Text = sdr["username_"].ToString();
                    txtPassword.Text = sdr["password_"].ToString();
                    txtName.Text = sdr["name_"].ToString();
                    txtMobile.Text = sdr["mobile_"].ToString();
                    txtEmail.Text = sdr["email_"].ToString();
                    txtRegTime.Text = sdr["reg_time"].ToString();
                }
            } sdr.Close();
        }

    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        int uid = int.Parse(txtUid.Text);
        string username = txtUserName.Text;
        string password = txtPassword.Text;
        string name = txtName.Text;
        string email = txtEmail.Text;
        string mobile = txtMobile.Text;

        string sqlString = "update t_users_base set username_=@username,password_=@password,name_=@name,email_=@email,mobile_=@mobile where uid=@uid";
        SqlParameter[] values = new SqlParameter[]{
        new SqlParameter("@username",username),
        new SqlParameter("@password",password),
        new SqlParameter("@name",name),
        new SqlParameter("@email",email),
        new SqlParameter("@mobile",mobile),
        new SqlParameter("@uid",uid)
        };
        if (sql.UpdateData(sqlString,values)==1)
        {
            Response.Redirect("UserManage.aspx");
        }
    }
}