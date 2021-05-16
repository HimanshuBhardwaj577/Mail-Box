using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Text.RegularExpressions;

namespace Video
{
    public partial class Mail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {







        }

        protected void lbEdit_Click(object sender, EventArgs e)
        {
            try
            {

                if (string.IsNullOrEmpty(TextBox1.Text) && string.IsNullOrEmpty(TextBox2.Text) && string.IsNullOrEmpty(TextBox4.Text) && string.IsNullOrEmpty(TextBox6.Text) || string.IsNullOrEmpty(TextBox1.Text) || string.IsNullOrEmpty(TextBox2.Text) || string.IsNullOrEmpty(TextBox4.Text) || string.IsNullOrEmpty(TextBox6.Text))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "emtytext();", true);
                }
                else
                {
                    string constr = ConfigurationManager.ConnectionStrings["mymail"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        using (SqlCommand cmdd = new SqlCommand("selectionn", con)) // create Proc Selection @Policy_ Id (Dattype) as begin (Sql qyery) end 
                        {

                            using (SqlDataAdapter sda = new SqlDataAdapter(cmdd))
                            {
                                cmdd.CommandType = CommandType.StoredProcedure;
                                con.Open();
                                if (TextBox6.Text.Contains(' ') || TextBox6.Text.Contains("\r\n"))//checking for you are entered single value or multiple values  
                                {
                                    string val = TextBox6.Text.Replace("\r\n", " ");//split values with ‘,’  
                                    string[] arryval = val.Split(' ');//split values with ‘,’ 
                                    int j = arryval.Length;
                                    int i = 0;

                                    DataTable dt = new DataTable();
                                    for (i = 0; i < j; i++)
                                    {
                                        if (arryval[i] != "")
                                        {
                                            cmdd.Parameters.Clear();
                                            cmdd.Parameters.AddWithValue("@Policy_Id", arryval[i]);
                                            cmdd.ExecuteNonQuery();
                                            sda.Fill(dt);
                                            Repeater1.DataSource = dt;
                                            Repeater1.DataBind();
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "mailing();", true);
                                        }
                                    }



                                }

                            }
                        }

                    }

                }









            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "catching();", true);
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {

        }

        protected void lbEdi_Click(object sender, EventArgs e)

        {
            if (Button2.Enabled == false)
            {
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox4.Text = "";
                TextBox6.Text = "";
                Response.Redirect("Mail.aspx");

            }

            else if (Button2.Enabled == true)
            {
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox4.Text = "";
                TextBox6.Text = "";
                Response.Redirect("Mail.aspx");

            }

        }

        protected void gmail_Click(object sender, EventArgs e)
        {
            try
            {

                StringWriter sw = new StringWriter();
                HtmlTextWriter ht = new HtmlTextWriter(sw);
                example2.RenderControl(ht);

                string onee = @"<!DOCTYPE html>
                                  <html>
                                   <head>
                                   <meta name=""viewport"" content=""width = device - width, initial - scale = 1"">
                                          <style>
                                           #customers tr:hover{background-color:#ddd}
                                     </style>
                                 </ head>
                                 <body>
                                 <pre>" + TextBox4.Text + "</pre>"
                                 + "<br/><hr/>"
                                + sw.ToString() +
                                   "</ body ></ html >";
                TextBox4.Text = onee;
                MailMessage mm = new MailMessage("Your Gmail Id", TextBox1.Text);
                mm.Subject = TextBox2.Text;
                mm.Body = TextBox4.Text;
                if (FileUpload1.HasFile)
                {
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    mm.Attachments.Add(new Attachment(FileUpload1.PostedFile.InputStream, filename));
                }
                mm.IsBodyHtml = Regex.IsMatch(TextBox4.Text, @"<\s*([^ >]+)[^>]*>.*?<\s*/\s*\1\s*>");
                TextBox4.Visible = false;
                TextBox5.Visible = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential nc = new NetworkCredential();
                nc.UserName = "Your Gmail Id";
                nc.Password = "Your Gmail Id Password";
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = nc;
                smtp.Port = 587;
                smtp.Send(mm);
                TextBox1.Text = string.Empty;
                TextBox2.Text = string.Empty;
                TextBox6.Text = string.Empty;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "sending();", true);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "redirectjs",
                    "setTimeout(function() {window.location.replace('Mail.aspx')},5000)", true);

            }

            catch
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "catching();", true);
            }







        }

        protected void outlook_Click(object sender, EventArgs e)
        {
           
            try
            {
                StringWriter sw = new StringWriter();
                HtmlTextWriter ht = new HtmlTextWriter(sw);
                example2.RenderControl(ht);

                string onee = @"<!DOCTYPE html>
                                  <html>
                                   <head>
                                   <meta name=""viewport"" content=""width = device - width, initial - scale = 1"">
                                          <style>
                                           #customers tr:hover{background-color:#ddd}
                                     </style>
                                 </ head>
                                 <body>
                                 <pre>" + TextBox4.Text + "</pre>"
                                 + "<br/><hr/>"
                                + sw.ToString() +
                                   "</ body ></ html >";
                TextBox4.Text = onee;

                string from = "Your Outlook Id";
                using (MailMessage mail = new MailMessage(from, TextBox1.Text))
                {
                    {
                        mail.Subject = TextBox2.Text;
                        mail.Body = TextBox4.Text;
                        if (FileUpload1.HasFile)
                        {
                            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                            mail.Attachments.Add(new Attachment(FileUpload1.PostedFile.InputStream, filename));
                        }
                        mail.IsBodyHtml = Regex.IsMatch(TextBox4.Text, @"<\s*([^ >]+)[^>]*>.*?<\s*/\s*\1\s*>");
                        TextBox4.Visible = false;
                        TextBox5.Visible = true;
                        SmtpClient client = new SmtpClient("smtp-mail.outlook.com");
                        client.Port = 587;
                        client.DeliveryMethod = SmtpDeliveryMethod.Network;
                        client.UseDefaultCredentials = false;
                        System.Net.NetworkCredential credential = new System.Net.NetworkCredential(from, "Your Outlook Id Password");
                        client.EnableSsl = true;
                        client.Credentials = credential;
                        client.Send(mail);
                        TextBox1.Text = string.Empty;
                        TextBox2.Text = string.Empty;
                        TextBox6.Text = string.Empty;
                       
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "sending();", true);
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "redirectjs",
                        "setTimeout(function() {window.location.replace('Mail.aspx')},5000)", true);


                    }

                }
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "catching();", true);
            }



        }

    }
}