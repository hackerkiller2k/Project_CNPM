using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BookShopManagement.DAO
{
    class DAOtest
    {
        private static DAOtest instance;

        internal static DAOtest Instance
        {
            get
            {
                if (instance == null) instance = new DAOtest(); return DAO.DAOtest.instance;
            }

            private set
            {
                DAO.DAOtest.instance = value;
            }
        }

        public void them()
        {
            string sql = "INSERT INTO TacGia VALUES (N'TÁC GIẢ 2')";
            DAO.ConnectionSQL.Instance.Execute(sql);
        }

        public void add_category(string query)
        {
            string sql = query;
            MessageBox.Show(sql, query, MessageBoxButtons.OK, MessageBoxIcon.Error);
            DAO.ConnectionSQL.Instance.Execute(sql);
        }
    }
}
