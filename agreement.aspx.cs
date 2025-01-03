using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;
using System.Net;
using System.Activities.Statements;


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

    public class AgreementDetails
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
        public DateTime CurrentTransaction { get; set; }
        public int DaysInvestment { get; set; }
        public string Pic { get; set; }
        public string Path { get; set; }
        public string IFSC { get; set; }
    }

    [WebMethod]
    public static string abcd(AgreementDetails formData)
    {
        try
        {
            string picFilePath = string.Empty;

            // Check if Pic and Path are provided
            if (!string.IsNullOrEmpty(formData.Pic) && !string.IsNullOrEmpty(formData.Path))
            {
                bool picUploaded = UploadFileToFtp(formData.Pic, formData.Path);
                if (picUploaded)
                {
                    picFilePath = "https://msksoftware.co.in/forestdoc/" + formData.Path;
                }
                else
                {
                    return "Error: File upload failed.";
                }
            }

            string constr = ConfigurationManager.ConnectionStrings["tradedata"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                const string insertQuery = @"
            INSERT INTO [tradedata].[tradeadmin].[aggrement] 
            (ClientName, ClientID, TransactionAmount, ClientReceipt, PaymentReceipt, AgreementID, 
             AgreementDocument, Refer, Percentage, Priority, TotalFund, StartDate, Term, 
             ExpireDate, ProfitClient, AccountLink, CurrentTransaction, DaysInvestment, ClientReceiptpath, IFSC)
            VALUES 
            (@ClientName, @ClientID, @TransactionAmount, @ClientReceipt, @PaymentReceipt, @AgreementID, 
             @AgreementDocument, @Refer, @Percentage, @Priority, @TotalFund, @StartDate, @Term, 
             @ExpireDate, @ProfitClient, @AccountLink, @CurrentTransaction, @DaysInvestment, @ClientReceiptpath, @IFSC)";

                using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                {
                    cmd.Parameters.AddWithValue("@ClientName", formData.ClientName ?? string.Empty);
                    cmd.Parameters.AddWithValue("@ClientID", formData.ClientID ?? string.Empty);
                    cmd.Parameters.AddWithValue("@TransactionAmount", formData.TransactionAmount);
                    cmd.Parameters.AddWithValue("@ClientReceipt", formData.ClientReceipt ?? string.Empty);
                    cmd.Parameters.AddWithValue("@PaymentReceipt", formData.PaymentReceipt ?? string.Empty);
                    cmd.Parameters.AddWithValue("@AgreementID", formData.AgreementID ?? string.Empty);
                    cmd.Parameters.AddWithValue("@AgreementDocument", formData.AgreementDocument ?? string.Empty);
                    cmd.Parameters.AddWithValue("@Refer", formData.Refer ?? string.Empty);
                    cmd.Parameters.AddWithValue("@Percentage", formData.Percentage);
                    cmd.Parameters.AddWithValue("@Priority", formData.Priority ?? string.Empty);
                    cmd.Parameters.AddWithValue("@TotalFund", formData.TotalFund);
                    cmd.Parameters.AddWithValue("@StartDate", formData.StartDate);
                    cmd.Parameters.AddWithValue("@Term", formData.Term);
                    cmd.Parameters.AddWithValue("@ExpireDate", formData.ExpireDate);
                    cmd.Parameters.AddWithValue("@ProfitClient", formData.ProfitClient);
                    cmd.Parameters.AddWithValue("@AccountLink", formData.AccountLink ?? string.Empty);
                    cmd.Parameters.AddWithValue("@CurrentTransaction", formData.CurrentTransaction);
                    cmd.Parameters.AddWithValue("@DaysInvestment", formData.DaysInvestment);
                    cmd.Parameters.AddWithValue("@ClientReceiptpath", picFilePath ?? string.Empty);
                    cmd.Parameters.AddWithValue("@IFSC", formData.IFSC ?? string.Empty);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            return "Success";
        }
        catch (Exception ex)
        {
            // Log the error for debugging purposes
            System.Diagnostics.Debug.WriteLine(ex.Message);
            return ex.Message;
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
