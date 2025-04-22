<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>About Us</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <style>
    body {
      font-family: 'Inter', sans-serif;
      margin: 0;
      padding: 0;
     
      background-image: url('/images/Hero background.png')
      color: #333;
      line-height: 1.6;
    }
    
    .container {
      max-width: 1200px;
      margin: 0 auto; /* Fixed the typo here - was "0a auto" */
      padding: 0 20px;
      
      
    }
    
    /* Header/Nav */
    .header {
      background-color: white;
      padding: 18px 30px;
      border-radius: 30px;
      margin: 25px auto;
      max-width: 1200px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
    }
    
    .logo {
      font-weight: bold;
      font-size: 1.6rem;
      color: #3139FB;
    }
    
    .nav {
      display: flex;
      gap: 35px;
    }
    
    .nav a {
      color: #3139FB;
      text-decoration: none;
      font-weight: 500;
      font-size: 1.05rem;
    }
    
    /* Hero Section */
    .hero {
    
      color: white;
      padding: 100px 20px;
      text-align: center;
      background-image: url('../../images/Hero background.png');
    }
    
    .hero h1 {
      font-size: 3.5rem;
      margin-bottom: 25px;
    }
    
    .hero p {
      font-size: 1.3rem;
      max-width: 800px;
      margin: 0 auto;
      line-height: 1.7;
    }
    
    /* Section Title and General Styles */
    .section-title {
      text-align: center;
      font-size: 2.5rem;
      margin-bottom: 60px;
      color: #3139FB;
      position: relative;
    }
    
    .section-title:after {
      content: '';
      position: absolute;
      bottom: -20px;
      left: 50%;
      transform: translateX(-50%);
      width: 60px;
      height: 3px;
      background-color: #FB3A4D;
      border-radius: 2px;
    }
    
    .blue-text {
      color: #3139FB;
    }
    
    .white-text {
      color: white;
    }
    
    .flex-container {
      display: flex;
      flex-wrap: wrap;
      gap: 40px;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 60px;
    }
    
    .flex-item {
      flex: 1;
      min-width: 300px;
    }
    
    .illustration {
      width: 100%;
      max-width: 400px;
      margin: 0 auto;
      display: block;
    }
    
    .feature-title {
      font-size: 1.5rem;
      margin-bottom: 20px;
      display: flex;
      align-items: center;
    }
    
    .feature-title i {
      margin-right: 15px;
      font-size: 1.2em;
    }
    
    /* Content Card */
    .content-card {
      background-color: white;
      color: #000354;
      border-radius: 15px;
      padding: 35px;
      margin-bottom: 35px;
      box-shadow: 0 6px 18px rgba(0, 0, 0, 0.08);
    }
    
    /* Section Containers */
    .white-section {
      background-color: white;
      border-radius: 16px;
      padding: 60px 40px;
      margin: 40px auto;
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
    }
    
    /* Cards Container */
    .cards-container {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
      gap: 25px;
    }
    
    .card {
      background-color: white;
      border-radius: 15px;
      padding: 35px 30px;
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.06);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      color: #000354;
      height: 100%;
    }
    
    .blue-card {
      background-color: #3139FB;
      color: white;
    }
    
    .blue-card .card-icon,
    .blue-card .card-title {
      color: white;
    }
    
    .card:hover {
      transform: translateY(-8px);
      box-shadow: 0 12px 20px rgba(0, 0, 0, 0.1);
    }
    
    .card-icon {
      font-size: 2.2rem;
      color: #3139FB;
      margin-bottom: 25px;
    }
    
    .card-title {
      font-size: 1.4rem;
      margin-bottom: 15px;
      color: #000354;
    }
    
    /* Features Section */
    .feature-card {
      border-radius: 15px;
      padding: 35px 30px;
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.06);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    
    .feature-card:hover {
      transform: translateY(-8px);
      box-shadow: 0 12px 20px rgba(0, 0, 0, 0.1);
    }
    
    .white-card {
      background-color: white;
      color: #3139FB;
    }
    
    .white-card .card-icon {
      color: #3139FB;
    }
    
    .white-card .card-title {
      color: #3139FB;
    }
    
    .red-card {
      background-color: #FB3A4D;
      color: white;
    }
    
    .red-card .card-icon {
      color: white;
    }
    
    /* Team Section */
    .team-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
      gap: 30px;
    }
    
    .team-member {
      background-color: white;
      border-radius: 15px;
      padding: 35px 25px;
      text-align: center;
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.06);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      color: #000354;
      position: relative;
      overflow: hidden;
    }
    
    .team-member:before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 6px;
      background: linear-gradient(to right, #3139FB, #FB3A4D);
    }
    
    .team-member:hover {
      transform: translateY(-8px);
      box-shadow: 0 15px 25px rgba(0, 0, 0, 0.1);
    }
    
    .member-image {
      width: 130px;
      height: 130px;
      border-radius: 50%;
      border: 4px solid #3139FB;
      padding: 4px;
      margin: 0 auto 25px;
      overflow: hidden;
    }
    
    .member-image img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      border-radius: 50%;
    }
    
    .member-name {
      font-size: 1.25rem;
      margin-bottom: 10px;
    }
    
    .member-role {
      color: #3139FB;
      font-weight: 600;
      margin-bottom: 18px;
      display: inline-block;
      padding: 6px 15px;
      background-color: rgba(49, 57, 251, 0.1);
      border-radius: 20px;
    }
    
    .social-links {
      display: flex;
      justify-content: center;
      gap: 15px;
      margin-top: 25px;
    }
    
    .social-links a {
      color: #000354;
      transition: color 0.3s ease;
      font-size: 1.1rem;
      width: 36px;
      height: 36px;
      background-color: rgba(49, 57, 251, 0.1);
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    
    .social-links a:hover {
      color: white;
      background-color: #3139FB;
    }
    
    /* CTA Section */
    .cta {
      background-color: white;
      color: #3139FB;
      padding: 70px 40px;
      text-align: center;
      border-radius: 15px;
      margin: 80px auto;
      max-width: 1000px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }
    
    .cta h2 {
      font-size: 2.8rem;
      margin-bottom: 25px;
    }
    
    .cta p {
      font-size: 1.2rem;
      max-width: 700px;
      margin: 0 auto 30px;
    }
    
    .cta-button {
      display: inline-block;
      background-color: #3139FB;
      color: white;
      padding: 16px 35px;
      border-radius: 30px;
      font-size: 1.1rem;
      font-weight: 600;
      text-decoration: none;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      box-shadow: 0 6px 12px rgba(49, 57, 251, 0.3);
    }
    
    .cta-button:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 18px rgba(49, 57, 251, 0.4);
    }
    
    /* 3D illustration placeholders */
    .illustration-placeholder {
      height: 320px;
      width: 100%;
      max-width: 420px;
      margin: 0 auto;
      background-color: white;
      border-radius: 15px;
      position: relative;
      overflow: hidden;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    }
    
    .avatar {
      position: absolute;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 180px;
      height: 260px;
      background-color: #000354;
      border-radius: 60px;
      animation: float 4s ease-in-out infinite;
    }
    
    @keyframes float {
      0% { transform: translateX(-50%) translateY(0px); }
      50% { transform: translateX(-50%) translateY(-10px); }
      100% { transform: translateX(-50%) translateY(0px); }
    }
    
    .head {
      position: absolute;
      width: 90px;
      height: 90px;
      background-color: #FFFCEC;
      border-radius: 50%;
      top: -45px;
      left: 50%;
      transform: translateX(-50%);
    }
    
    .desk {
      position: absolute;
      bottom: 40px;
      left: 50%;
      transform: translateX(-50%);
      width: 220px;
      height: 32px;
      background-color: #3139FB;
      border-radius: 6px;
    }
    
    .network-graphic {
      position: relative;
      height: 320px;
      width: 100%;
      max-width: 420px;
      margin: 0 auto;
      background-color: white;
      border-radius: 15px;
      overflow: hidden;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    }
    
    .node {
      position: absolute;
      width: 45px;
      height: 45px;
      background-color: #3139FB;
      border-radius: 50%;
      animation: pulse 3s ease-in-out infinite;
    }
    
    @keyframes pulse {
      0% { transform: scale(1); }
      50% { transform: scale(1.1); }
      100% { transform: scale(1); }
    }
    
    .node:nth-child(1) { top: 60px; left: 80px; animation-delay: 0s; }
    .node:nth-child(2) { top: 110px; right: 80px; animation-delay: 0.5s; }
    .node:nth-child(3) { bottom: 90px; left: 120px; animation-delay: 1s; }
    .node:nth-child(4) { bottom: 60px; right: 100px; animation-delay: 1.5s; }
    .node:nth-child(5) { top: 190px; left: 200px; animation-delay: 2s; }
    
    .connector {
      position: absolute;
      height: 3px;
      background-color: #000354;
      transform-origin: left center;
    }
    
    /* Responsive design */
    @media (max-width: 768px) {
      .flex-container {
        flex-direction: column;
        gap: 30px;
      }
      
      .flex-item {
        width: 100%;
      }
      
      .flex-container.reverse {
        flex-direction: column-reverse;
      }
      
      .white-section {
        padding: 40px 25px;
      }
      
      .hero h1 {
        font-size: 2.8rem;
      }
      
      .hero p {
        font-size: 1.1rem;
      }
      
      .section-title {
        font-size: 2.2rem;
      }
      
      .team-grid {
        grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
      }
    }
  </style>
</head>
<body>
  <!-- Header/Nav -->
  <jsp:include page="NewHeader.jsp"/>
  
  <!-- Hero Section -->
  <section class="hero">
    <div class="container">
      <h1>About Us</h1>
      <p>We're connecting workers and employers across the globe with a platform built on trust, talent, and technology.</p>
    </div>
  </section>
  
  <!-- Who We Are Section -->
  <section class="container">
    <div class="white-section">
      <h2 class="section-title">Who We Are</h2>
      
      <div class="flex-container">
        <div class="flex-item">
          <div class="illustration-placeholder">
            <div class="avatar">
              <div class="head"></div>
            </div>
            <div class="desk"></div>
          </div>
        </div>
        <div class="flex-item">
          <h3 class="feature-title blue-text">
            <i class="fas fa-users"></i>
            Community-Driven Platform
          </h3>
          <p>We're a passionate team of dreamers, creators, and innovators dedicated to reshaping the way people work. At our core, we believe in empowering individuals by giving them access to opportunity and freedom.</p>
        </div>
      </div>
      
      <div class="flex-container reverse">
        <div class="flex-item">
          <h3 class="feature-title blue-text">
            <i class="fas fa-handshake"></i>
            Bridging Connections Worldwide
          </h3>
          <p>We bring together freelancers and businesses across borders. With a digital-first approach and a secure environment, we enable smart collaboration that transcends geography and timezone.</p>
        </div>
        <div class="flex-item">
          <div class="network-graphic">
            <div class="node"></div>
            <div class="node"></div>
            <div class="node"></div>
            <div class="node"></div>
            <div class="node"></div>
          </div>
        </div>
      </div>
      
      <div style="text-align: center; margin-top: 60px;">
        <h3 class="feature-title blue-text" style="justify-content: center;">
          <i class="fas fa-bolt"></i>
          Future-Focused, People-Powered
        </h3>
        <p style="max-width: 800px; margin: 0 auto;">We're not just building a freelancing platform—we're designing the future of work. A future where your location doesn't limit your potential, and your passion becomes your profession.</p>
      </div>
    </div>
  </section>
  
  <!-- Mission & Vision Section -->
  <section class="container">
    <div class="white-section">
      <h2 class="section-title">Our Mission & Vision</h2>
      <p style="text-align: center; max-width: 750px; margin: 0 auto 50px; color: #333; font-size: 1.1rem;">Driven by innovation and powered by people, we are on a mission to redefine the future of work for freelancers and businesses across the globe.</p>
      
      <div class="cards-container">
        <div class="card">
          <div class="card-icon">
            <i class="fas fa-flag"></i>
          </div>
          <h3 class="card-title">Empower Talent</h3>
          <p>Our mission is to help freelancers thrive by giving them access to meaningful work, global exposure, and fair pay.</p>
        </div>
        
        <div class="card blue-card">
          <div class="card-icon">
            <i class="fas fa-globe"></i>
          </div>
          <h3 class="card-title">Borderless Collaboration</h3>
          <p>We envision a world where talent knows no borders, enabling collaboration across continents with just a few clicks.</p>
        </div>
        
        <div class="card">
          <div class="card-icon">
            <i class="fas fa-lightbulb"></i>
          </div>
          <h3 class="card-title">Fuel Innovation</h3>
          <p>By connecting businesses with passionate freelancers, we drive innovation across industries and scales.</p>
        </div>
        
        <div class="card blue-card">
          <div class="card-icon">
            <i class="fas fa-heart"></i>
          </div>
          <h3 class="card-title">People-First Approach</h3>
          <p>Our vision starts and ends with people—we build tools and systems that prioritize user trust and well-being.</p>
        </div>
        
        <div class="card">
          <div class="card-icon">
            <i class="fas fa-scale-balanced"></i>
          </div>
          <h3 class="card-title">Equality & Fairness</h3>
          <p>We are committed to creating fair opportunities regardless of location, gender, or background.</p>
        </div>
        
        <div class="card blue-card">
          <div class="card-icon">
            <i class="fas fa-shield-alt"></i>
          </div>
          <h3 class="card-title">Trust & Security</h3>
          <p>We ensure that every interaction—between client and freelancer—is built on a foundation of transparency and safety.</p>
        </div>
      </div>
    </div>
  </section>
  
  <!-- Features Section -->
  <section class="container">
    <div class="white-section">
      <h2 class="section-title">What Makes Us Different</h2>
      
      <div class="cards-container">
        <div class="feature-card white-card">
          <i class="fas fa-rocket card-icon"></i>
          <h3 class="card-title">Smart Job Matching</h3>
          <p>Our platform uses intelligent pairing to connect freelancers and employers based on skillsets and needs.</p>
        </div>
        
        <div class="feature-card red-card">
          <i class="fas fa-user-check card-icon"></i>
          <h3 class="card-title">Verified Talent Only</h3>
          <p>Every freelancer is vetted through a multi-step process, ensuring high-quality results and reliability.</p>
        </div>
        
        <div class="feature-card white-card">
          <i class="fas fa-comments card-icon"></i>
          <h3 class="card-title">Seamless Collaboration</h3>
          <p>Built-in messaging, file sharing, and milestone tools make teamwork smooth, even across time zones.</p>
        </div>
        
        <div class="feature-card red-card">
          <i class="fas fa-lock card-icon"></i>
          <h3 class="card-title">Transparent Payments</h3>
          <p>With escrow protection and no hidden fees, both freelancers and clients enjoy peace of mind on every transaction.</p>
        </div>
        
        <div class="feature-card white-card">
          <i class="fas fa-headset card-icon"></i>
          <h3 class="card-title">Global Human Support</h3>
          <p>Get 24/7 live support—real people, real solutions—whenever and wherever you need help.</p>
        </div>
        
        <div class="feature-card red-card">
          <i class="fas fa-chart-line card-icon"></i>
          <h3 class="card-title">Built for Scale</h3>
          <p>Whether you're hiring one freelancer or managing teams—our platform grows with your needs.</p>
        </div>
      </div>
    </div>
  </section>
  
  <!-- Team Section -->
  <section class="container">
    <div class="white-section">
      <h2 class="section-title">Meet the Team</h2>
      
      <div class="team-grid">
        <div class="team-member">
          <div class="member-image">
            <img src="team1.jpg" alt="Bishes Maharjan">
          </div>
          <h3 class="member-name">Bishes Maharjan</h3>
          <p class="member-role"><i class="fas fa-home"></i> Home Page</p>
          <p>Visionary leader passionate about connecting talents with opportunities globally.</p>
          <div class="social-links">
            <a href="#"><i class="fab fa-linkedin-in"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fas fa-envelope"></i></a>
          </div>
        </div>
        
        <div class="team-member">
          <div class="member-image">
            <img src="team2.jpg" alt="Manas Dongol">
          </div>
          <h3 class="member-name">Manas Dongol</h3>
          <p class="member-role"><i class="fas fa-briefcase"></i> Jobs Page</p>
          <p>Tech architect ensuring seamless experiences for freelancers and clients alike.</p>
          <div class="social-links">
            <a href="#"><i class="fab fa-linkedin-in"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fas fa-envelope"></i></a>
          </div>
        </div>
        
        <div class="team-member">
          <div class="member-image">
            <img src="team3.jpg" alt="Bigyan Nemkul">
          </div>
          <h3 class="member-name">Bigyan Nemkul</h3>
          <p class="member-role"><i class="fas fa-user"></i> Profile Page</p>
          <p>Creative mind behind our user-centric, clean, and modern design aesthetic.</p>
          <div class="social-links">
            <a href="#"><i class="fab fa-linkedin-in"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fas fa-envelope"></i></a>
          </div>
        </div>
        
        <div class="team-member">
          <div class="member-image">
            <img src="team4.jpg" alt="Ayush Das">
          </div>
          <h3 class="member-name">Ayush Das</h3>
          <p class="member-role"><i class="fas fa-info-circle"></i> About Us Page</p>
          <p>Creative mind behind our user-centric, clean, and modern design aesthetic.</p>
          <div class="social-links">
            <a href="#"><i class="fab fa-linkedin-in"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fas fa-envelope"></i></a>
          </div>
        </div>
        
        <div class="team-member">
          <div class="member-image">
            <img src="team5.jpg" alt="Susam Pudasaini">
          </div>
          <h3 class="member-name">Susam Pudasaini</h3>
          <p class="member-role"><i class="fas fa-database"></i> Backend</p>
          <p>Expert developer building robust systems that power our platform's functionality.</p>
          <div class="social-links">
            <a href="#"><i class="fab fa-linkedin-in"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fas fa-envelope"></i></a>
          </div>
        </div>
      </div>
    </div>
  </section>
  
  <!-- CTA Section -->
  <section class="container">
    <div class="cta">
      <i class="fas fa-rocket" style="font-size: 3.5rem; margin-bottom: 25px; color: #3139FB;"></i>
      <h2>Ready to Join Us?</h2>
      <p>Whether you're a freelancer looking to shine or an employer hunting top-tier talent, your next big opportunity starts here.</p>
      <a href="#" class="cta-button">Get Started Now <i class="fas fa-arrow-right"></i></a>
    </div>
  </section>
</body>
</html>