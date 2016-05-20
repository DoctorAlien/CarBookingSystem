using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data;
using System.Data.SqlClient;

public partial class register : System.Web.UI.Page
{
    DataBase sql = new DataBase();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Random ran = new Random();
            lbtValidate.Text = ran.Next(1000, 9999).ToString();
        }
    }
    protected void lbtValidate_Click(object sender, EventArgs e)
    {
        Random ran = new Random();
        lbtValidate.Text = ran.Next(1000, 9999).ToString();
    }
    protected void cvUserName_ServerValidate(object source, ServerValidateEventArgs args)
    {
        Regex regex = new Regex("[A-Za-z]");
        string username = txtUserName.Text.Trim();
        SqlParameter[] values = new SqlParameter[]{
        new SqlParameter("@username",username)
        };
        args.IsValid = false;
        if (username == "")
        {
            cvUserName.ErrorMessage = "*用户名不能为空";
        }
        else if (username.Length < 4)
        {
            cvUserName.ErrorMessage = "*用户名至少四个字符";
        }
        else if (regex.IsMatch(username))
        {
            cvUserName.ErrorMessage = "*用户名必须是英文";
        }
        else if (sql.IsExist("select * from t_user_base where username_ =@username",values))
        {
            cvUserName.ErrorMessage = "*用户名不能重复";
        }
        else {
            args.IsValid = true;
        }
    }
    protected void cvPassword_ServerValidate(object source, ServerValidateEventArgs args)
    {
        Regex regex = new Regex("[A-Za-z]{6,}");
        string password = txtPassword.Text.Trim();
        args.IsValid = false;
        if (password == "")
        {
            cvPassword.ErrorMessage = "*密码不能为空";
        }
        else if (true)
        {
            
        }
        else {
            args.IsValid = true;
        }
    }
    protected void cvName_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string name = txtName.Text.Trim();
        args.IsValid = false;
        if (name == "")
        {
            cvName.ErrorMessage = "*姓名不能为空";
        }
        else {
            args.IsValid = true;
        }
    }
    protected void cvEmail_ServerValidate(object source, ServerValidateEventArgs args)
    {
        Regex regex = new Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
        string email = txtEmail.Text.Trim();
        args.IsValid = false;
        if (email == "")
        {
            cvEmail.ErrorMessage = "*请填写邮箱地址";
        }
        else if (regex.IsMatch(email))
        {
            cvEmail.ErrorMessage = "*请填写正确的邮箱地址";
        }
        else {
            args.IsValid = true;
        }
    }
    protected void cvMobile_ServerValidate(object source, ServerValidateEventArgs args)
    {
        Regex regex = new Regex(@"(\(\d{3}\)|\d{3}-)?\d{8}");
        string mobile = txtMobile.Text.Trim();
        args.IsValid = false;
        if (mobile == "")
        {
            cvMobile.ErrorMessage = "*请输入手机号";
        }
        else if (regex.IsMatch(mobile))
        {
            cvMobile.ErrorMessage = "*手机号不正确";
        }
        else {
            args.IsValid = true;
        }
    }
    protected void cvValidate_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string validate = txtValidate.Text.Trim();
        args.IsValid = false;
        if (validate=="")
        {
            cvValidate.ErrorMessage = "*请输入验证码";
        }
        else if (validate!=txtValidate.Text.Trim())
        {
            cvValidate.ErrorMessage = "*验证码不正确";
        }
        else
        {
            args.IsValid = true;
        }
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string username = txtUserName.Text.Trim();
        string password = txtPassword.Text.Trim();
        string name = txtName.Text.Trim();
        string email = txtEmail.Text.Trim();
        string mobile = txtMobile.Text.Trim();

        string sqlString = "insert into t_users_base(username_,password_,name_,email_,mobile_) values(@username,@password,@name_,@email_,@mobile_)";
        SqlParameter[] values = new SqlParameter[]{
        new SqlParameter("@username",username),
        new SqlParameter("@password",password),
        new SqlParameter("@name",name),
        new SqlParameter("@email",email),
        new SqlParameter("@mobile",mobile)
        };
        if (sql.UpdateData(sqlString,values)==1)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            Response.Redirect("Register.aspx");
        }
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtValidate.Text = "";
        txtUserName.Text = "";
        txtPassword.Text = "";
        txtName.Text = "";
        txtMobile.Text = "";
        txtEmail.Text = "";
    }
}