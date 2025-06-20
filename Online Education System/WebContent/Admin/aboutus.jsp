<%@ include file="../header.jsp" %>

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
    .team-section {
        margin-top: 50px;
    }
    .team-member {
        display: inline-block;
        margin: 20px;
        text-align: center;
    }
    .team-img {
        width: 100px;
        height: 100px;
        border-radius: 50%;
    }
    .social-icons a {
        font-size: 24px;
        margin: 10px;
        color: #007bff;
        transition: 0.3s;
    }
    .social-icons a:hover {
        color: #0056b3;
    }
</style>

<div class="about-container">
    <h2 class="about-header">Welcome to Our Learning & Career Platform </h2>
    
    <p class="about-text">
        We are dedicated to providing students and professionals with the best learning resources, career opportunities, and technical knowledge through structured courses, lectures, hackathons, and job postings. Whether you're looking to enhance your skills or land your dream job, we're here to guide you!
    </p>

    <!-- Features Section -->
    <div class="features">
        <div class="feature-box">
            <i class="feature-icon fas fa-book"></i>
            <div class="feature-title">Comprehensive Notes</div>
            <p>Access a wide range of study materials and notes for your courses.</p>
        </div>
        <div class="feature-box">
            <i class="feature-icon fas fa-chalkboard-teacher"></i>
            <div class="feature-title">Expert Lectures</div>
            <p>Learn from industry experts with our detailed lectures.</p>
        </div>
        <div class="feature-box">
            <i class="feature-icon fas fa-briefcase"></i>
            <div class="feature-title">Career Guidance</div>
            <p>Explore job opportunities tailored to your skills and experience.</p>
        </div>
        <div class="feature-box">
            <i class="feature-icon fas fa-laptop-code"></i>
            <div class="feature-title">Hackathons</div>
            <p>Test your coding skills by participating in live hackathons.</p>
        </div>
    </div>

    

</div>

<%@ include file="../footer.jsp" %>
