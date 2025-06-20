<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>

<div class="container mt-5">
    <h2 class="text-center mb-4">Cake Gallery</h2>

    <!-- Main Image Display -->
    <div class="row mb-4">
        <div class="col-12 text-center">
            <img 
                id="mainImage" 
                src="" 
                alt="Main Cake Image" 
                class="img-fluid rounded shadow" 
                style="max-height: 400px; object-fit: cover;">
        </div>
    </div>

    <!-- Thumbnails with Navigation -->
    <div class="row align-items-center">
        <div class="col-1 text-end">
            <button id="prevBtn" class="btn btn-secondary btn-sm">Previous</button>
        </div>
        <div class="col-10">
            <div class="d-flex overflow-auto" id="thumbnailContainer" style="gap: 15px; max-width: 100%; white-space: nowrap;">
                <%
                    ResultSet rs = db.getRows("SELECT * FROM cakegallery");
                    int counter = 0; // Track image index
                    while (rs.next()) {
                %>
                <img 
                    src="/Online_Cake_Shop/CakeGalleryImages/<%= rs.getString("CakeImage") %>" 
                    data-name="<%= rs.getString("CakeName") %>"
                    class="thumbnail rounded shadow-sm"
                    alt="<%= rs.getString("CakeName") %>"
                    style="width: 100px; height: 100px; object-fit: cover; cursor: pointer;"
                    data-index="<%= counter++ %>">
                <%
                    }
                %>
            </div>
        </div>
        <div class="col-1 text-start">
            <button id="nextBtn" class="btn btn-secondary btn-sm">Next</button>
        </div>
    </div>
</div>

<style>
    .thumbnail.active {
        border: 2px solid #007bff;
        opacity: 0.8;
    }
</style>

<script>
    document.addEventListener("DOMContentLoaded", () => {
        const thumbnails = document.querySelectorAll(".thumbnail");
        const mainImage = document.getElementById("mainImage");
        const prevBtn = document.getElementById("prevBtn");
        const nextBtn = document.getElementById("nextBtn");
        const thumbnailContainer = document.getElementById("thumbnailContainer");

        let activeIndex = 0;

        // Function to update the main image
        function updateMainImage(index) {
            thumbnails.forEach((thumb, idx) => {
                thumb.classList.toggle("active", idx === index);
                if (idx === index) {
                    mainImage.src = thumb.src;
                    mainImage.alt = thumb.alt;
                }
            });
        }

        // Set initial image
        if (thumbnails.length > 0) {
            updateMainImage(0);
        }

        // Thumbnail click handler
        thumbnails.forEach((thumb, index) => {
            thumb.addEventListener("click", () => {
                activeIndex = index;
                updateMainImage(activeIndex);
            });
        });

        // Next button handler
        nextBtn.addEventListener("click", () => {
            activeIndex = (activeIndex + 1) % thumbnails.length;
            updateMainImage(activeIndex);
        });

        // Previous button handler
        prevBtn.addEventListener("click", () => {
            activeIndex = (activeIndex - 1 + thumbnails.length) % thumbnails.length;
            updateMainImage(activeIndex);
        });
    });
</script>

<%@ include file="../footer.jsp" %>
