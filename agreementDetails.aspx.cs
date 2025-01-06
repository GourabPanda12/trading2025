using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class agreementDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static List<AgreementDetails> GetAgreementData(string agreementId)
    {
        List<AgreementDetails> agreementDetailsList = new List<AgreementDetails>();

        // Connection string to your database
        string connString = ConfigurationManager.ConnectionStrings["tradedata"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connString))
        {
            // SQL query
            string query = @"
        SELECT 
            a.[ClientId],
            r.[ClientName],
            r.[NomineeName] AS nominee,
            a.[refer],
            a.[Accountlink],
            a.AgreementID,
            a.[profit],
            r.[MobileNo] AS contact,
            a.[TotalFund] AS capital,
            a.[StartDate],
            a.[expireDate],
            a.[Term],
            a.[profitclient]
        FROM 
            [tradedata].[tradeadmin].[aggrement] a
        JOIN 
            [tradedata].[tradeadmin].[registrations] r
        ON 
            a.ClientId = r.ClientId
        WHERE 
            a.AgreementID = @AgreementID";

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@AgreementID", agreementId);

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                // Populate AgreementDetails object and add it to the list
                agreementDetailsList.Add(new AgreementDetails
                {
                    ClientId = reader["ClientId"].ToString(),
                    ClientName = reader["ClientName"].ToString(),
                    Nominee = reader["nominee"].ToString(),
                    Refer = reader["refer"].ToString(),
                    Accountlink = reader["Accountlink"].ToString(),
                    AgreementID = reader["AgreementID"].ToString(),
                    Profit = reader["profit"].ToString(),
                    Contact = reader["contact"].ToString(),
                    Capital = reader["capital"].ToString(),
                    StartDate = reader["StartDate"].ToString(),
                    ExpireDate = reader["expireDate"].ToString(),
                    Term = reader["Term"].ToString(),
                    ProfitClient = reader["profitclient"].ToString()
                });
            }
        }

        // Directly return the list
        return agreementDetailsList;
    }

    public class AgreementDetails
    {
        public string ClientId { get; set; }
        public string ClientName { get; set; }
        public string Nominee { get; set; }
        public string Refer { get; set; }
        public string Accountlink { get; set; }
        public string AgreementID { get; set; }
        public string Profit { get; set; }
        public string Contact { get; set; }
        public string Capital { get; set; }
        public string StartDate { get; set; }
        public string ExpireDate { get; set; }
        public string Term { get; set; }
        public string ProfitClient { get; set; }
    }

    [WebMethod]
    public static List<AgreementData> GetAgreementDatax(string agreementId)
    {
        List<AgreementData> agreementsList = new List<AgreementData>();

        try
        {
            string connString = ConfigurationManager.ConnectionStrings["tradedata"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                // Updated query based on provided SQL
                string query = @"
                SELECT  
                    [TransactionAmount],
[StartDate],
                    [ClientReceipt],
                    [CurrentTransaction],
                    [DaysInvestment],
                    [ClientReceiptpath],
                    [profit]
                FROM [tradedata].[tradeadmin].[aggrement]
                WHERE [AgreementID] = @AgreementID";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@AgreementID", agreementId);

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    // Map the data to AgreementData object
                    AgreementData agreement = new AgreementData
                    {
                        TransactionAmount = reader["TransactionAmount"].ToString(),
                        StartDate = Convert.ToDateTime(reader["StartDate"]).ToString("dd/MM/yyyy"),
                        ClientReceipt = reader["ClientReceipt"].ToString(),
                        CurrentTransaction = Convert.ToDateTime(reader["CurrentTransaction"]).ToString("dd/MM/yyyy"),
                        DaysInvestment = reader["DaysInvestment"].ToString(),
                        ClientReceiptPath = reader["ClientReceiptpath"].ToString(),
                        Profit = reader["profit"].ToString()
                    };

                    agreementsList.Add(agreement);
                }
            }
        }
        catch (Exception ex)
        {
            // Log the error or handle it accordingly
            return new List<AgreementData> { new AgreementData { TransactionAmount = ex.Message } };
        }

        return agreementsList;
    }


    public class AgreementData
    {
        public string TransactionAmount { get; set; }
        public string ClientReceipt { get; set; }
        public string CurrentTransaction { get; set; }
        public string DaysInvestment { get; set; }
        public string ClientReceiptPath { get; set; }
        public string Profit { get; set; }
        public string StartDate { get; set; }

    }


}