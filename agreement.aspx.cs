using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;
using System.Web.Services;
using System.Net;
using System.Text.RegularExpressions;

using System.Drawing;
using System.Web.UI.HtmlControls;

using System.Reflection;

using System.Threading;
using System.Threading.Tasks;

using System.Web.Script.Services;
using System.ServiceModel;
using System.Activities.Statements;
using System.Runtime.InteropServices.ComTypes;
using System.Collections;


public partial class agreement : System.Web.UI.Page

{
    private const string FtpFolder = "ftp://msksoftware.co.in/httpdocs/forestdoc/";
    private const string FtpUsername = "mskuser";
    private const string FtpPassword = "Swadhin@#12";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Initialize page if needed
        }
    }
    private static bool UploadFileToFtp(string picData, string filePath)
    {
        if (string.IsNullOrEmpty(filePath) || string.IsNullOrEmpty(picData))
        {
            return false;
        }

        try
        {
            string[] picParts = picData.Split(',');
            if (picParts.Length < 2)
            {
                return false;
            }

            byte[] bytes = Convert.FromBase64String(picParts[1]);
            string[] pathParts = filePath.Split('.');
            if (pathParts.Length < 2)
            {
                return false;
            }

            string fullPath = string.Format("{0}{1}profile.{2}", FtpFolder, pathParts[0], pathParts[1]);

            FtpWebRequest request = (FtpWebRequest)WebRequest.Create(fullPath);
            request.Method = WebRequestMethods.Ftp.UploadFile;
            request.Credentials = new NetworkCredential(FtpUsername, FtpPassword);
            request.ContentLength = bytes.Length;
            request.UsePassive = true;
            request.UseBinary = true;
            request.ServicePoint.ConnectionLimit = bytes.Length;
            request.EnableSsl = false;

            using (Stream requestStream = request.GetRequestStream())
            {
                requestStream.Write(bytes, 0, bytes.Length);
            }

            using (FtpWebResponse response = (FtpWebResponse)request.GetResponse())
            {
                return response.StatusCode == FtpStatusCode.ClosingData;
            }
        }
        catch (WebException ex)
        {
            FtpWebResponse response = ex.Response as FtpWebResponse;
            string errorMessage = response != null ? response.StatusDescription : ex.Message;
            System.Diagnostics.Debug.WriteLine(string.Format("FTP Upload failed: {0}", errorMessage));
            return false;
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(string.Format("Upload failed: {0}", ex.Message));
            return false;
        }
    }

    private static string GetUploadedPath(string baseFileName, string path)
    {
        if (string.IsNullOrEmpty(path))
        {
            return string.Empty;
        }

        string[] pathParts = path.Split('.');
        if (pathParts.Length < 2)
        {
            return string.Empty;
        }

        return string.Format("https://msksoftware.co.in/httpdocs/forestdoc/{0}profile.{1}", pathParts[0], pathParts[1]);


    }

    public class AgreementDetails : IDisposable
    {
        public string ClientName { get; set; }
        public string ClientID { get; set; }
        public decimal TransactionAmount { get; set; }
        public string ClientReceipt { get; set; }
        public string PaymentReceipt { get; set; }
        public string AgreementID { get; set; }
        public string AgreementDocument { get; set; }
        public string Refer { get; set; }
        public decimal Percentage { get; set; }
        public string Priority { get; set; }
        public decimal TotalFund { get; set; }
        public DateTime StartDate { get; set; }
        public int Term { get; set; }
        public DateTime ExpireDate { get; set; }
        public decimal ProfitClient { get; set; }
        public string AccountLink { get; set; }
        public decimal CurrentTransaction { get; set; }
        public int DaysInvestment { get; set; }
        public string Pic { get; set; }
        public string Path { get; set; }
        public string IFSC { get; set; }

        // IDisposable implementation
        private bool _disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!_disposed)
            {
                if (disposing)
                {
                    // Dispose managed resources here, if needed
                }

                // Dispose unmanaged resources here, if any
                _disposed = true;
            }
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        ~AgreementDetails()
        {
            Dispose(false);
        }
    }







    [WebMethod(EnableSession = true)]
    public static string abcd(IEnumerable<AgreementDetails> formData)
    {
        try
        {
            // Convert the IEnumerable to a List for processing
            List<AgreementDetails> formDataList = formData.ToList();

            string constr = ConfigurationManager.ConnectionStrings["tradedata"].ConnectionString;

            foreach (var data in formDataList)
            {
                // Handle file uploads
                var uploadedPaths = new Dictionary<string, string>();
                if (!string.IsNullOrEmpty(data.Path) && UploadFileToFtp(data.Pic, data.Path))
                {
                    uploadedPaths["ClientReceiptpath"] = GetUploadedPath("ClientReceiptpath", data.Path);
                }

                // Insert into database
                using (SqlConnection con = new SqlConnection(constr))
                {
                    const string insertQuery = @"
                INSERT INTO [tradedata].[tradeadmin].[aggrement] 
                (clientName, ClientID, TransactionAmount, ClientReceipt, PaymentReceipt, 
                 AgreementID, Agreementdocument, refer, percentage, 
                 Priority, TotalFund, StartDate, Term, expireDate, 
                 profitclient, Accountlink, CurrentTransaction, DaysInvestment, ClientReceiptpath, ifsc) 
                VALUES 
                (@clientName, @ClientID, @TransactionAmount, @ClientReceipt, @PaymentReceipt, 
                 @AgreementID, @Agreementdocument, @refer, @percentage, 
                 @Priority, @TotalFund, @StartDate, @Term, @expireDate, 
                 @profitclient, @Accountlink, @CurrentTransaction, @DaysInvestment, @ClientReceiptpath, @ifsc)";

                    using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@clientName", data.ClientName ?? string.Empty);
                        cmd.Parameters.AddWithValue("@ClientID", data.ClientID ?? string.Empty);
                        cmd.Parameters.AddWithValue("@TransactionAmount", data.TransactionAmount);
                        cmd.Parameters.AddWithValue("@ClientReceipt", data.ClientReceipt ?? string.Empty);
                        cmd.Parameters.AddWithValue("@PaymentReceipt", data.PaymentReceipt ?? string.Empty);
                        cmd.Parameters.AddWithValue("@AgreementID", data.AgreementID ?? string.Empty);
                        cmd.Parameters.AddWithValue("@Agreementdocument", data.AgreementDocument ?? string.Empty);
                        cmd.Parameters.AddWithValue("@refer", data.Refer ?? string.Empty);
                        cmd.Parameters.AddWithValue("@percentage", data.Percentage);
                        cmd.Parameters.AddWithValue("@Priority", data.Priority ?? string.Empty);
                        cmd.Parameters.AddWithValue("@TotalFund", data.TotalFund);
                        cmd.Parameters.AddWithValue("@StartDate", data.StartDate);
                        cmd.Parameters.AddWithValue("@Term", data.Term);
                        cmd.Parameters.AddWithValue("@expireDate", data.ExpireDate);
                        cmd.Parameters.AddWithValue("@profitclient", data.ProfitClient);
                        cmd.Parameters.AddWithValue("@Accountlink", data.AccountLink ?? string.Empty);
                        cmd.Parameters.AddWithValue("@CurrentTransaction", data.CurrentTransaction);
                        cmd.Parameters.AddWithValue("@DaysInvestment", data.DaysInvestment);
                        cmd.Parameters.AddWithValue("@ifsc", data.IFSC);

                        // Uploaded file paths
                        string clientReceiptPath = uploadedPaths.ContainsKey("ClientReceiptpath") ? uploadedPaths["ClientReceiptpath"] : string.Empty;
                        cmd.Parameters.AddWithValue("@ClientReceiptpath", clientReceiptPath);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }

            return "Success";
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine("ex.Message");
            return "Error: ex.Message";
        }
    }






    [WebMethod]
    public static string GenerateNewAgreementID(string clientID)
    {
        string constr = ConfigurationManager.ConnectionStrings["tradedata"].ConnectionString;

        if (string.IsNullOrEmpty(clientID) || clientID.Length < 5)
            return "Invalid Client ID";

        string clientSuffix = clientID.Substring(clientID.Length - 5); // Last 5 digits of ClientID
        string prefix = "AG" + clientSuffix;
        string newAgreementID = "";

        using (SqlConnection conn = new SqlConnection(constr))
        {
            conn.Open();

            // Insert a new record to get the auto-increment Id
            SqlCommand insertCmd = new SqlCommand(
                "INSERT INTO AgreementID (ClientID) OUTPUT INSERTED.Id VALUES (@ClientID)", conn);
            insertCmd.Parameters.AddWithValue("@ClientID", clientID);

            int newId = (int)insertCmd.ExecuteScalar(); // Get the auto-generated Id

            // Generate the AgreementID using the new Id
            newAgreementID = prefix + "_" + newId;


            // Update the AgreementID field
            SqlCommand updateCmd = new SqlCommand(
                "UPDATE AgreementID SET AgreementID = @AgreementID WHERE Id = @Id", conn);
            updateCmd.Parameters.AddWithValue("@AgreementID", newAgreementID);
            updateCmd.Parameters.AddWithValue("@Id", newId);
            updateCmd.ExecuteNonQuery();
        }

        return newAgreementID;
    }


    [WebMethod]
    public static object GetBankDetails(string clientId)
    {
        string constr = ConfigurationManager.ConnectionStrings["tradedata"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(constr))
        {
            conn.Open();
            string query = "SELECT BankAccount, IFSC FROM [tradedata].[tradeadmin].[registrations] WHERE ClientId = @ClientId";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@ClientId", clientId);

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                return new
                {
                    BankAccount = reader["BankAccount"] != DBNull.Value ? reader["BankAccount"].ToString() : "",
                    IFSC = reader["IFSC"] != DBNull.Value ? reader["IFSC"].ToString() : ""
                };
            }
        }

        return null; // Return null if no record is found
    }


}

