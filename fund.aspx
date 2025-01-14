<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fund.aspx.cs" Inherits="fund" %>
<%@ Register TagPrefix="ucx1" TagName="MyUserControl11" Src="~/sidenav2.ascx" %>
<%@ Register TagPrefix="ucx" TagName="MyUserControl1" Src="~/header.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>create agreement</title>

    <ucx:MyUserControl1 runat="server" />

    <style>
       <style>
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f3f6fa;
        color: #333;
    }

    .dashboard {
        width: 90%;
        margin: 0 auto;
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        margin-top: 50px;
    }

    .section {
        flex: 1 1 calc(30% - 20px);
        box-shadow: rgba(0, 0, 0, 0.15) 0px 4px 6px;
        padding: 20px;
        border-radius: 10px;
        background-color: #ffffff;
        text-align: center;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .section:hover {
        transform: translateY(-5px);
        box-shadow: rgba(0, 0, 0, 0.2) 0px 8px 12px;
    }

    .section h2 {
        margin-bottom: 15px;
        font-size: 1.5rem;
        color: #087a9f;
        text-transform: uppercase;
    }

    .card-container {
        display: flex;
        gap: 10px;
        justify-content: space-between;
    }

    .card {
        flex: 1;
        padding: 15px;
        border-radius: 8px;
        color: #ffffff;
        text-align: center;
        transition: transform 0.3s ease;
    }

    .card:hover {
        transform: scale(1.05);
    }

    .card.blue {
        background-color: #087a9f;
    }

    .card.green {
        background-color: #28a745;
    }

    .card.red {
        background-color: #dc3545;
    }

    .card p.amount {
        font-size: 1.2rem;
        font-weight: bold;
        margin: 5px 0;
    }

    .card button {
        margin-top: 10px;
        padding: 8px 15px;
        background-color: #ffffff;
        color: inherit;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 0.9rem;
        transition: background-color 0.3s ease;
    }

    .card button:hover {
        background-color: rgba(255, 255, 255, 0.8);
    }

    .right-section {
        flex: 1 1 calc(70% - 20px);
        background-color: #ffffff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: rgba(0, 0, 0, 0.15) 0px 4px 6px;
        overflow-x: auto;
    }

    .right-section h2 {
        margin-bottom: 20px;
        font-size: 1.5rem;
        color: #087a9f;
        text-transform: uppercase;
        border-bottom: 2px solid #087a9f;
        display: inline-block;
        padding-bottom: 5px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }

    table th,
    table td {
        padding: 12px 15px;
        text-align: center;
        font-size: 0.9rem;
        border: 1px solid #ddd;
    }

    table th {
        background-color: #087a9f;
        color: white;
        text-transform: uppercase;
        font-size: 0.95rem;
    }

    table tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    table tr:hover {
        background-color: #f1f1f1;
    }

    table td {
        font-size: 0.9rem;
        color: #555;
    }

    .upload-btn {
        background-color: #087a9f;
        padding: 8px 15px;
        border-radius: 4px;
        color: white;
        font-size: 0.9rem;
        border: none;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .upload-btn:hover {
        background-color: #005f75;
        transform: scale(1.05);
    }

    .card-container {
    display: flex;
    gap: 112px;
    justify-content: space-between;
}

    .left-section {
    width: 100%;
}
</style>

   

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Fetch data using an AJAX call
            fetch("fund.aspx/GetAgreementData", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json; charset=utf-8"
                },
            })
                .then(response => response.json())
                .then(data => {
                    const tableBody = document.querySelector("#data-table tbody");
                    tableBody.innerHTML = ""; // Clear existing rows

                    // Iterate through the data and append rows to the table
                    data.d.forEach((item, index) => {
                        const row = document.createElement("tr");
                        row.innerHTML = `
                            <td>${index + 1}</td>
                            <td>${item.TID}</td>
                            <td>${item.ClientName}</td>
                            <td>${item.Capital}</td>
                            <td>${item.Term}</td>
                            <td>${item.RefBy}</td>
                            <td class="ClientReceiptx"><input type="file"></td>
                            <td><button id="" class="upload-btn">Upload</button></td>
                        `;
                        tableBody.appendChild(row);
                    });
                })
                .catch(error => console.error("Error fetching data:", error));


            $('.btn-upload').on('click', function () {
                $(this).next('.file-input').trigger('click'); // Opens the file input dialog
            });

            $('.file-input').on('change', function () {
                const fileInput = $(this);
                const file = this.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        const base64Data = e.target.result;
                        const fileName = file.name;

                        // Update the hidden fields within the same row
                        fileInput.siblings('.hidden-base64').val(base64Data);   // Set base64 data
                        fileInput.siblings('.hidden-filename').val(fileName);    // Set file name
                    };
                    reader.readAsDataURL(file); // Read file as base64
                }
            });





        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <ucx1:MyUserControl11 runat="server" />
        </div>

        <table>
    <tr>
        <td class="ClientReceiptx">
            <input type="file" class="file-input">
            <input type="hidden" value="" class="hidden-base64" runat="server">
            <input type="hidden" value="" class="hidden-filename" runat="server">
        </td>
    </tr>
    <!-- Repeat rows as needed -->
</table>


  <div class="dashboard">
    <!-- Left Section -->
    <div class="left-section">
      <!-- Fund Overview -->
      <div class="section">
        <h2>Fund Overview</h2>
        <div class="card-container">
          <div class="card blue">
            <p class="amount">7,500,000.00</p>
            <p>Investor Funds</p>
            <button>View</button>
          </div>
          <div class="card green">
            <p class="amount">400,000.00</p>
            <p>Monthly Profit</p>
            <button>View</button>
          </div>
          <div class="card red">
            <p class="amount">425,000.00</p>
            <p>Current Expires</p>
            <button>View</button>
          </div>
        </div>
      </div>

      <!-- Investor Status -->
      <div class="section">
        <h2>Investor Status</h2>
        <div class="card-container">
          <div class="card blue">
            <p class="amount">234</p>
            <p>Investor List</p>
            <button>View</button>
          </div>
          <div class="card green">
            <p class="amount">25</p>
            <p>New Investor<br>in Month</p>
            <button>View</button>
          </div>
          <div class="card red">
            <p class="amount">19</p>
            <p>Pending Transactions</p>
            <button>View</button>
          </div>
        </div>
      </div>

      <!-- Team Overview -->
      <div class="section">
        <h2>Team Overview</h2>
        <div class="card-container">
          <div class="card blue">
            <p class="amount">500,000.00</p>
            <p>Team Capital</p>
            <button>View</button>
          </div>
          <div class="card green">
            <p class="amount">200,000.00</p>
            <p>Team Transactions</p>
            <button>View</button>
          </div>
          <div class="card red">
            <p class="amount">10</p>
            <p>Team Pending Action</p>
            <button>View</button>
          </div>
        </div>
      </div>
    </div>

        <div class="dashboard">
            <!-- Right Section -->
            <div class="right-section">
                <h2>Pending Agreements</h2>
                <table id="data-table">
                    <thead>
                        <tr>
                            <th>Sl No</th>
                            <th>T ID</th> <!-- Hidden with CSS -->
                            <th>Client Name</th>
                            <th>Capital</th>
                            <th>Term</th>
                            <th>Ref By</th>
                            <th>Document</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                       
                    </tbody>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
