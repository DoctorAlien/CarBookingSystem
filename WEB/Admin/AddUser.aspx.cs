using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_AddUser : System.Web.UI.Page
{
    DataBase sql = new DataBase();
    DataSet ds = null;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        string username = txtUserName.Text;
        string password = txtPassword.Text;
        string name = txtName.Text;
        string email = txtEmail.Text;
        string mobile = txtMobile.Text;

        string sqlString = "insert into t_users_base(username_,password_,name_,email_,mobile_) values(@username,@password,@name,@email,@mobile)";
        SqlParameter[] values = new SqlParameter[]{
        new SqlParameter("@username",username),
        new SqlParameter("@password",password),
        new SqlParameter("@name",name),
        new SqlParameter("@email",email),
        new SqlParameter("@mobile",mobile)
        };
        if (sql.UpdateData(sqlString,values)==1)
        {
            Response.Redirect("UserManage.aspx");
        }
    }
}