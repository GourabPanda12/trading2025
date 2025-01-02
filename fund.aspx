<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fund.aspx.cs" Inherits="fund" %>
<%@ Register TagPrefix="ucx1" TagName="MyUserControl11" Src="~/sidenav2.ascx" %>
<%@ Register TagPrefix="ucx" TagName="MyUserControl1" Src="~/header.ascx" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>create agreement</title>

    <ucx:MyUserControl1 runat="server" />

  <style>
    body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f3f6fa;
    }

.dashboard {
    width: 90%;
    margin: 0 auto;
    display: flex;
    gap: 15px;
    margin-top: 90px;
    margin-left: 95px;
}
.section {
    box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
    padding: 5px 10px;
    margin: 15px 0;
    border-radius: 15px;
    background-color: #daeaf3;
}
    .left-section {
      flex: 2;
    }

    .right-section {
      flex: 1;
    }

    h2 {
      color: #333;
      margin-bottom: 15px;
      font-size: 1.5rem;
      border-left: 5px solid #087a9f;
      padding-left: 10px;
        font-size: 25px !important;
        font-weight: 600 !important;
        color: #373737 !important;
        padding: 5px !important;
    }

.card-container {
    display: flex
;
    gap: 10px;
    flex-wrap: wrap;
    margin-bottom: 10px;
}

    .card {
      flex: 1;
      max-width: 300px;
      padding: 10px;
      border-radius: 10px;
      text-align: center;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      color: white;
      transition: transform 0.2s, box-shadow 0.2s;
    }

    .card:hover {
      transform: translateY(-5px);
      box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
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

.card p {
    margin: 6px 0;
    color: #fff;
}

.card .amount {
    font-size: 20px;
    font-weight: bold;
    margin: 0;
    color: #fff;
}

.card button {
    padding: 5px 15px;
    border: none;
    border-radius: 5px;
    color: white;
    background-color: #1f309b;
    cursor: pointer;
    transition: background-color 0.3s ease;
    width: 80%;
    margin: 0 auto;
    margin-top: 10px;
}

    .card button:hover {
      background-color: #071257;
    }

.right-section {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    margin-top: 14px;
}

    table {
      width: 100%;
      border-collapse: collapse;
    }

    table th,
    table td {
      padding: 12px 10px;
      text-align: center;
      font-size: 0.9rem;
      color: #555;
    }

    table th {
      background-color: #087a9f;
      color: white;
      border: 1px solid #ddd;
    }

    table tr:nth-child(even) {
      background-color: #f9f9f9;
    }

    table tr:hover {
      background-color: #f1f1f1;
    }

    .upload-btn {
      background-color: #087a9f;
      padding: 6px 12px;
      border-radius: 4px;
      color: white;
      font-size: 0.9rem;
      border: none;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .upload-btn:hover {
      background-color: #005f75;
    }
  </style>

</head>
<body>
    <form id="form1" runat="server">
        
        <div>
           <ucx1:MyUserControl11 runat="server" />

                     


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

    <!-- Right Section -->
<div class="right-section">
  <h2>Pending Agreements</h2>
  <table id="data-table" class="display">
    <thead>
      <tr>
        <th>Sl No</th>
        <th>Ag ID</th>
        <th>Client Name</th>
        <th>Capital</th>
        <th>Term</th>
        <th>Ref By</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td>AG8544</td>
        <td>ABC Wgr</td>
        <td>200,000.00</td>
        <td>0</td>
        <td>Danish</td>
        <td><button class="upload-btn">Upload</button></td>
      </tr>
      <tr>
        <td>2</td>
        <td>AG6002</td>
        <td>MBV Huy</td>
        <td>100,000.00</td>
        <td>6</td>
        <td>Mirza</td>
        <td><button class="upload-btn">Upload</button></td>
      </tr>
      <tr>
        <td>3</td>
        <td>AG7501</td>
        <td>Xavier Ltd</td>
        <td>500,000.00</td>
        <td>12</td>
        <td>Ramesh</td>
        <td><button class="upload-btn">Upload</button></td>
      </tr>
      <tr>
        <td>4</td>
        <td>AG3007</td>
        <td>TechSolve</td>
        <td>350,000.00</td>
        <td>18</td>
        <td>Sara</td>
        <td><button class="upload-btn">Upload</button></td>
      </tr>
      <tr>
        <td>5</td>
        <td>AG1105</td>
        <td>GreenTech</td>
        <td>275,000.00</td>
        <td>24</td>
        <td>Ali</td>
        <td><button class="upload-btn">Upload</button></td>
      </tr>
      <tr>
        <td>6</td>
        <td>AG2021</td>
        <td>NextGen Corp</td>
        <td>420,000.00</td>
        <td>36</td>
        <td>Meera</td>
        <td><button class="upload-btn">Upload</button></td>
      </tr>
      <tr>
        <td>7</td>
        <td>AG8450</td>
        <td>Prime Solutions</td>
        <td>180,000.00</td>
        <td>12</td>
        <td>Ankit</td>
        <td><button class="upload-btn">Upload</button></td>
      </tr>
      <tr>
        <td>8</td>
        <td>AG9503</td>
        <td>Infinity Co.</td>
        <td>600,000.00</td>
        <td>60</td>
        <td>Priya</td>
        <td><button class="upload-btn">Upload</button></td>
      </tr>
      <tr>
        <td>9</td>
        <td>AG4009</td>
        <td>EcoBuild</td>
        <td>220,000.00</td>
        <td>24</td>
        <td>Ravi</td>
        <td><button class="upload-btn">Upload</button></td>
      </tr>
      <tr>
        <td>10</td>
        <td>AG7070</td>
        <td>SoftTech</td>
        <td>320,000.00</td>
        <td>48</td>
        <td>Sameer</td>
        <td><button class="upload-btn">Upload</button></td>
      </tr>
      <tr>
        <td>11</td>
        <td>AG6061</td>
        <td>Vibrant Systems</td>
        <td>450,000.00</td>
        <td>18</td>
        <td>Aisha</td>
        <td><button class="upload-btn">Upload</button></td>
      </tr>
      <tr>
        <td>12</td>
        <td>AG5055</td>
        <td>RapidTech</td>
        <td>380,000.00</td>
        <td>30</td>
        <td>Kumar</td>
        <td><button class="upload-btn">Upload</button></td>
      </tr>
      <tr>
        <td>13</td>
        <td>AG4802</td>
        <td>CloudNet</td>
        <td>410,000.00</td>
        <td>36</td>
        <td>Jaya</td>
        <td><button class="upload-btn">Upload</button></td>
      </tr>
      <tr>
        <td>14</td>
        <td>AG9802</td>
        <td>Bright Minds</td>
        <td>510,000.00</td>
        <td>24</td>
        <td>Fahad</td>
        <td><button class="upload-btn">Upload</button></td>
      </tr>
      <tr>
        <td>15</td>
        <td>AG7710</td>
        <td>Elite Systems</td>
        <td>290,000.00</td>
        <td>12</td>
        <td>Geeta</td>
        <td><button class="upload-btn">Upload</button></td>
      </tr>
      <tr>
        <td>16</td>
        <td>AG8803</td>
        <td>Optima Tech</td>
        <td>375,000.00</td>
        <td>48</td>
        <td>Rahul</td>
        <td><button class="upload-btn">Upload</button></td>
      </tr>
      <tr>
        <td>17</td>
        <td>AG9104</td>
        <td>Unified Co.</td>
        <td>650,000.00</td>
        <td>36</td>
        <td>Amit</td>
        <td><button class="upload-btn">Upload</button></td>
      </tr>
      <tr>
        <td>18</td>
        <td>AG4120</td>
        <td>Global View</td>
        <td>310,000.00</td>
        <td>24</td>
        <td>Neha</td>
        <td><button class="upload-btn">Upload</button></td>
      </tr>
      <tr>
        <td>19</td>
        <td>AG6505</td>
        <td>TechEra</td>
        <td>450,000.00</td>
        <td>30</td>
        <td>Sunil</td>
        <td><button class="upload-btn">Upload</button></td>
      </tr>
      <tr>
        <td>20</td>
        <td>AG8506</td>
        <td>VisionWorks</td>
        <td>500,000.00</td>
        <td>12</td>
        <td>Nisha</td>
        <td><button class="upload-btn">Upload</button></td>
      </tr>
    </tbody>
  </table>
</div>
  </div>



                </div>
            </div>


        </div>
    </form>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
  <script>
      $(document).ready(function () {
          $('#data-table').DataTable({
              pageLength: 8,
              lengthChange: false,
              searching: false,
              info: false
          });
      });
  </script>
</body>
</html>