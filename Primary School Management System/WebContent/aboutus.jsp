<%@ include file="header.jsp" %>

<style>
    /* Styling for About Us Page */
    .about-container {
        max-width: 900px;
        margin: auto;
        padding: 40px;
        text-align: center;
    }
    .about-header {
        font-size: 32px;
        font-weight: bold;
        color: #2c3e50;
    }
    .about-text {
        font-size: 18px;
        color: #555;
        line-height: 1.6;
        margin-top: 20px;
    }
    .features {
        display: flex;
        justify-content: space-around;
        flex-wrap: wrap;
        margin-top: 30px;
    }
    .feature-box {
        width: 250px;
        background: #f8f9fa;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        transition: transform 0.3s;
    }
    .feature-box:hover {
        transform: translateY(-5px);
    }
    .feature-icon {
        font-size: 40px;
        color: #007bff;
    }
    .feature-title {
        font-size: 20px;
        font-weight: bold;
        margin-top: 10px;
    }
</style>

<div class="about-container">
    <h2 class="about-header">Welcome to Our Primary School</h2>
    
    <p class="about-text">
        Our school is committed to providing high-quality education, fostering a love for learning, and helping students grow academically and personally. 
        With a dedicated team of teachers and state-of-the-art facilities, we ensure an enriching and enjoyable learning experience for every child.
    </p>

    <!-- Features Section -->
    <div class="features">
        <div class="feature-box">
            <i class="feature-icon fas fa-book"></i>
            <div class="feature-title">Well-Equipped Library</div>
            <p>We provide a diverse collection of books and digital learning resources.</p>
        </div>
        <div class="feature-box">
            <i class="feature-icon fas fa-chalkboard-teacher"></i>
            <div class="feature-title">Experienced Faculty</div>
            <p>Our dedicated teachers ensure a holistic development of students.</p>
        </div>
        <div class="feature-box">
            <i class="feature-icon fas fa-futbol"></i>
            <div class="feature-title">Extracurricular Activities</div>
            <p>From sports to arts, we encourage students to explore their passions.</p>
        </div>
        <div class="feature-box">
            <i class="feature-icon fas fa-laptop"></i>
            <div class="feature-title">Smart Classrooms</div>
            <p>We integrate technology in education to make learning interactive.</p>
        </div>
    </div>

</div>

<%@ include file="footer.jsp" %>
