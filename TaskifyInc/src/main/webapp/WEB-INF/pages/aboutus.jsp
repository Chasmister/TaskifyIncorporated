<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us | Taskify</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&family=JetBrains+Mono:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer">
    <style>
        /* Reset and General Body Styles */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        
        body {
            font-family: 'Manrope', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #E9DEC9;
            color: #333;
        }

        /* Container Styles */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        /* Section Styling */
        .section {
            background: linear-gradient(311deg, rgba(255, 252, 236, 0.75) 0%, rgba(255, 252, 236, 0.25) 100%);
            border: solid 2px #FFFFFF;
            border-radius: 12px;
            padding: 40px;
            margin-bottom: 30px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        }
        
        /* Section Headers */
        .section-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .section-title {
            font-size: 1.8rem;
            font-weight: 800;
            letter-spacing: -0.8px;
            color: #001B2E;
            margin-bottom: 10px;
        }
        
        .section-subtitle {
            font-size: 1rem;
            color: #545454;
            max-width: 700px;
            margin: 0 auto;
        }
        
        /* Flex Containers */
        .flex-container {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            margin-bottom: 30px;
            gap: 30px;
        }
        
        .flex-reverse {
            flex-direction: row-reverse;
        }
        
        .flex-column {
            flex-direction: column;
            text-align: center;
        }
        
        /* Content Block */
        .content-block {
            flex: 1;
            min-width: 300px;
        }
        
        .image-block {
            flex: 1;
            min-width: 300px;
        }
        
        .image-block img {
            width: 100%;
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        
        .image-block img:hover {
            transform: scale(1.03);
        }
        
        /* Text Styling */
        .block-title {
            font-size: 1.4rem;
            font-weight: 700;
            color: #001B2E;
            margin-bottom: 15px;
        }
        
        .block-text {
            font-size: 1rem;
            line-height: 1.6;
            color: #333;
        }
        
        /* Card Grid */
        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin: 30px 0;
        }
        
        .card {
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.9), rgba(255, 255, 255, 0.7));
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.06);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 1px solid rgba(255,255,255,0.6);
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.12);
        }
        
        .card-icon {
            font-size: 2rem;
            margin-bottom: 15px;
            color: #8390FA;
        }
        
        .card-title {
            font-size: 1.2rem;
            font-weight: 700;
            margin-bottom: 10px;
            color: #001B2E;
        }
        
        .card-text {
            font-size: 0.95rem;
            color: #545454;
            line-height: 1.5;
        }
        
        /* Team Cards */
        .team-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 25px;
        }
        
        .team-card {
            background: #FFFFFF;
            border-radius: 12px;
            padding: 25px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 1px solid #f5f5f5;
        }
        
        .team-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 20px rgba(0,0,0,0.12);
        }
        
        .profile-pic-container {
            width: 100px;
            height: 100px;
            margin: 0 auto 15px;
            border-radius: 50%;
            overflow: hidden;
            border: 3px solid #8390FA;
            padding: 3px;
        }
        
        .profile-pic {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 50%;
        }
        
        .team-name {
            font-size: 1.1rem;
            font-weight: 700;
            color: #242423;
            margin-bottom: 5px;
        }
        
        .team-role {
            font-family: 'JetBrains Mono', monospace;
            font-size: 0.8rem;
            color: #8390FA;
            font-weight: 600;
            margin-bottom: 15px;
            padding-bottom: 12px;
            border-bottom: 1px solid #eee;
        }
        
        .team-desc {
            font-size: 0.9rem;
            color: #666;
            margin-bottom: 15px;
        }
        
        .social-links {
            display: flex;
            justify-content: center;
            gap: 12px;
        }
        
        .social-link {
            color: #555;
            transition: all 0.2s ease;
        }
        
        .social-link:hover {
            color: #8390FA;
            transform: translateY(-2px);
        }
        
        /* CTA Section */
        .cta-section {
            background: linear-gradient(135deg, #8390FA, #6c63ff);
            color: white;
            text-align: center;
            padding: 50px 30px;
            border-radius: 12px;
            margin: 40px auto;
            max-width: 900px;
        }
        
        .cta-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 20px;
        }
        
        .cta-text {
            font-size: 1.1rem;
            max-width: 600px;
            margin: 0 auto 30px;
            line-height: 1.6;
        }
        
        .cta-button {
            background: white;
            color: #6c63ff;
            padding: 12px 25px;
            font-size: 1rem;
            font-weight: 600;
            border-radius: 50px;
            text-decoration: none;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            display: inline-block;
        }
        
        .cta-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.2);
        }
        
        /* Icons Styling */
        .icon-accent {
            margin-right: 8px;
        }
        
        /* Animations */
        .float-animation {
            animation: float 3s ease-in-out infinite;
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-8px); }
        }
    </style>
</head>
<body>
    <jsp:include page="NewHeader.jsp"/>
    
    <div class="container">
        <!-- Who We Are Section -->
        <section class="section">
            <div class="section-header">
                <h2 class="section-title">Who We Are</h2>
            </div>
            
            <!-- Block 1 -->
            <div class="flex-container">
                <div class="image-block">
                    <img src="<%=request.getContextPath()%>/images/connection.jpg" alt="Connecting freelancers">
                </div>
                <div class="content-block">
                    <h3 class="block-title"><i class="fas fa-users icon-accent" style="color: #6c63ff;"></i>Community-Driven Platform</h3>
                    <p class="block-text">We're a passionate team of dreamers, creators, and innovators dedicated to reshaping the way people work. At our core, we believe in empowering individuals by giving them access to opportunity and freedom.</p>
                </div>
            </div>
            
            <!-- Block 2 -->
            <div class="flex-container flex-reverse">
                <div class="image-block">
                    <img src="<%=request.getContextPath()%>/images/meeting.jpg" alt="Freelance collaboration">
                </div>
                <div class="content-block">
                    <h3 class="block-title"><i class="fas fa-handshake icon-accent" style="color: #f857a6;"></i>Bridging Connections Worldwide</h3>
                    <p class="block-text">We bring together freelancers and businesses across borders. With a digital-first approach and a secure environment, we enable smart collaboration that transcends geography and timezone.</p>
                </div>
            </div>
            
            <!-- Block 3 -->
            <div class="flex-container flex-column">
                <h3 class="block-title"><i class="fas fa-bolt icon-accent" style="color: #5e60ce;"></i>Future-Focused, People-Powered</h3>
                <p class="block-text" style="max-width: 800px;">We're not just building a freelancing platform—we're designing the future of work. A future where your location doesn't limit your potential, and your passion becomes your profession.</p>
            </div>
        </section>
        
        <!-- Mission and Vision Section -->
        <section class="section">
            <div class="section-header">
                <h2 class="section-title">Our Mission & Vision</h2>
                <p class="section-subtitle">Driven by innovation and powered by people, we are on a mission to redefine the future of work for freelancers and businesses across the globe.</p>
            </div>
            
            <div class="card-grid">
                <!-- Card 1 -->
                <div class="card">
                    <i class="fas fa-flag card-icon" style="color: #4a6bff;"></i>
                    <h3 class="card-title">Empower Talent</h3>
                    <p class="card-text">Our mission is to help freelancers thrive by giving them access to meaningful work, global exposure, and fair pay.</p>
                </div>
                
                <!-- Card 2 -->
                <div class="card">
                    <i class="fas fa-globe card-icon" style="color: #a6c1ee;"></i>
                    <h3 class="card-title">Borderless Collaboration</h3>
                    <p class="card-text">We envision a world where talent knows no borders, enabling collaboration across continents with just a few clicks.</p>
                </div>
                
                <!-- Card 3 -->
                <div class="card">
                    <i class="fas fa-lightbulb card-icon" style="color: #8ec5fc;"></i>
                    <h3 class="card-title">Fuel Innovation</h3>
                    <p class="card-text">By connecting businesses with passionate freelancers, we drive innovation across industries and scales.</p>
                </div>
                
                <!-- Card 4 -->
                <div class="card">
                    <i class="fas fa-heart card-icon" style="color: #a18cd1;"></i>
                    <h3 class="card-title">People-First Approach</h3>
                    <p class="card-text">Our vision starts and ends with people—we build tools and systems that prioritize user trust and well-being.</p>
                </div>
                
                <!-- Card 5 -->
                <div class="card">
                    <i class="fas fa-scale-balanced card-icon" style="color: #fda085;"></i>
                    <h3 class="card-title">Equality & Fairness</h3>
                    <p class="card-text">We are committed to creating fair opportunities regardless of location, gender, or background.</p>
                </div>
                
                <!-- Card 6 -->
                <div class="card">
                    <i class="fas fa-shield-alt card-icon" style="color: #e2ebf0;"></i>
                    <h3 class="card-title">Trust & Security</h3>
                    <p class="card-text">We ensure that every interaction—between client and freelancer—is built on a foundation of transparency and safety.</p>
                </div>
            </div>
        </section>
        
        <!-- Platform Features Section -->
        <section class="section">
            <div class="section-header">
                <h2 class="section-title">What Makes Us Different</h2>
            </div>
            
            <div class="card-grid">
                <!-- Feature 1 -->
                <div class="card">
                    <i class="fas fa-rocket card-icon" style="color: #a1c4fd;"></i>
                    <h3 class="card-title">Smart Job Matching</h3>
                    <p class="card-text">Our platform uses intelligent pairing to connect freelancers and employers based on skillsets and needs.</p>
                </div>
                
                <!-- Feature 2 -->
                <div class="card">
                    <i class="fas fa-user-check card-icon" style="color: #ee9ca7;"></i>
                    <h3 class="card-title">Verified Talent Only</h3>
                    <p class="card-text">Every freelancer is vetted through a multi-step process, ensuring high-quality results and reliability.</p>
                </div>
                
                <!-- Feature 3 -->
                <div class="card">
                    <i class="fas fa-comments card-icon" style="color: #99ccff;"></i>
                    <h3 class="card-title">Seamless Collaboration</h3>
                    <p class="card-text">Built-in messaging, file sharing, and milestone tools make teamwork smooth, even across time zones.</p>
                </div>
                
                <!-- Feature 4 -->
                <div class="card">
                    <i class="fas fa-lock card-icon" style="color: #ff9999;"></i>
                    <h3 class="card-title">Transparent Payments</h3>
                    <p class="card-text">With escrow protection and no hidden fees, both freelancers and clients enjoy peace of mind on every transaction.</p>
                </div>
                
                <!-- Feature 5 -->
                <div class="card">
                    <i class="fas fa-headset card-icon" style="color: #96e6a1;"></i>
                    <h3 class="card-title">Global Human Support</h3>
                    <p class="card-text">Get 24/7 live support—real people, real solutions—whenever and wherever you need help.</p>
                </div>
                
                <!-- Feature 6 -->
                <div class="card">
                    <i class="fas fa-chart-line card-icon" style="color: #f77e7e;"></i>
                    <h3 class="card-title">Built for Scale</h3>
                    <p class="card-text">Whether you're hiring one freelancer or managing teams—our platform grows with your needs.</p>
                </div>
            </div>
        </section>
        
        <!-- Team Section -->
        <section class="section">
            <div class="section-header">
                <h2 class="section-title">Meet the Team</h2>
            </div>
            
            <div class="team-grid">
                <!-- Team Member 1 -->
                <div class="team-card">
                    <div class="profile-pic-container">
                        <img src="<%=request.getContextPath()%>/images/team1.jpg" alt="Team member - Bishes" class="profile-pic">
                    </div>
                    <h3 class="team-name">Bishes Maharjan</h3>
                    <p class="team-role"><i class="fas fa-home" style="margin-right: 5px;"></i>Home Page</p>
                    <p class="team-desc">Visionary leader passionate about connecting talents with opportunities globally.</p>
                    <div class="social-links">
                        <a href="#" class="social-link"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="social-link"><i class="fas fa-envelope"></i></a>
                    </div>
                </div>
                
                <!-- Team Member 2 -->
                <div class="team-card">
                    <div class="profile-pic-container">
                        <img src="<%=request.getContextPath()%>/images/team2.jpg" alt="Team member - Manas" class="profile-pic">
                    </div>
                    <h3 class="team-name">Manas Dongol</h3>
                    <p class="team-role"><i class="fas fa-briefcase" style="margin-right: 5px;"></i>Jobs Page</p>
                    <p class="team-desc">Tech architect ensuring seamless experiences for freelancers and clients alike.</p>
                    <div class="social-links">
                        <a href="#" class="social-link"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="social-link"><i class="fas fa-envelope"></i></a>
                    </div>
                </div>
                
                <!-- Team Member 3 -->
                <div class="team-card">
                    <div class="profile-pic-container">
                        <img src="<%=request.getContextPath()%>/images/team3.jpg" alt="Team member - Bigyan" class="profile-pic">
                    </div>
                    <h3 class="team-name">Bigyan Nemkul</h3>
                    <p class="team-role"><i class="fas fa-info-circle" style="margin-right: 5px;"></i>Profile Page</p>
                    <p class="team-desc">Creative mind behind our user-centric, clean, and modern design aesthetic.</p>
                    <div class="social-links">
                        <a href="#" class="social-link"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="social-link"><i class="fas fa-envelope"></i></a>
                    </div>
                </div>
                
                <!-- Team Member 4 -->
                <div class="team-card">
                    <div class="profile-pic-container">
                        <img src="<%=request.getContextPath()%>/images/team4.jpg" alt="Team member - Ayush" class="profile-pic">
                    </div>
                    <h3 class="team-name">Ayush Das</h3>
                    <p class="team-role"><i class="fas fa-info-circle" style="margin-right: 5px;"></i>About Us Page</p>
                    <p class="team-desc">Creative mind behind our user-centric, clean, and modern design aesthetic.</p>
                    <div class="social-links">
                        <a href="#" class="social-link"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="social-link"><i class="fas fa-envelope"></i></a>
                    </div>
                </div>
                
                <!-- Team Member 5 -->
                <div class="team-card">
                    <div class="profile-pic-container">
                        <img src="<%=request.getContextPath()%>/images/team5.jpg" alt="Team member - Susam" class="profile-pic">
                    </div>
                    <h3 class="team-name">Susam Pudasaini</h3>
                    <p class="team-role"><i class="fas fa-database" style="margin-right: 5px;"></i>Backend and Database</p>
                    <p class="team-desc">Database expert ensuring reliable and secure data management for all users.</p>
                    <div class="social-links">
                        <a href="#" class="social-link"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="social-link"><i class="fas fa-envelope"></i></a>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Call to Action Section -->
        <section class="cta-section">
            <i class="fas fa-rocket float-animation" style="font-size: 3rem; margin-bottom: 20px;"></i>
            <h2 class="cta-title">Ready to Join Us?</h2>
            <p class="cta-text">Whether you're a freelancer looking to shine or an employer hunting top-tier talent, your next big opportunity starts here.</p>
            <a href="<%=request.getContextPath()%>/register" class="cta-button">
                Get Started Now <i class="fas fa-arrow-right" style="margin-left: 0.5rem;"></i>
            </a>
        </section>
    </div>
</body>
</html>