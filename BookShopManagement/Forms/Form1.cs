using BookShopManagement.Forms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BookShopManagement.DAO;

namespace BookShopManagement
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        

        private void button2_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        

        private void btnLogin_Click(object sender, EventArgs e)
        {
            Form_Dashboard db = new Form_Dashboard();
            db.ShowDialog();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            if (DAO.ConnectionSQL.OpenConnection() == false)
            {
                ReConnection();
            }
        }
        #region frmConnection
        Form_ConnectionSQL m_Connection = null;
        //frmLogin m_FrmLogin = null;
        public void ReConnection()
        {
            MessageBox.Show("Lỗi kết nối đến cơ sở dữ liệu! Xin vui lòng thiết lập lại kết nối...", "ERROR", System.Windows.Forms.MessageBoxButtons.OK, System.Windows.Forms.MessageBoxIcon.Error);
            //m_Connection = new frmConnection();
            if (m_Connection == null || m_Connection.IsDisposed)
                m_Connection = new Form_ConnectionSQL();

            if (m_Connection.ShowDialog() == DialogResult.OK)
            {
                MessageBox.Show("Đã thiết lập kết nối cho lần chạy đầu tiên.\nHãy khởi động lại chương trình để thực thi kết nối!", "SUCCESSED", MessageBoxButtons.OK, MessageBoxIcon.Information);
                Application.Restart();
            }
            else
                return;
        }
        #endregion

        private void button3_Click(object sender, EventArgs e)
        {
            DAOtest.them();
        }
    }
}
