<%@ include file="../header.jsp"%>

<!-- Custom CSS for About Us Page -->
<style>
    /* Custom styles for the About Us page */
    .about-section {
        background: linear-gradient(135deg, #f9f9f9, #e9ecef);
        padding: 60px 0;
        border-radius: 15px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }

    .about-section h1 {
        font-size: 2.5rem;
        font-weight: bold;
        color: #343a40;
        margin-bottom: 30px;
        text-transform: uppercase;
    }

    .card {
        border: none;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .card:hover {
        transform: translateY(-10px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    }

    .card-title {
        font-size: 1.75rem;
        font-weight: bold;
        color: #007bff;
        margin-bottom: 15px;
    }

    .card-text {
        font-size: 1.1rem;
        color: #555;
        line-height: 1.8;
    }

    .list-group-item {
        border: none;
        font-size: 1rem;
        color: #555;
        padding: 10px 15px;
    }

    .list-group-item::before {
        content: "*";
        color: #28a745;
        margin-right: 10px;
    }
</style>

<!-- About Us Section -->
<div class="container about-section my-5">
    <div class="row">
        <div class="col-lg-8 mx-auto">
            <h1 class="text-center mb-4">About Us</h1>
            
            <!-- Project Overview -->
            <div class="card mb-4">
                <div class="card-body">
                    <h3 class="card-title">Our Project</h3>
                    <p class="card-text">
                        The <strong>Truck Transport Management System</strong> is a web-based application designed to streamline the process of managing truck transportation services. 
                        It provides a platform for customers to book shipments, drivers to manage their schedules, and admins to oversee the entire system efficiently.
                    </p>
                    <p class="card-text">
                        Our goal is to simplify logistics and make transportation management hassle-free for everyone involved.
                    </p>
                </div>
            </div>

            <!-- Features -->
            <div class="card mb-4">
                <div class="card-body">
                    <h3 class="card-title">Key Features</h3>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Easy shipment booking for customers.</li>
                        <li class="list-group-item">Real-time tracking of shipments.</li>
                        <li class="list-group-item">Efficient driver and truck management.</li>
                        <li class="list-group-item">Admin dashboard for system oversight.</li>
                        <li class="list-group-item">Secure user authentication and role-based access.</li>
                    </ul>
                </div>
            </div>

            <!-- Mission -->
            <div class="card mb-4">
                <div class="card-body">
                    <h3 class="card-title">Our Mission</h3>
                    <p class="card-text">
                        Our mission is to revolutionize the truck transport industry by providing a seamless, user-friendly platform that connects customers, drivers, and admins in one place. 
                        We aim to make transportation management more efficient, transparent, and accessible for everyone.
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp"%>