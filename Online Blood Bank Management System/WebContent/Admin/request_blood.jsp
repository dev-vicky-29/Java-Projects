<%@ include file="../header.jsp"%>

	  <div class="container mt-5">
        <h2 class="text-center mb-4">Request Blood</h2>

        <!-- Blood Stock Availability -->
        <h4 class="mb-3">Available Blood Stock</h4>
        <div class="row" id="bloodStockCards">
            <!-- Blood stock details will be loaded dynamically -->
        </div>

        <!-- Request Blood Form -->
        <div class="card mt-4">
            <div class="card-header">Request Blood</div>
            <div class="card-body">
                <form id="requestBloodForm" action="RequestServlet" method="post" onsubmit="return validateForm();">
                    <div class="mb-3">
                        <label for="bloodGroup" class="form-label">Blood Group</label>
                        <select id="bloodGroup" name="bloodGroup" class="form-select" required>
                            <option value="">Select Blood Group</option>
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
                    <div class="mb-3">
                        <label for="quantity" class="form-label">Quantity (Units)</label>
                        <input type="number" id="quantity" name="quantity" class="form-control" min="1" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Urgency</label>
                        <div>
                            <div class="form-check form-check-inline">
                                <input type="radio" id="normalUrgency" name="urgency" value="Normal" class="form-check-input" required>
                                <label for="normalUrgency" class="form-check-label">Normal</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" id="urgentUrgency" name="urgency" value="Urgent" class="form-check-input" required>
                                <label for="urgentUrgency" class="form-check-label">Urgent</label>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="location" class="form-label">Location</label>
                        <input type="text" id="location" name="location" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="notes" class="form-label">Notes</label>
                        <textarea id="notes" name="notes" class="form-control" rows="3"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Submit Request</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and AJAX Script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        // Load blood stock details
        function loadBloodStock() {
            $.ajax({
                url: 'GetStockServlet',
                method: 'GET',
                dataType: 'json',
                success: function(data) {
                    let cards = '';
                    data.forEach(stock => {
                        const lowStockAlert = stock.units < 5 ? '<span class="badge bg-danger ms-2">Low Stock</span>' : '';
                        cards += `
                            <div class="col-md-3 mb-3">
                                <div class="card">
                                    <div class="card-body text-center">
                                        <h5 class="card-title">${stock.bloodGroup}</h5>
                                        <p class="card-text">Units Available: <strong>${stock.units}</strong></p>
                                        ${lowStockAlert}
                                    </div>
                                </div>
                            </div>`;
                    });
                    $('#bloodStockCards').html(cards);
                }
            });
        }

        // Validate form before submission
        function validateForm() {
            const bloodGroup = $('#bloodGroup').val();
            const quantity = $('#quantity').val();
            const location = $('#location').val();

            if (!bloodGroup || quantity < 1 || !location) {
                alert('Please fill out all required fields.');
                return false;
            }
            return true;
        }

        // Load blood stock on page load
        $(document).ready(function() {
            loadBloodStock();
        });
    </script>

<%@ include file="../footer.jsp"%>