using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

/// <summary>
///DataBase 的摘要说明
/// </summary>
public class DataBase
{
    #region 私有字段
    private string conString = ConfigurationManager.ConnectionStrings["Module"].ConnectionString;
    private SqlConnection conn = null;
    private SqlCommand comm = null;
    DataSet ds = null;
    SqlDataAdapter sda = null;
    #endregion
    /// <summary>
    /// 连接数据库
    /// </summary>
    private void OpenConnection() {
        if (conn==null)
        {
            conn = new SqlConnection(conString);
        }
        else if (conn.State == ConnectionState.Open) {
            return;
        } conn.Open();
    }
    /// <summary>
    /// 关闭数据库
    /// </summary>
    private void CloseConnection() {
        conn.Dispose();
        conn.Close();
        conn = null;
    }
    /// <summary>
    /// 是否存在数据
    /// </summary>
    /// <param name="sqlString"></param>
    /// <returns></returns>
    public bool IsExist(string sqlString) {
        OpenConnection();
        comm = new SqlCommand(sqlString, conn);
        SqlDataReader sdr = comm.ExecuteReader();
        try
        {
            if (sdr.Read())
            {
                return true;
            }
            else {
                return false;
            }
        }
        catch (Exception)
        {
            
            throw;
        }
        CloseConnection();
    }
    public bool IsExist(string sqlString, SqlParameter[] values)
    {
        OpenConnection();
        comm = new SqlCommand(sqlString, conn);
        foreach (SqlParameter item in values)
        {
            comm.Parameters.Add(item);
        }     
        try
        {
            SqlDataReader sdr = comm.ExecuteReader();
            if (sdr.Read())
            {
                sdr.Close();
                return true;
                
            }
            else
            {
                sdr.Close();
                return false;
                
            }
            
        }
        catch (Exception)
        {

            throw;
        }
        CloseConnection();
    }
    /// <summary>
    /// 获取数据
    /// </summary>
    /// <param name="sqlString"></param>
    /// <returns></returns>
    public DataSet GetDataSet(string sqlString) {
        OpenConnection();
        comm = new SqlCommand(sqlString, conn);
        ds = new DataSet();
        sda = new SqlDataAdapter(comm);
        sda.Fill(ds);
        CloseConnection();
        return ds;
    }

    public DataSet GetDataSet(string sqlString,SqlParameter[] values)
    {
        OpenConnection();
        comm = new SqlCommand(sqlString, conn);
        foreach (SqlParameter item in values)
        {
            comm.Parameters.Add(item);
        }
        ds = new DataSet();
        sda = new SqlDataAdapter(comm);
        sda.Fill(ds);
        CloseConnection();
        return ds;
    }

    /// <summary>
    /// 更新数据
    /// </summary>
    /// <param name="sqlString"></param>
    /// <returns></returns>
    public int UpdateData(string sqlString, SqlParameter[] values)
    {
        OpenConnection();
        comm = new SqlCommand(sqlString, conn);
        foreach (SqlParameter item in values)
        {
            comm.Parameters.Add(item);
        }
        int i=comm.ExecuteNonQuery();
        return i;
    }
    /// <summary>
    ///更新数据
    /// </summary>
    /// <param name="sqlString"></param>
    /// <returns></returns>
    public int UpdateData(string sqlString)
    {
        OpenConnection();
        comm = new SqlCommand(sqlString, conn);
        int i = comm.ExecuteNonQuery();
        return i;
    }
    /// <summary>
    /// 获取数据流
    /// </summary>
    /// <param name="sqlSting"></param>
    /// <returns></returns>
    public SqlDataReader GetDataReader(string sqlSting) {
        OpenConnection();
        comm = new SqlCommand(sqlSting, conn);
        SqlDataReader sdr = comm.ExecuteReader();
        return sdr;
    }
    public SqlDataReader GetDataReader(string sqlSting,SqlParameter[] values)
    {
        OpenConnection();
        comm = new SqlCommand(sqlSting, conn);
        foreach (SqlParameter item in values)
        {
            comm.Parameters.Add(item);
        }
        SqlDataReader sdr = comm.ExecuteReader();
        return sdr;
    }
}