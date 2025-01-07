<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Adminapprove.aspx.cs" Inherits="Adminapprove" %>
<%@ Register TagPrefix="ucx1" TagName="MyUserControl11" Src="~/sidenav2.ascx" %>
<%@ Register TagPrefix="ucx" TagName="MyUserControl1" Src="~/header.ascx" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Monthly Profits Table</title>
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        / Previous styles remain the same until expand-btn /
        body {
            font-family: Arial, sans-serif;
            background-color: #e8f1f5;
            padding: 20px;
            margin: 0;
        }

        .dashboard-header {
    background-color: white;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 20px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    width: 50%;
}
.dashboard-header h2{
  margin: 0 0 20px 0;
}

        .stats-container {
            display: flex;
            gap: 20px;
        }

        .stat-card {
            padding: 15px;
            border-radius: 8px;
            color: white;
            flex: 1;
        }

        .stat-card.total {
            background-color: #0a2647;
        }

        .stat-card.client {
            background-color: #b22222;
        }

        .stat-card.team {
            background-color: #228b22;
        }

        .stat-amount {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .stat-label {
            font-size: 14px;
        }

        .search-container {
            text-align: right;
            margin: 20px 0;
            position: relative;
        }

        .search-input {
            padding: 8px 32px 8px 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 200px;
        }

        .search-icon {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
        }

        .table-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background-color: #0a2647;
            color: white;
            padding: 12px;
            text-align: center;
            font-weight: normal;
        }

        td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        .expand-btn {
    background: none;
    color: #0a2647;
    cursor: pointer;
    font-size: 14px;
    padding: 5px;
    border: 1px solid #bfbfbf;
    background-color: #d8e7ff;
}

        .expandable-row {
            display: none;
            background-color: #f0f6ff;
        }

        .expandable-content {
            display: flex;
            justify-content: space-around;
            align-items: center;
            padding: 15px 20px;
        }

        .installment-box {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .date-amount {
            text-align: left;
        }

        .installment-date {
            font-size: 14px;
            color: #333;
            margin-bottom: 4px;
        }

        .installment-amount {
            font-size: 18px;
            font-weight: bold;
            color: #000;
        }

        .upload-file-btn {
            padding: 6px 12px;
            background-color: #e0e0e0;
            border: none;
            border-radius: 4px;
            color: #333;
            cursor: pointer;
            font-size: 13px;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .status-btn {
            padding: 6px 16px;
            border: none;
            border-radius: 4px;
            color: white;
            cursor: pointer;
            font-size: 13px;
            min-width: 80px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
        }

        .status-paid {
            background-color: #006400;
        }

        .status-pending {
            background-color: #cc0000;
        }

        .profile-btn {
            background-color: #1a4157;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 13px;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .pagination {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 10px;
        }

        .pagination-info {
            color: #666;
        }

        .pagination-controls button {
            padding: 8px 12px;
            margin: 0 4px;
            border: 1px solid #ddd;
            background-color: white;
            cursor: pointer;
            border-radius: 4px;
        }

        .pagination-controls button:hover {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
    <div class="dashboard-header">
        <h2>Monthly Profits</h2>
        <div class="stats-container">
            <div class="stat-card total">
                <div class="stat-amount">500000.00</div>
                <div class="stat-label">Total Funds</div>
            </div>
            <div class="stat-card client">
                <div class="stat-amount">500,000.00</div>
                <div class="stat-label">Client Payments</div>
            </div>
            <div class="stat-card team">
                <div class="stat-amount">250000.00</div>
                <div class="stat-label">Team Payments</div>
            </div>
        </div>
    </div>

    <div class="search-container">
        <input type="text" class="search-input" placeholder="Search....">
        <i class="fas fa-search search-icon"></i>
    </div>

    <div class="table-container">
        <table>
            <thead>
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
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>AG6317001</td>
                    <td>ABC RKJ</td>
                    <td>200,000.00</td>
                    <td>3</td>
                    <td>P2</td>
                    <td>02-10-2024</td>
                    <td>03-01-2025</td>
                    <td>7382000100075419</td>
                    <td>PNB</td>
                    <td>Danish</td>
                    <td><button class="expand-btn"><i class="fas fa-chevron-down"></i></button></td>
                </tr>
                <tr class="expandable-row">
                    <td colspan="12">
                        <div class="expandable-content">
                            <div class="installment-box">
                                <div class="date-amount">
                                    <div class="installment-date">3<sup>rd</sup> Jan 2025</div>
                                    <div class="installment-amount">9,032.26</div>
                                </div>
                                <button class="upload-file-btn">
                                    <i class="fas fa-upload"></i> Upload File
                                </button>
                                <button class="status-btn status-paid">
                                    <i class="fas fa-check"></i> Paid
                                </button>
                            </div>
                            <div class="installment-box">
                                <div class="date-amount">
                                    <div class="installment-date">3<sup>rd</sup> Feb 2025</div>
                                    <div class="installment-amount">12,000.00</div>
                                </div>
                                <button class="upload-file-btn">
                                    <i class="fas fa-upload"></i> Upload File
                                </button>
                                <button class="status-btn status-pending">
                                    <i class="fas fa-clock"></i> Pending
                                </button>
                            </div>
                            <div class="installment-box">
                                <div class="date-amount">
                                    <div class="installment-date">3<sup>rd</sup> Mar 2025</div>
                                    <div class="installment-amount">12,000.00</div>
                                </div>
                                <button class="upload-file-btn">
                                    <i class="fas fa-upload"></i> Upload File
                                </button>
                                <button class="status-btn status-pending">
                                    <i class="fas fa-clock"></i> Pending
                                </button>
                            </div>
                            <div>
                                <button class="profile-btn">
                                    <i class="fas fa-user"></i> Go To Profile
                                </button>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>AG2589047</td>
                    <td>MGJ POD</td>
                    <td>700,000.00</td>
                    <td>6</td>
                    <td>P2</td>
                    <td>01-12-2024</td>
                    <td>02-03-2025</td>
                    <td>9090546446@ybl</td>
                    <td></td>
                    <td>Danish</td>
                    <td><button class="expand-btn"><i class="fas fa-chevron-down"></i></button></td>
                </tr>
                <tr class="expandable-row">
                  <td colspan="12">
                      <div class="expandable-content">
                          <div class="installment-box">
                              <div class="date-amount">
                                  <div class="installment-date">4<sup>rd</sup> Jan 2024</div>
                                  <div class="installment-amount">5,232.26</div>
                              </div>
                              <button class="upload-file-btn">
                                  <i class="fas fa-upload"></i> Upload File
                              </button>
                              <button class="status-btn status-paid">
                                  <i class="fas fa-check"></i> Paid
                              </button>
                          </div>
                          <div class="installment-box">
                              <div class="date-amount">
                                  <div class="installment-date">7<sup>th</sup> Feb 2023</div>
                                  <div class="installment-amount">14,000.00</div>
                              </div>
                              <button class="upload-file-btn">
                                  <i class="fas fa-upload"></i> Upload File
                              </button>
                              <button class="status-btn status-pending">
                                  <i class="fas fa-clock"></i> Pending
                              </button>
                          </div>
                          <div class="installment-box">
                              <div class="date-amount">
                                  <div class="installment-date">3<sup>rd</sup> Mar 2025</div>
                                  <div class="installment-amount">12,000.00</div>
                              </div>
                              <button class="upload-file-btn">
                                  <i class="fas fa-upload"></i> Upload File
                              </button>
                              <button class="status-btn status-pending">
                                  <i class="fas fa-clock"></i> Pending
                              </button>
                          </div>
                          <div>
                              <button class="profile-btn">
                                  <i class="fas fa-user"></i> Go To Profile
                              </button>
                          </div>
                      </div>
                  </td>
              </tr>
            </tbody>
        </table>
    </div>

    <div class="pagination">
        <div class="pagination-info">
            Showing 1 to 10 of 130 entries
        </div>
        <div class="pagination-controls">
            <button>1</button>
            <button>2</button>
            <button><i class="fas fa-chevron-right"></i></button>
        </div>
    </div>

    <script>
        // Expand/Collapse functionality
        document.querySelectorAll('.expand-btn').forEach(button => {
            button.addEventListener('click', () => {
                const expandableRow = button.closest('tr').nextElementSibling;
                const isExpanded = expandableRow.style.display === 'table-row';
                const icon = button.querySelector('i');
                
                // Close all other expanded rows
                document.querySelectorAll('.expandable-row').forEach(row => {
                    row.style.display = 'none';
                    row.previousElementSibling.querySelector('.expand-btn i').className = 'fas fa-chevron-down';
                });

                // Toggle current row
                expandableRow.style.display = isExpanded ? 'none' : 'table-row';
                icon.className = isExpanded ? 'fas fa-chevron-down' : 'fas fa-chevron-up';
            });
        });

        // Search functionality
        const searchInput = document.querySelector('.search-input');
        searchInput.addEventListener('input', () => {
            const searchTerm = searchInput.value.toLowerCase();
            const rows = document.querySelectorAll('tbody tr:not(.expandable-row)');
            
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.includes(searchTerm) ? '' : 'none';
                
                // Hide expanded content when filtering
                const expandedRow = row.nextElementSibling;
                if (expandedRow && expandedRow.classList.contains('expandable-row')) {
                    expandedRow.style.display = 'none';
                    row.querySelector('.expand-btn i').className = 'fas fa-chevron-down';
                }
            });
        });

        // File upload simulation
        document.querySelectorAll('.upload-file-btn').forEach(button => {
            button.addEventListener('click', () => {
                const input = document.createElement('input');
                input.type = 'file';
                input.click();
                
                input.addEventListener('change', () => {
                    if (input.files.length > 0) {
                        button.innerHTML = `<i class="fas fa-file"></i> ${input.files[0].name}`;
                    }
                });
            });
        });
    </script>
</body>
</html>       