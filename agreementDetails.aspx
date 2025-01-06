<%@ Page Language="C#" AutoEventWireup="true" CodeFile="agreementDetails.aspx.cs" Inherits="agreementDetails" %>
<%@ Register TagPrefix="ucx1" TagName="MyUserControl11" Src="~/sidenav2.ascx" %>
<%@ Register TagPrefix="ucx" TagName="MyUserControl1" Src="~/header.ascx" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <ucx:MyUserControl1 runat="server" />
    <title></title>

<style>
.agreement-container {
    max-width: 1200px;
    margin: auto;
    padding: 20px;
    border-radius: 8px;
    margin-top: 45px;
}

    .profile-header {
    display: flex
;
    justify-content: space-between;
    align-items: center;
}

.profile-header h2 {
    color: #1a2947;
    font-size: 28px;
    font-weight: 600;
}

.profile-header h3 {
    color: #1a2947;
    font-size: 28px;
    font-weight: 600
}
.basic-details {
    display: flex
;
    justify-content: space-around;
    background-color: #1a2947;
    color: #fff;
    padding: 10px 20px;
    border-radius: 8px;
    margin-bottom: 20px;
    width: 70%;
}
.bd {
    margin: 0 0 10px 0;
    font-size: 22px;
    font-weight: 600;
    padding-left: 16px;
}

.basic-details .details-left p, .basic-details .details-right p {
    margin: 9px 0;
    letter-spacing: .7px;
    font-size: 17px;
}
    .download-btn {
      background-color: #087a9f;
      color: #fff;
      border: none;
      padding: 10px 15px;
      border-radius: 5px;
      cursor: pointer;
    }

    .download-btn:hover {
      background-color: #065f7d;
    }

    .transaction-details h3 {
    margin-bottom: 10px;
    color: #000000;
    margin: 0 0 10px 0;
    font-size: 22px;
    font-weight: 600;
    padding-left: 16px;
}

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 10px;
    }

    table th, table td {
    border: 1px solid #ddd;
    text-align: center;
    padding: 10px;
    font-size: 15px;
}

    table th {
    background-color: #1a2947;
    color: #fff;
    font-size: 15px;
    font-weight: 500;
}

    table tbody tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    table tbody tr:hover {
      background-color: #eaf4f8;
    }
</style>
      <script>
          $(document).ready(function () {
              $('.btn-download').on('click', function () {
                  alert('Download functionality coming soon!');
              });

              const urlParams = new URLSearchParams(window.location.search);
              const agreementId = urlParams.get('AgreementID');
              console.log("Selected AgreementID:", agreementId);

              $("#Agreement").text(`Agreement ID: ${agreementId}`);

              if (agreementId) {
                  $.ajax({
                      type: "POST",
                      url: "agreementDetails.aspx/GetAgreementData",
                      data: JSON.stringify({ agreementId: agreementId }),
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: function (response) {
                          console.log(response.d); // Log the response to check if it's correct

                          const client = response.d[0]; // Access the first object in the array

                          if (client) {
                              // Ensure startDate and expireDate are defined
                              const startDate = client.StartDate || "N/A";
                              const expireDate = client.ExpireDate || "N/A";

                              const htmlContent = `
                    <div class="basic-details">
                        <div class="details-left">
                            <p><strong>Client Name:</strong> ${client.ClientName || "N/A"}</p>
                            <p><strong>Client ID:</strong> ${client.ClientId || "N/A"}</p>
                            <p><strong>Nominee:</strong> ${client.Nominee || "N/A"}</p>
                            <p><strong>Refer By:</strong> ${client.Refer || "N/A"}</p>
                            <p><strong>Account Link:</strong> ${client.Accountlink || "N/A"}</p>
                            <p><strong>Contact Number:</strong> ${client.Contact || "N/A"}</p>
                        </div>
                        <div class="details-right">
                            <p><strong>Agreement ID:</strong> ${client.AgreementID || "N/A"}</p>
                            <p><strong>Capital:</strong> ${client.Capital || "N/A"}</p>
                            <p><strong>Start Date:</strong> ${startDate}</p>
                            <p><strong>Expire Date:</strong> ${expireDate}</p>
                            <p><strong>Term:</strong> ${client.Term || "N/A"}</p>
                         
                            <p><strong>Agreement Status:</strong> ${client.Status || "Active"}</p>
                            <button class="download-btn">Download</button>
                        </div>
                    </div>
                `;

                              // Insert the content into the container
                              $("#detailsContainer").html(htmlContent);
                          } else {
                              alert("No data found for the provided Agreement ID.");
                          }
                      },
                      error: function (error) {
                          console.error("Error fetching data:", error.responseText);
                          alert("An error occurred while fetching agreement details. Please try again.");
                      }
                  });
              } else {
                  console.error("AgreementID not found in the URL.");
                  alert("Agreement ID is missing from the URL.");
              }






              if (agreementId) {
                  console.log("Agreement ID found:", agreementId);  // Log the Agreement ID to confirm it's set

                  $.ajax({
                      type: "POST",
                      url: "agreementDetails.aspx/GetAgreementDatax",
                      data: JSON.stringify({ agreementId: agreementId }),
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: function (response) {
                          console.log("AJAX success response:", response);  // Log the entire response to check if it contains the expected data

                          if (response.d && response.d.length > 0) {
                              let tableContent = '';
                              response.d.forEach((agreement, index) => {
                                  console.log(`Processing agreement ${index + 1}:`, agreement);  // Log each agreement object

                                  let transactionDate = new Date(agreement.StartDate);
                                  let currentDate = new Date();
                                  let daysInCurrentMonth = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0).getDate();
                                  let daysInvested = agreement.DaysInvestment ? agreement.DaysInvestment : 'N/A';

                                  let monthlyProfit = agreement.Profit;
                                  let dailyProfit = monthlyProfit / daysInCurrentMonth;

                                  // Log calculated values
                               

                                  tableContent += `
                        <tr>
                            <td>${index + 1}</td>
                            <td>${transactionDate}</td>
                            <td>${daysInCurrentMonth}</td>
                            <td>${agreement.TransactionAmount || "N/A"}</td>
                            <td><a href="${agreement.ClientReceipt || "#"}" target="_blank">View</a></td>
                            <td><a href="${agreement.ClientReceiptpath || "#"}" target="_blank">View</a></td>
                            <td>${agreement.StartDate}</td>
                            <td>${daysInvested}</td>
                            <td>${monthlyProfit || "N/A"}</td>
                            <td>${dailyProfit.toFixed(2) || "N/A"}</td>
                            <td>${(monthlyProfit * 1).toFixed(2) || "N/A"}</td>
                        </tr>
                    `;
                              });

                              $("#transactionTableBody").html(tableContent);
                              console.log("Table content inserted successfully.");  // Log when the table content is inserted
                          } else {
                              console.log("No data found for the provided Agreement ID.");  // Log if no data was returned
                              alert("No data found for the provided Agreement ID.");
                          }
                      },
                      error: function (error) {
                          console.error("AJAX error:", error);  // Log the entire error response to troubleshoot
                          alert("Error fetching data: " + error.responseText);  // Display error message
                      }
                  });
              } else {
                  console.error("AgreementID not found in the URL.");  // Log if Agreement ID is missing
              }






          });
      </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
              <ucx1:MyUserControl11 runat="server" />


   <div class="agreement-container">
    <div class="profile-header">
      <h2>Agreement Profile</h2>
      <h3 id="Agreement"></h3>
    </div>
    <h2 class="bd">Basic Details</h2>
    <div class="basic-details" id="detailsContainer">
   <div class="details-left" >
     <p><strong>Client Name:</strong> </p>
     <p><strong>Client ID:</strong> </p>
     <p><strong>Nominee:</strong></p>
     <p><strong>Refer By:</strong></p>
     <p><strong>Account Link:</strong> </p>
     <p><strong>Bank Name:</strong> </p>
     <p><strong>Contact Number:</strong> </p>
   </div>
   <div class="details-right">
     <p><strong>Agreement ID:</strong> </p>
     <p><strong>Capital:</strong></p>
     <p><strong>Start Date:</strong></p>
     <p><strong>Expire Date:</strong></p>
     <p><strong>Term:</strong> </p>
   
     <p><strong>Agreement Status:</strong> </p>
     <button class="download-btn">Download</button>
   </div>

    </div>
    <div class="transaction-details">
      <h3>Transaction Details</h3>
      <table>
        <thead>
          <tr>
            <th>Sl No</th>
            <th>Transaction Date</th>
            <th>Days in Current Month</th>
            <th>Transaction Amount</th>
            <th>Client File</th>
            <th>Manager File</th>
            <th>Investment Start Date</th>
            <th>Days Invested</th>
            <th>Monthly Profit</th>
            <th>Daily Profit</th>
            <th>1st Month Total Profit</th>
          </tr>
        </thead>
        <tbody id="transactionTableBody">
        
        </tbody>
      </table>
    </div>
  </div>
        </div>
    </form>
</body>
</html>