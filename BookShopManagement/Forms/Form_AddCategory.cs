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

namespace BookShopManagement.Forms
{
    public partial class Form_AddCategory : Form
    {
        public Form_AddCategory()
        {
            InitializeComponent();
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string sCategory = txtCategory.Text;
            if(sCategory != "")
            {
                string sql = "INSERT INTO TheLoai VALUES (N'"+sCategory+"')";
                try
                {
                    DAOtest.Instance.add_category(sql);
                }
                catch
                {
                    MessageBox.Show("Lỗi!");
                }
            }
            else
            {
                MessageBox.Show("Vui lòng nhập tên thể loại!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }
    }
}
