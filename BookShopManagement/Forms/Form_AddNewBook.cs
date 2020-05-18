using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BookShopManagement.Forms
{
    public partial class Form_AddNewBook : Form
    {
        public Form_AddNewBook()
        {
            InitializeComponent();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void btnAddCategory_Click(object sender, EventArgs e)
        {
            using (Form_AddCategory ac = new Form_AddCategory())
            {
                ac.ShowDialog();
            }
        }

        private void btnAddAuthor_Click(object sender, EventArgs e)
        {
            using (Form_AddAuthor aa = new Form_AddAuthor())
            {
                aa.ShowDialog();
            }
        }

        private void btnAddPublisher_Click(object sender, EventArgs e)
        {
            using (Form_AddPublisher ac = new Form_AddPublisher())
            {
                ac.ShowDialog();
            }
        }
    }
}
