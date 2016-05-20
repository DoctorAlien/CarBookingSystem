using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class login : System.Web.UI.Page
{
    DataBase sql = new DataBase();
    DataSet ds = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Random ran = new Random();
            lbtValidate.Text = ran.Next(1000, 9999).ToString();
        }
        
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtUserName.Text = "";
        txtPassword.Text = "";
        txtValidate.Text = "";


    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string validate = args.Value;
        if (validate == lbtValidate.Text)
        {
            args.IsValid = true;
            //CustomValidator1.ErrorMessage = "验证码不匹配";
        }
        else {
            args.IsValid = false;
        }
    }
    protected void lbtValidate_Click(object sender, EventArgs e)
    {
        Random ran = new Random();
        lbtValidate.Text = ran.Next(1000, 9999).ToString();
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = txtUserName.Text;
        string password = txtPassword.Text;
        string sqlString = "select * from t_users_base where username_=@username and password_=@password";
        string sqlStringAdmin = "select * from t_users_base where username_=@username and password_=@password and is_admin=1";
        SqlParameter[] values = new SqlParameter[]{
        new SqlParameter("@username",username),
        new SqlParameter("@password",password)
        };
        SqlParameter[] values1 = new SqlParameter[]{
        new SqlParameter("@username",username),
        new SqlParameter("@password",password)
        };
        SqlParameter[] values2 = new SqlParameter[]{
        new SqlParameter("@username",username),
        new SqlParameter("@password",password)
        };
        if (sql.IsExist(sqlString, values))
        {
            SqlDataReader sdr = sql.GetDataReader(sqlString,values2);
            if (sdr.HasRows)
            {
                while (sdr.Read())
                {
                    Session["uid"] = sdr["uid"].ToString();
                }
            } sdr.Close();
            Session["username"] = username;
            if (sql.IsExist(sqlStringAdmin, values1))
            {
                Session["admin"] = "true";
                Response.Redirect("~/Admin/UserManage.aspx");
            }
            else {
                Session["admin"] = "false";
                Response.Redirect("~/User/CarBooking.aspx");
            }
        }
        else {
            Response.Redirect("login.aspx");
        }
    }
}