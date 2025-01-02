<%@ Page Language="C#" AutoEventWireup="true" CodeFile="investorlist.aspx.cs" Inherits="investorlist" %>
<%@ Register TagPrefix="ucx1" TagName="MyUserControl11" Src="~/sidenav2.ascx" %>
<%@ Register TagPrefix="ucx" TagName="MyUserControl1" Src="~/header.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Investor lists</title>
        <ucx:MyUserControl1 runat="server" />

    <!-- DataTable CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.5.0/css/responsive.dataTables.min.css" />

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f8fc;
        }

.investors-list-container {
    padding: 10px;
    max-width: 1200px;
    margin: 0 auto;
    background-color: #d1e4ff;
    border-radius: 8px;
    box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.1);
    margin-top: 85px;
    margin-left: 111px;
}
.investors-list-container h2{
    display: flex;
    font-size: 25px;
    font-weight: 600;
    padding: 12px 5px;

}
        h2 {
            font-size: 1.8em;
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

.summary-cards {
    display: flex
;
    justify-content: center;
    gap: 20px;
    margin-bottom: 20px;
    width: 48%;
    background-color: #ffffff;
    padding: 10px;
    border-radius: 10px;
}
.summary-cards p {
    margin-top: 0;
    margin-bottom: 1rem;
    color: #fff;
}
.summary-cards h3 {

    color: #fff;
}

.card {
    flex: 1;
    padding: 8px;
    text-align: center;
    border-radius: 8px;
    color: white;
    font-weight: 500;
    font-size: 18px;
}

        .total-investors {
            background-color: #087a9f !important;
        }

        .inactive-investors {
            background-color: #830000 !important;
        }

        .actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .filter-dropdown {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
        }

        .register-btn {
            padding: 10px 15px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        .investors-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            background-color: white;
            box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            overflow: hidden;
        }

        .investors-table th,
        .investors-table td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
            font-size: 0.9em;
        }

        .investors-table th {
            background-color: #087a9f;
            color: white;
            font-weight: bold;
        }

        .status {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 0.9em;
            color: white;
        }

        .status.active {
            background-color: #28a745;
        }

        .status.inactive {
            background-color: #6c757d;
        }

        .profile-link {
            color: #087a9f;
            text-decoration: none;
            font-weight: bold;
        }

        .profile-link:hover {
            text-decoration: underline;
        }
    </style>

  
     <script>
         $(document).ready(function () {
             var table = $('#datatable').DataTable({
                 pageLength: 5,
                 responsive: true,
                 dom: 'Bfrtip'
             });

             $('#status-filter').on('change', function () {
                 const filterValue = $(this).val();
                 table.column(6).search(filterValue).draw();
             });

             $('.register-btn').on('click', function () {
         
                 window.location.href = 'Transaction.aspx';
             });

             $.ajax({
                 type: "POST",
                 url: "investorlist.aspx/GetClientData",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function (response) {
                     var data = response.d.data;
                     var table = $("#datatable tbody");
                     table.empty(); // Clear any existing rows

                     $.each(data, function (index, item) {
                         table.append(`
                    <tr>
                        <td>${index + 1}</td>
                        <td>${item.ClientId}</td>
                        <td>${item.ClientName}</td>
                        <td>${item.ActiveFunds || "-"}</td>
                        <td>${item.JoiningDate}</td>
                        <td>${item.Mobile}</td>
                        <td>${item.Status}</td>
                        <td>${item.Place}</td>
                        <td>${item.ReferBy}</td>
                        <td>${item.ActiveDocuments ? "Yes" : "No"}</td>
                        <td><button class="btn btn-primary btn-sm"><a href="profile.aspx"  style="color: #fff; text-decoration: none;">View</a></button></td>
                    </tr>
                `);
                     });
                 },
                 error: function (err) {
                     console.error("Error fetching data:", err);
                 }
             });




         });
     </script>


</head>
<body>
    <form id="form1" runat="server">
        <div>
            <ucx1:MyUserControl11 runat="server" />

            <div class="investors-list-container">
                <h2>Investors List</h2>
                <div class="summary-cards">
                    <div class="card total-investors">
                        <h3>257</h3>
                        <p>Total Investors</p>
                    </div>
                    <div class="card inactive-investors">
                        <h3>3</h3>
                        <p>Inactive Investors</p>
                    </div>
                </div>
                <div class="actions">
                    <select id="status-filter" class="filter-dropdown">
                        <option value="">Choose Status: All</option>
                        <option value="Active">Active</option>
                        <option value="Inactive">Inactive</option>
                    </select>
                    <button type="button" class="register-btn">Register Investor</button>
                </div>
<table id="datatable" class="investors-table display responsive nowrap">
    <thead>
        <tr>
            <th>Sl No</th>
            <th>Client ID</th>
            <th>Client Name</th>
            <th>Active Funds</th>
            <th>Joining Date</th>
            <th>Mobile</th>
            <th>Status</th>
            <th>Place</th>
            <th>Referred By</th>
            <th>Active Documents</th>
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
