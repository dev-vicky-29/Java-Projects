<%@ include file="header.jsp"%>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .faq-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .faq-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .faq-header h2 {
            font-weight: bold;
            color: #007bff;
        }
        .accordion-button {
            font-weight: 600;
        }
        .accordion-item {
            border-radius: 8px;
            margin-bottom: 10px;
            overflow: hidden;
        }
    </style>


    <div class="container">
        <div class="faq-container">
            <div class="faq-header">
                <h2>Frequently Asked Questions</h2>
                <p>Find answers to common questions about our Truck Transport Management System.</p>
            </div>

            <div class="accordion" id="faqAccordion">
                <!-- FAQ Item 1 -->
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#faq1">
                            How do I book a truck?
                        </button>
                    </h2>
                    <div id="faq1" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            You can book a truck by logging into your account, selecting the pickup and destination, choosing the truck type, and confirming the booking.
                        </div>
                    </div>
                </div>

                <!-- FAQ Item 2 -->
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2">
                            How can I track my shipment?
                        </button>
                    </h2>
                    <div id="faq2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            Once your shipment is booked, you can track it in real-time from your dashboard.
                        </div>
                    </div>
                </div>

                <!-- FAQ Item 3 -->
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq3">
                            What payment methods are available?
                        </button>
                    </h2>
                    <div id="faq3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            We accept online payments via credit/debit cards, UPI, and bank transfers.
                        </div>
                    </div>
                </div>

                <!-- FAQ Item 4 -->
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq4">
                            How do I register as a transporter?
                        </button>
                    </h2>
                    <div id="faq4" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            You can register as a transporter by filling out the signup form and providing your business details.
                        </div>
                    </div>
                </div>

                <!-- FAQ Item 5 -->
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq5">
                            Can I cancel a booking?
                        </button>
                    </h2>
                    <div id="faq5" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            Yes, you can cancel a booking before the truck is dispatched. A cancellation fee may apply.
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

<%@ include file="footer.jsp"%>
