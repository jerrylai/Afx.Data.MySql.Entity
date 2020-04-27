using Afx.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using MySql.Data.MySqlClient;
using System.Data.Common;

namespace Afx.Data.MySql
{
    /// <summary>
    /// MySql数据库访问类
    /// </summary>
    public sealed class MySqlDatabase : Database
    {
        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="connectionString">连接字符串</param>
        public MySqlDatabase(string connectionString)
            : base(connectionString, MySqlClientFactory.Instance)
        {
        }

        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="connection">数据库链接</param>
        /// <param name="isOwnsConnection">释放资源时是否释放链接</param>
        public MySqlDatabase(MySqlConnection connection, bool isOwnsConnection = true)
            : base(connection, isOwnsConnection)
        {
        }
        /// <summary>
        /// 参数化查询名称加前缀
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public override string EncodeParameterName(string name)
        {
            if (string.IsNullOrEmpty(name)) throw new ArgumentNullException("name");
            return string.Format("?{0}", name);
        }
        /// <summary>
        /// 列名转义
        /// </summary>
        /// <param name="column"></param>
        /// <returns></returns>
        public override string EncodeColumn(string column)
        {
            if (string.IsNullOrEmpty(column)) throw new ArgumentNullException("column");
            return string.Format("`{0}`", column);
        }
    }
}
