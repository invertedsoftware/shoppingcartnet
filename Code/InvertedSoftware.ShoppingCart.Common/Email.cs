using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Mail;

namespace InvertedSoftware.ShoppingCart.Common
{
    public class Email
    {
        public static void SendSimpleEmail(string fromName, string fromEmail, List<MailAddress> toAddressList, string subject, string emailBody, bool isHTML)
        {
            try
            {
                SmtpClient client = new SmtpClient();
                MailMessage message = ComposeEmailMessage(fromName, fromEmail, toAddressList, subject, emailBody, isHTML);
                client.Send(message);
            }
            catch (Exception e)
            {
                throw new Exception("Error sending email from " + fromEmail, e);
            }
        }

        public static void SendSimpleEmail(string SMTPServer, int SMTPPort, string fromName, string fromEmail, List<MailAddress> toAddressList, string subject, string emailBody, bool isHTML)
        {
            try
            {
                SmtpClient client = new SmtpClient();
                client.Host = SMTPServer;
                client.Port = SMTPPort;
                MailMessage message = ComposeEmailMessage(fromName, fromEmail, toAddressList, subject, emailBody, isHTML);
                client.Send(message);
            }
            catch (Exception e)
            {
                throw new Exception("Error sending email from " + fromEmail, e);
            }
        }

        private static MailMessage ComposeEmailMessage(string fromName, string fromEmail, string toName, string toEmail, string subject, string emailBody, bool isHTML)
        {
            return ComposeEmailMessage(fromName, fromEmail, new List<MailAddress>() { new MailAddress(toEmail, toName) }, subject, emailBody, isHTML);
        }

        private static MailMessage ComposeEmailMessage(string fromName, string fromEmail, List<MailAddress> toAddressList, string subject, string emailBody, bool isHTML)
        {
            MailMessage message = new MailMessage();
            MailAddress fromAddress = new MailAddress(fromEmail, fromName);
            message.From = fromAddress;
            foreach (MailAddress toAddress in toAddressList)
                message.To.Add(toAddress);
            message.Subject = subject;
            message.Body = emailBody;
            message.IsBodyHtml = isHTML;
            return message;
        }
    }
}
