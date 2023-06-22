using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


    /// <summary>
    /// 数据库工具类（不适用于并发）
    /// </summary>
    class Dao
    {
        /// <summary>
        /// 从配置文件(Web.config)获取数据库连接字符串（可以直接给数据库连接字符串）
        /// </summary>
        private static string cs = ConfigurationManager.ConnectionStrings["BookManageConnectionString"].ConnectionString;
        private static SqlConnection sc;
        /// <summary>
        /// 连接并打开数据库
        /// </summary>
        /// <returns>连接对象</returns>
        public static SqlConnection Connect()
        {
            sc = new SqlConnection(cs);//创建数据库连接对象
            sc.Open();//打开数据库
            return sc;//返回数据库连接对象
        }
        /// <summary>
        /// 返回SqlCommand对象
        /// </summary>
        /// <param name="sql">执行SQL语句</param>
        /// <returns></returns>
        public static SqlCommand Command(string sql)
        {
            SqlCommand cmd = new SqlCommand(sql, Connect());
            return cmd;
        }
        /// <summary>
        /// 更新操作
        /// </summary>
        /// <param name="sql">更新SQL语句</param>
        /// <returns></returns>
        public static int Update(string sql)
        {
            return Command(sql).ExecuteNonQuery();
        }
        /// <summary>
        /// 读取操作
        /// </summary>
        /// <param name="sql">查询SQL语句</param>
        /// <returns></returns>
        public static SqlDataReader Read(string sql)
        {
            return Command(sql).ExecuteReader();
        }
        /// <summary>
        /// 关闭数据库连接
        /// </summary>
        public static void Close()
        {
            sc.Close();
        }
    }
