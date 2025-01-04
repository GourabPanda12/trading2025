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
      <h3>Agreement ID: AG6317001</h3>
    </div>
    <h2 class="bd">Basic Details</h2>
    <div class="basic-details">
      <div class="details-left">
        <p><strong>Client Name:</strong> ABC MRJ</p>
        <p><strong>Client ID:</strong> ABC78631</p>
        <p><strong>Nominee:</strong> CSK NJG</p>
        <p><strong>Refer By:</strong> SK DANISH RAHIM</p>
        <p><strong>Account Link:</strong> 7382000100045785</p>
        <p><strong>Bank Name:</strong> PNB</p>
        <p><strong>Contact Number:</strong> 8249786547</p>
      </div>
      <div class="details-right">
        <p><strong>Agreement ID:</strong> AG317001</p>
        <p><strong>Capital:</strong> 700,000.00</p>
        <p><strong>Start Date:</strong> 01-10-2024</p>
        <p><strong>Expire Date:</strong> 01-01-2025</p>
        <p><strong>Term:</strong> 3</p>
        <p><strong>Profit:</strong> 4%</p>
        <p><strong>Agreement Status:</strong> Success</p>
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
        <tbody>
          <tr>
            <td>01</td>
            <td>15-12-2024</td>
            <td>31</td>
            <td>100,000.00</td>
            <td><a href="#">Download</a></td>
            <td><a href="#">Download</a></td>
            <td>15</td>
            <td>17</td>
            <td>4000.00</td>
            <td>129.03</td>
            <td>2193.55</td>
          </tr>
          <tr>
            <td>02</td>
            <td>10-12-2024</td>
            <td>31</td>
            <td>100,000.00</td>
            <td><a href="#">Download</a></td>
            <td><a href="#">Download</a></td>
            <td>10</td>
            <td>22</td>
            <td>4000.00</td>
            <td>129.03</td>
            <td>2838.71</td>
          </tr>
          <tr>
            <td>03</td>
            <td>01-12-2024</td>
            <td>31</td>
            <td>100,000.00</td>
            <td><a href="#">Download</a></td>
            <td><a href="#">Download</a></td>
            <td>01</td>
            <td>31</td>
            <td>4000.00</td>
            <td>129.03</td>
            <td>4000.00</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
        </div>
    </form>
</body>
</html>