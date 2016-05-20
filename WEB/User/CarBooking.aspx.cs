using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class User_Booking : System.Web.UI.Page
{
    DataBase sql = new DataBase();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string sqlString = "select distinct(brand_) as brand from t_cars_base";
            ds = sql.GetDataSet(sqlString);
            ddlBrand.DataSource = ds.Tables[0].DefaultView;
            ddlBrand.DataTextField = "brand";
            ddlBrand.DataBind();

            ddlBrand_SelectedIndexChanged(null, null);


            for (int i = 0; i < 24; i++)
            {
                ddlEndTimeHour.Items.Add(i.ToString());
                ddlStartTimeHour.Items.Add(i.ToString());
            }
            for (int i = 0; i <= 60; i++)
            {
                ddlEndTimeMinute.Items.Add(i.ToString());
                ddlStartTimeMinute.Items.Add(i.ToString());
            } 
        }
    }
    protected void calStartTime_SelectionChanged(object sender, EventArgs e)
    {
        txtStartTime.Text = Convert.ToString(calStartTime.SelectedDate.ToShortDateString());
    }
    protected void calEndTime_SelectionChanged(object sender, EventArgs e)
    {
        txtEndTime.Text = Convert.ToString(calEndTime.SelectedDate.ToShortDateString());
    }

    protected void calStartTime_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.Date<System.DateTime.Now)
        {
            e.Day.IsSelectable = false;
            e.Cell.Font.Strikeout = true;
        }
    }
    protected void calEndTime_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.Date < System.DateTime.Now)
        {
            e.Day.IsSelectable = false;
            e.Cell.Font.Strikeout = true;
        }
    }

    protected void ddlBrand_SelectedIndexChanged(object sender, EventArgs e)
    {
        string brand = ddlBrand.SelectedItem.Text;
        string sqlString="select distinct(type_) as type from t_cars_base where brand_='"+brand+"'";
        DataSet dsType = new DataSet();
        dsType = sql.GetDataSet(sqlString);
        ddlType.DataSource = dsType.Tables[0];
        ddlType.DataTextField = "type";
        ddlType.DataBind();
    }
    static DateTime startTime = DateTime.Now;
    static DateTime endTime = DateTime.Now;
    protected void btnBooking_Click(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack)
        //{
            Panel1.Visible = true;
             startTime = Convert.ToDateTime(txtStartTime.Text + " " + ddlStartTimeHour.Text + ":" + ddlStartTimeMinute.Text + ":00");
             endTime = Convert.ToDateTime(txtEndTime.Text + " " + ddlEndTimeHour.Text + ":" + ddlEndTimeMinute.Text + ":00");
         
            if (DateTimeToUnixTimeStamp(endTime) - DateTimeToUnixTimeStamp(startTime) <= 1800)
            {
                //Response.Redirect("~/login.aspx?id=1");
                //string sqlString = "select * from t_cars_base where brand_=@brand and type_=@type";
                string sqlString = "select * from t_cars_base as base where brand_=@brand and type_=@type and not exists(select * from t_cars_book as book where base.cid=book.cid)";
                SqlParameter[] values = new SqlParameter[]{
            new SqlParameter("@brand",ddlBrand.SelectedItem.Text),
            new SqlParameter("@type",ddlType.SelectedItem.Text)
            };

                DataSet dsLookCars = new DataSet();
                dsLookCars = sql.GetDataSet(sqlString, values);
                Repeater1.DataSource = dsLookCars.Tables[0];
                Repeater1.DataBind();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('试驾时间最多30分钟')", true);
            } 
        //}
    }
    protected void btnBookingCar_Click(object sender, EventArgs e) {
        int cid=Convert.ToInt32(((Button)sender).CommandArgument);
        string sqlString = "insert into t_cars_book(uid,cid,start_time,end_time,description_) values(@uid,@cid,@startTime,@endTime,@description)";
        SqlParameter[] values = new SqlParameter[]{
        new SqlParameter("@cid",cid),
        new SqlParameter("@uid",Session["uid"].ToString()),
        new SqlParameter("@startTime",startTime),
        new SqlParameter("@endTime",endTime),
        new SqlParameter("@description",txtDescription.Text)
        };
        if (sql.UpdateData(sqlString,values)==1)
        {
            Response.Redirect("MyBooking.aspx");
        }
    }





    public static long DateTimeToUnixTimeStamp(DateTime dateTime) {
        var start = new DateTime(1970,1,1,0,0,0, dateTime.Kind);
        return Convert.ToInt64((dateTime - start).TotalSeconds);
    }
}