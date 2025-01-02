<%@ Page Language="C#" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" %>

<%@ Register TagPrefix="ucx1" TagName="MyUserControl11" Src="~/sidenav2.ascx" %>
<%@ Register TagPrefix="ucx" TagName="MyUserControl1" Src="~/header.ascx" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" />
       <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.5.0/css/responsive.dataTables.min.css" />

        <style>
        /* General Reset */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f7fa;
        }


        .profile{
            margin:0 auto;
        }
        /* Header Cards (Top Section) */
.profile-header {
    display: flex;
    justify-content: space-around;
    margin-top: 85px;
    margin-left: 85px;
    margin-bottom: 0;
    background-color: #ffffff;
    padding: 10px;
    border-radius: 10px;
}

.card {
    width: 23%;
    text-align: center;
    padding: 15px 10px;
    border-radius: 10px;
    color: #fff !important;
    font-size: 1.3em;
    font-weight: bold;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

        .card span {
            display: block;
            margin-top: 5px;
            font-size: 0.9em;
            font-weight: normal;
        }

        .current-funds { background-color: #234168 !important; }
        .total-profit { background-color: #4caf50 !important; }
        .total-agreement { background-color: #fbc02d !important; }
        .closed-agreement { background-color: #e53935 !important; }

        /* Main Content (Left-Right Layout) */
        .content {
            display: flex;
            gap: 20px;
            margin-top:10px !important; 
        }

        /* Left Section (Profile Details) */
.profile-details {
    width: 25%;
    background-color: #234168;
    color: #fff;
    padding: 20px;
    border-radius: 10px;
    border: 2px solid #fff;
    box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
}

.profile-details h2 {
    font-size: 21px;
    font-weight: 600;
    border-bottom: 2px solid #3b7be6;
    padding-bottom: 5px;
    margin-bottom: 15px;
}

        .profile-details p {
            margin: 10px 0;
            font-size: 0.9em;
        }

.profile-details button {
    margin-top: 10px;
    padding: 5px 15px;
    border: none;
    background-color: #f9a825;
    color: #fff;
    border-radius: 5px;
    cursor: pointer;
    font-size: 17px;
    width: 100%;
}
        .profile-details button:hover {
            background-color: #bb6f00;
        }

        /* Right Section (Table and Tabs) */
        .main-content {
            width: 75%;
        }

        /* Tabs */
.tabs {
    display: flex;
    justify-content: flex-start;
    margin-bottom: 15px;
    width: 25%;
    position: absolute;
    padding: 5px;
    border-radius: 10px;
}

.tab-btn {
    padding: 10px 20px;
    font-size: 0.9em;
    cursor: pointer;
    background-color: #1e3d5b;
    color: #fff;
    border: 1px solid #ddd;
    border-radius: 5px;
    margin-right: 5px;
    text-align: center;
    border: 2px solid #fff;
    box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
}

        .tab-btn.active {
            background-color: #4caf50;
        }

        /* Filters */
        .filters {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    margin-bottom: 10px;
    gap: 15px;
}

        .filters select {
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ddd;
            font-size: 0.9em;
        }

        /* Table Section */
        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            background-color: white;
            box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            overflow: hidden;
        }

        table th,
        table td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
            font-size: 0.9em;
        }

        table th {
            background-color: #087a9f;
            color: white;
            font-weight: bold;
        }

table a {
    color: #3b7be6;
    text-decoration: none;
    font-size: 12px !important;
    white-space: nowrap;
}

        table a:hover {
            text-decoration: underline;
        }
        .badge{
            padding:9px !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <ucx1:MyUserControl11 runat="server" />

               <div calss="profile">
                                        <div class="profile-header">
            <div class="card current-funds">500,000.00<br><span>Current Funds</span></div>
            <div class="card total-profit">76,000.00<br><span>Total Profit</span></div>
            <div class="card total-agreement">08<br><span>Total Agreement</span></div>
            <div class="card closed-agreement">02<br><span>Closed Agreement</span></div>
        </div>

        <!-- Main Content: Left-Right Layout -->
        <div class="content">
            <!-- Left Section: Profile Details -->
            <div class="profile-details">
                <h2>Basic Details</h2>
                <p><strong>Client Name:</strong> ABC RKJ</p>
                <p><strong>Client ID:</strong> ABC7631</p>
                <p><strong>Joining Date:</strong> 01-05-2024 (6 Months)</p>
                <p><strong>Refer By:</strong> SK DANISH RAHIM</p>
                <p><strong>Mobile:</strong> 8249756314</p>
                <p><strong>Total Agreement:</strong> 08</p>
                <p><strong>Current Capital:</strong> 500,000.00</p>
                <p><strong>Total Profit:</strong> 76,000.00</p>
                <p><strong>Nominee:</strong> MKJ RKJ</p>
                <p><strong>District:</strong> Khordha</p>
                <button>Edit</button>
            </div>

            <!-- Right Section: Table and Tabs -->
            <div class="main-content">
                <!-- Tabs -->
                <div class="tabs">
                    <button type="button" class="tab-btn active"><a href="profile.aspx" style="text-decoration: none; color: #fff;">Documents</a></button>
					<button type="button" class="tab-btn"><a href="profile2.aspx" style="text-decoration: none; color: #fff;">Payment History</a></button>
                </div>

                <!-- Table -->
                <div class="table-container">
                    <div class="filters">
                        <select id="funds-filter">
                            <option value="">Choose status</option>
                            <option value="500,000.00">500,000.00</option>
                            <option value="200,000.00">200,000.00</option>
                        </select>
                    </div>

<table id="data-table">
    <thead>
        <tr>
            <th>Sl No</th>
            <th>Agreement Id</th>
            <th>Funds (INR)</th>
            <th>Term</th>
            <th>Start Date</th>
            <th>Expiry Date</th>
            <th>Priority</th>
            <th>Status</th>
            <th>Total Profit (INR)</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>A12345</td>
            <td>₹82,00,000</td>
            <td>2 years</td>
            <td>2022-01-01</td>
            <td>2024-01-01</td>
            <td>High</td>
            <td><span class="badge bg-warning">Pending</span></td>
            <td>₹20,50,000</td>
            <td><a href="#" class="btn btn-info btn-sm">Read More</a></td>
        </tr>
        <tr>
            <td>2</td>
            <td>B67890</td>
            <td>₹1,64,00,000</td>
            <td>3 years</td>
            <td>2021-05-01</td>
            <td>2024-05-01</td>
            <td>Medium</td>
            <td><span class="badge bg-success">Running</span></td>
            <td>₹41,00,000</td>
            <td><a href="#" class="btn btn-info btn-sm">Read More</a></td>
        </tr>
        <tr>
            <td>3</td>
            <td>C11223</td>
            <td>₹1,23,00,000</td>
            <td>1 year</td>
            <td>2023-03-01</td>
            <td>2024-03-01</td>
            <td>Low</td>
            <td><span class="badge bg-danger">Closed</span></td>
            <td>₹8,20,000</td>
            <td><a href="#" class="btn btn-info btn-sm">Read More</a></td>
        </tr>
        <tr>
            <td>4</td>
            <td>D45678</td>
            <td>₹4,10,00,000</td>
            <td>5 years</td>
            <td>2020-01-01</td>
            <td>2025-01-01</td>
            <td>High</td>
            <td><span class="badge bg-success">Running</span></td>
            <td>₹98,40,000</td>
            <td><a href="#" class="btn btn-info btn-sm">Read More</a></td>
        </tr>
        <tr>
            <td>5</td>
            <td>E12367</td>
            <td>₹2,46,00,000</td>
            <td>4 years</td>
            <td>2022-07-01</td>
            <td>2026-07-01</td>
            <td>Medium</td>
            <td><span class="badge bg-warning">Pending</span></td>
            <td>₹65,60,000</td>
            <td><a href="#" class="btn btn-info btn-sm">Read More</a></td>
        </tr>
        <tr>
            <td>6</td>
            <td>F56789</td>
            <td>₹98,40,000</td>
            <td>2 years</td>
            <td>2023-02-01</td>
            <td>2025-02-01</td>
            <td>High</td>
            <td><span class="badge bg-danger">Closed</span></td>
            <td>₹36,90,000</td>
            <td><a href="#" class="btn btn-info btn-sm">Read More</a></td>
        </tr>
        <tr>
            <td>7</td>
            <td>G23456</td>
            <td>₹2,05,00,000</td>
            <td>3 years</td>
            <td>2022-04-01</td>
            <td>2025-04-01</td>
            <td>Low</td>
            <td><span class="badge bg-warning">Pending</span></td>
            <td>₹49,20,000</td>
            <td><a href="#" class="btn btn-info btn-sm">Read More</a></td>
        </tr>
        <tr>
            <td>8</td>
            <td>H34567</td>
            <td>₹1,43,50,000</td>
            <td>1 year</td>
            <td>2023-01-01</td>
            <td>2024-01-01</td>
            <td>Medium</td>
            <td><span class="badge bg-success">Running</span></td>
            <td>₹28,70,000</td>
            <td><a href="#" class="btn btn-info btn-sm">Read More</a></td>
        </tr>
        <tr>
            <td>9</td>
            <td>I23456</td>
            <td>₹1,80,40,000</td>
            <td>2 years</td>
            <td>2021-08-01</td>
            <td>2023-08-01</td>
            <td>High</td>
            <td><span class="badge bg-danger">Closed</span></td>
            <td>₹45,10,000</td>
            <td><a href="#" class="btn btn-info btn-sm">Read More</a></td>
        </tr>
        <tr>
            <td>10</td>
            <td>J78901</td>
            <td>₹2,87,00,000</td>
            <td>4 years</td>
            <td>2020-10-01</td>
            <td>2024-10-01</td>
            <td>Medium</td>
            <td><span class="badge bg-warning">Pending</span></td>
            <td>₹82,00,000</td>
            <td><a href="#" class="btn btn-info btn-sm">Read More</a></td>
        </tr>
    </tbody>
</table>
            </div>
        </div>

               </div>

        </div>
    </form>

        <!-- jQuery --> 
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <!-- DataTable JS -->
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js"></script>

    <script>
        $(document).ready(function () {
            var table = $('#data-table').DataTable({
                pageLength: 5,
                responsive: true,
                dom: 'Bfrtip'
            });

            $('#status-filter').on('change', function () {
                const filterValue = $(this).val();
                table.column(6).search(filterValue).draw();
            });
        });
    </script>
</body>
</html>

