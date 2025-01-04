<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Adminapprove.aspx.cs" Inherits="Adminapprove" %>
<%@ Register TagPrefix="ucx1" TagName="MyUserControl11" Src="~/sidenav2.ascx" %>
<%@ Register TagPrefix="ucx" TagName="MyUserControl1" Src="~/header.ascx" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Monthly Profits</title>
        <ucx:MyUserControl1 runat="server" />

    <style>
        /* General Styles */
body {
    background-color: #f4f4f4;
}

.container {
    max-width: 1200px;
}

/* Header Section */
.header .search-bar {
    border-radius: 20px;
}

.header .page-info {
    font-size: 18px;
}

.header .profile-icon {
    width: 40px;
    height: 40px;
}

/* Monthly Profits Section */
.monthly-profits .profit-card {
    border-radius: 10px;
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
}

/* Table Section */
.data-table th, 
.data-table td {
    text-align: center;
    vertical-align: middle;
}

.data-table th {
    background-color: #f8f9fa;
    font-weight: bold;
}

/* Footer Section */
.footer {
    font-size: 14px;
}

.footer .pagination .page-link {
    color: #007bff;
}

.footer .pagination .page-link:hover {
    background-color: #007bff;
    color: white;
}
#header{
    margin-top: 100px;
    margin-left: 550px;
}

    </style>

</head>
<body>
    <div class="container mt-4">
             <ucx1:MyUserControl11 runat="server" />

       

        <!-- Monthly Profits Section -->
        <div id="profitbox">
             <div class="row text-center mb-4 monthly-profits">
     <div class="col-md-4">
         <div class="card bg-primary text-white p-3 profit-card">
             <h5>500000.00</h5>
             <p class="mb-0">Total Funds</p>
         </div>
     </div>
     <div class="col-md-4">
         <div class="card bg-danger text-white p-3 profit-card">
             <h5>500,000.00</h5>
             <p class="mb-0">Client Payments</p>
         </div>
     </div>
     <div class="col-md-4">
         <div class="card bg-success text-white p-3 profit-card">
             <h5>250,000.00</h5>
             <p class="mb-0">Team Payments</p>
         </div>
     </div>
 </div>
        </div>
       

        <!-- Table Section -->
        <div class="card">
            <div class="card-body">
                <table class="table table-bordered table-hover data-table">
                    <thead class="thead-light">
                        <tr>
                            <th>Sl No</th>
                            <th>Agreement ID</th>
                            <th>Client Name</th>
                            <th>Funds</th>
                            <th>Term</th>
                            <th>Priority</th>
                            <th>Start Date</th>
                            <th>Expire Date</th>
                            <th>Bank Account / UPI</th>
                            <th>Refer By</th>
                            <th>Payments</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>AG8317001</td>
                            <td>ABC RJ</td>
                            <td>200,000.00</td>
                            <td>3</td>
                            <td>P2</td>
                            <td>02-10-2024</td>
                            <td>03-01-2025</td>
                            <td>738200010075419<br>PNB</td>
                            <td>Danish</td>
                            <td><button class="btn btn-primary btn-sm">→</button></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>AG2589047</td>
                            <td>MGI POD</td>
                            <td>700,000.00</td>
                            <td>6</td>
                            <td>P2</td>
                            <td>01-12-2024</td>
                            <td>02-03-2025</td>
                            <td>909054644869/ybl</td>
                            <td>Danish</td>
                            <td><button class="btn btn-primary btn-sm">→</button></td>
                        </tr>
                        <!-- Add more rows as needed -->
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Footer Section -->
        <div class="footer d-flex justify-content-between align-items-center mt-4">
            <p class="mb-0">Showing 1 to 10 of 130 entries</p>
            <nav>
                <ul class="pagination pagination-sm mb-0">
                    <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                </ul>
            </nav>
        </div>
    </div>

  
</body>
</html>

</html>

</body>
</html>
    <script src="script.js"></script>
</body>
</html>
