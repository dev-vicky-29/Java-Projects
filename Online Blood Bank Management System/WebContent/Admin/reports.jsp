<%@ include file="../header.jsp"%>

	 <div class="container mt-5">
        <h2 class="text-center mb-4">Reports</h2>

        <!-- Filter Section -->
        <div class="card mb-4">
            <div class="card-header">Filter Reports</div>
            <div class="card-body">
                <form id="filterForm" method="post" action="ReportsServlet">
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <label for="startDate" class="form-label">Start Date</label>
                            <input type="date" id="startDate" name="startDate" class="form-control">
                        </div>
                        <div class="col-md-4">
                            <label for="endDate" class="form-label">End Date</label>
                            <input type="date" id="endDate" name="endDate" class="form-control">
                        </div>
                        <div class="col-md-4">
                            <label for="bloodGroup" class="form-label">Blood Group</label>
                            <select id="bloodGroup" name="bloodGroup" class="form-select">
                                <option value="">All</option>
                                <option value="A+">A+</option>
                                <option value="A-">A-</option>
                                <option value="B+">B+</option>
                                <option value="B-">B-</option>
                                <option value="O+">O+</option>
                                <option value="O-">O-</option>
                                <option value="AB+">AB+</option>
                                <option value="AB-">AB-</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="status" class="form-label">Request Status</label>
                        <select id="status" name="status" class="form-select">
                            <option value="">All</option>
                            <option value="Pending">Pending</option>
                            <option value="Approved">Approved</option>
                            <option value="Rejected">Rejected</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Generate Report</button>
                </form>
            </div>
        </div>

        <!-- Report Table -->
        <div class="card mb-4">
            <div class="card-header">Report Data</div>
            <div class="card-body">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Request ID</th>
                            <th>Requester Name</th>
                            <th>Blood Group</th>
                            <th>Quantity</th>
                            <th>Status</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody id="reportTableBody">
                        <!-- Report data will be dynamically loaded -->
                    </tbody>
                </table>
                <button id="downloadCsv" class="btn btn-success">Download as CSV</button>
            </div>
        </div>

        <!-- Chart Section -->
        <div class="card">
            <div class="card-header">Blood Group Distribution</div>
            <div class="card-body">
                <canvas id="bloodGroupChart"></canvas>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and AJAX Script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        $(document).ready(function () {
            // Load report data dynamically
            function loadReportData(filters) {
                $.ajax({
                    url: 'ReportsServlet',
                    method: 'POST',
                    data: filters,
                    dataType: 'json',
                    success: function (data) {
                        // Populate report table
                        let tableBody = '';
                        data.reports.forEach(report => {
                            tableBody += `
                                <tr>
                                    <td>${report.requestId}</td>
                                    <td>${report.requesterName}</td>
                                    <td>${report.bloodGroup}</td>
                                    <td>${report.quantity}</td>
                                    <td>${report.status}</td>
                                    <td>${report.date}</td>
                                </tr>`;
                        });
                        $('#reportTableBody').html(tableBody);

                        // Generate chart
                        generateChart(data.chartData);
                    }
                });
            }

            // Generate pie chart
            function generateChart(chartData) {
                const ctx = document.getElementById('bloodGroupChart').getContext('2d');
                new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: chartData.labels,
                        datasets: [{
                            label: 'Blood Group Distribution',
                            data: chartData.data,
                            backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF', '#FF9F40', '#C9CBCA', '#FF6633']
                        }]
                    },
                });
            }

            // Handle filter form submission
            $('#filterForm').submit(function (e) {
                e.preventDefault();
                const filters = $(this).serialize();
                loadReportData(filters);
            });

            // Download report as CSV
            $('#downloadCsv').click(function () {
                // Simple download functionality
                window.location.href = 'ReportsServlet?action=downloadCsv';
            });

            // Load default data on page load
            loadReportData({});
        });
    </script>

<%@ include file="../footer.jsp"%>