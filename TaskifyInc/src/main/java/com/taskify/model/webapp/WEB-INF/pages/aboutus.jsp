<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body><div style="font-family: 'Segoe UI', sans-serif; background: #fdfdff; color: #0d0d4d; padding: 0; margin: 0;">

    <!-- Hero Section -->
    <section style="background: linear-gradient(135deg, #eef2ff, #f5f7ff); padding: 5rem 2rem;">
      <div style="max-width: 1200px; margin: auto;">
        <h2 style="text-align: center; font-size: 2.8rem; color: #1a1a40; margin-bottom: 3rem;">Who We Are</h2>
    
        <!-- Block 1 -->
        <div style="display: flex; flex-wrap: wrap; align-items: center; margin-bottom: 4rem;">
          <div style="flex: 1; padding: 1rem;">
            <img src="<%=request.getContextPath()%>/images/connection.jpg" alt="Connecting freelancers" style="width: 100%; border-radius: 1.5rem; box-shadow: 0 8px 24px rgba(0,0,0,0.1); transition: transform 0.3s ease;" onmouseover="this.style.transform='scale(1.03)'" onmouseout="this.style.transform='scale(1)'">
          </div>
          <div style="flex: 1; padding: 1rem;">
            <h3 style="font-size: 1.8rem; color: #2b2d42; margin-bottom: 1rem;"><i class="fas fa-users" style="margin-right: 0.5rem; color: #6c63ff;"></i>Community-Driven Platform</h3>
            <p style="font-size: 1.1rem; color: #444;">We’re a passionate team of dreamers, creators, and innovators dedicated to reshaping the way people work. At our core, we believe in empowering individuals by giving them access to opportunity and freedom.</p>
          </div>
        </div>
    
        <!-- Block 2 -->
        <div style="display: flex; flex-wrap: wrap; align-items: center; flex-direction: row-reverse;">
          <div style="flex: 1; padding: 1rem;">
            <img src="<%=request.getContextPath()%>/images/meeting.jpg" alt="Freelance collaboration" style="width: 100%; border-radius: 1.5rem; box-shadow: 0 8px 24px rgba(0,0,0,0.1); transition: transform 0.3s ease;" onmouseover="this.style.transform='scale(1.03)'" onmouseout="this.style.transform='scale(1)'">
          </div>
          <div style="flex: 1; padding: 1rem;">
            <h3 style="font-size: 1.8rem; color: #2b2d42; margin-bottom: 1rem;"><i class="fas fa-handshake" style="margin-right: 0.5rem; color: #f857a6;"></i>Bridging Connections Worldwide</h3>
            <p style="font-size: 1.1rem; color: #444;">We bring together freelancers and businesses across borders. With a digital-first approach and a secure environment, we enable smart collaboration that transcends geography and timezone.</p>
          </div>
        </div>
    
        <!-- Block 3 -->
        <div style="text-align: center; margin-top: 4rem;">
          <h3 style="font-size: 1.8rem; color: #2b2d42; margin-bottom: 1rem;"><i class="fas fa-bolt" style="margin-right: 0.5rem; color: #5e60ce;"></i>Future-Focused, People-Powered</h3>
          <p style="font-size: 1.1rem; color: #444; max-width: 800px; margin: auto;">We’re not just building a freelancing platform—we’re designing the future of work. A future where your location doesn’t limit your potential, and your passion becomes your profession.</p>
        </div>
      </div>
    </section>
    
    <!-- Font Awesome CDN (if not included already) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous">
    
  
    <!-- Mission and Vision -->
    <!-- Font Awesome CDN (if not already included) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer">

<section style="background: linear-gradient(135deg, #f5f9ff, #ebedff); padding: 5rem 2rem;">
  <div style="max-width: 1200px; margin: auto; text-align: center;">
    <h2 style="font-size: 2.8rem; margin-bottom: 2rem; color: #1a1a40;">Our Mission &amp; Vision</h2>
    <p style="max-width: 700px; margin: 0 auto 3rem auto; font-size: 1.1rem; color: #333;">Driven by innovation and powered by people, we are on a mission to redefine the future of work for freelancers and businesses across the globe.</p>

    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 2rem;">

      <!-- Card 1 -->
      <div style="background: linear-gradient(135deg, #c2e9fb, #a1c4fd); border-radius: 1.5rem; padding: 2rem; color: #003366; box-shadow: 0 6px 18px rgba(0,0,0,0.08); transition: transform 0.3s ease, box-shadow 0.3s ease;" onmouseover="this.style.transform='scale(1.05)'; this.style.boxShadow='0 12px 24px rgba(0,0,0,0.2)'" onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='0 6px 18px rgba(0,0,0,0.08)'">
        <i class="fas fa-flag" style="font-size: 2rem; margin-bottom: 1rem;"></i>
        <h3 style="font-size: 1.4rem; margin-bottom: 1rem;">Empower Talent</h3>
        <p>Our mission is to help freelancers thrive by giving them access to meaningful work, global exposure, and fair pay.</p>
      </div>

      <!-- Card 2 -->
      <div style="background: linear-gradient(135deg, #fbc2eb, #a6c1ee); border-radius: 1.5rem; padding: 2rem; color: #4b1b5c; box-shadow: 0 6px 18px rgba(0,0,0,0.08); transition: transform 0.3s ease, box-shadow 0.3s ease;" onmouseover="this.style.transform='scale(1.05)'; this.style.boxShadow='0 12px 24px rgba(0,0,0,0.2)'" onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='0 6px 18px rgba(0,0,0,0.08)'">
        <i class="fas fa-globe" style="font-size: 2rem; margin-bottom: 1rem;"></i>
        <h3 style="font-size: 1.4rem; margin-bottom: 1rem;">Borderless Collaboration</h3>
        <p>We envision a world where talent knows no borders, enabling collaboration across continents with just a few clicks.</p>
      </div>

      <!-- Card 3 -->
      <div style="background: linear-gradient(135deg, #e0c3fc, #8ec5fc); border-radius: 1.5rem; padding: 2rem; color: #2f2b55; box-shadow: 0 6px 18px rgba(0,0,0,0.08); transition: transform 0.3s ease, box-shadow 0.3s ease;" onmouseover="this.style.transform='scale(1.05)'; this.style.boxShadow='0 12px 24px rgba(0,0,0,0.2)'" onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='0 6px 18px rgba(0,0,0,0.08)'">
        <i class="fas fa-lightbulb" style="font-size: 2rem; margin-bottom: 1rem;"></i>
        <h3 style="font-size: 1.4rem; margin-bottom: 1rem;">Fuel Innovation</h3>
        <p>By connecting businesses with passionate freelancers, we drive innovation across industries and scales.</p>
      </div>

      <!-- Card 4 -->
      <div style="background: linear-gradient(135deg, #a18cd1, #fbc2eb); border-radius: 1.5rem; padding: 2rem; color: #3e2b4c; box-shadow: 0 6px 18px rgba(0,0,0,0.08); transition: transform 0.3s ease, box-shadow 0.3s ease;" onmouseover="this.style.transform='scale(1.05)'; this.style.boxShadow='0 12px 24px rgba(0,0,0,0.2)'" onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='0 6px 18px rgba(0,0,0,0.08)'">
        <i class="fas fa-heart" style="font-size: 2rem; margin-bottom: 1rem;"></i>
        <h3 style="font-size: 1.4rem; margin-bottom: 1rem;">People-First Approach</h3>
        <p>Our vision starts and ends with people—we build tools and systems that prioritize user trust and well-being.</p>
      </div>

      <!-- Card 5 -->
      <div style="background: linear-gradient(135deg, #f6d365, #fda085); border-radius: 1.5rem; padding: 2rem; color: #5c2c00; box-shadow: 0 6px 18px rgba(0,0,0,0.08); transition: transform 0.3s ease, box-shadow 0.3s ease;" onmouseover="this.style.transform='scale(1.05)'; this.style.boxShadow='0 12px 24px rgba(0,0,0,0.2)'" onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='0 6px 18px rgba(0,0,0,0.08)'">
        <i class="fas fa-scale-balanced" style="font-size: 2rem; margin-bottom: 1rem;"></i>
        <h3 style="font-size: 1.4rem; margin-bottom: 1rem;">Equality &amp; Fairness</h3>
        <p>We are committed to creating fair opportunities regardless of location, gender, or background.</p>
      </div>

      <!-- Card 6 -->
      <div style="background: linear-gradient(135deg, #cfd9df, #e2ebf0); border-radius: 1.5rem; padding: 2rem; color: #1f2b3a; box-shadow: 0 6px 18px rgba(0,0,0,0.08); transition: transform 0.3s ease, box-shadow 0.3s ease;" onmouseover="this.style.transform='scale(1.05)'; this.style.boxShadow='0 12px 24px rgba(0,0,0,0.2)'" onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='0 6px 18px rgba(0,0,0,0.08)'">
        <i class="fas fa-shield-alt" style="font-size: 2rem; margin-bottom: 1rem;"></i>
        <h3 style="font-size: 1.4rem; margin-bottom: 1rem;">Trust &amp; Security</h3>
        <p>We ensure that every interaction—between client and freelancer—is built on a foundation of transparency and safety.</p>
      </div>

    </div>
  </div>
</section>

    <!-- Platform Features -->
    <!-- Include Font Awesome CDN for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-sOMEKEYHERE" crossorigin="anonymous" referrerpolicy="no-referrer">

<section style="background: linear-gradient(135deg, #f0f4ff, #e8edff); padding: 5rem 2rem;">
  <div style="max-width: 1200px; margin: auto; text-align: center;">
    <h2 style="font-size: 2.8rem; margin-bottom: 2.5rem; color: #0d0d4d;">What Makes Us Different</h2>

    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 2rem;">

      <!-- BLUE 1 -->
      <div style="background: linear-gradient(135deg, #a1c4fd, #c2e9fb); border-radius: 1.5rem; padding: 2rem; color: #002b5e; box-shadow: 0 8px 20px rgba(0,0,0,0.05); transition: transform 0.3s ease, box-shadow 0.3s ease;" onmouseover="this.style.transform='scale(1.05)'; this.style.boxShadow='0 12px 24px rgba(0,0,0,0.15)'" onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='0 8px 20px rgba(0,0,0,0.05)'">
        <i class="fas fa-rocket" style="font-size: 2rem; margin-bottom: 1rem;"></i>
        <h3 style="font-size: 1.4rem; margin-bottom: 1rem;">Smart Job Matching</h3>
        <p style="line-height: 1.6;">Our platform uses intelligent pairing to connect freelancers and employers based on skillsets and needs.</p>
      </div>

      <!-- RED 1 -->
      <div style="background: linear-gradient(135deg, #ffdde1, #ee9ca7); border-radius: 1.5rem; padding: 2rem; color: #3a0000; box-shadow: 0 8px 20px rgba(0,0,0,0.05); transition: transform 0.3s ease, box-shadow 0.3s ease;" onmouseover="this.style.transform='scale(1.05)'; this.style.boxShadow='0 12px 24px rgba(0,0,0,0.15)'" onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='0 8px 20px rgba(0,0,0,0.05)'">
        <i class="fas fa-user-check" style="font-size: 2rem; margin-bottom: 1rem;"></i>
        <h3 style="font-size: 1.4rem; margin-bottom: 1rem;">Verified Talent Only</h3>
        <p style="line-height: 1.6;">Every freelancer is vetted through a multi-step process, ensuring high-quality results and reliability.</p>
      </div>

      <!-- BLUE 2 -->
      <div style="background: linear-gradient(135deg, #b3d9ff, #99ccff); border-radius: 1.5rem; padding: 2rem; color: #003366; box-shadow: 0 8px 20px rgba(0,0,0,0.05); transition: transform 0.3s ease, box-shadow 0.3s ease;" onmouseover="this.style.transform='scale(1.05)'; this.style.boxShadow='0 12px 24px rgba(0,0,0,0.15)'" onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='0 8px 20px rgba(0,0,0,0.05)'">
        <i class="fas fa-comments" style="font-size: 2rem; margin-bottom: 1rem;"></i>
        <h3 style="font-size: 1.4rem; margin-bottom: 1rem;">Seamless Collaboration</h3>
        <p style="line-height: 1.6;">Built-in messaging, file sharing, and milestone tools make teamwork smooth, even across time zones.</p>
      </div>

      <!-- RED 2 -->
      <div style="background: linear-gradient(135deg, #ffc1cc, #ff9999); border-radius: 1.5rem; padding: 2rem; color: #4d0000; box-shadow: 0 8px 20px rgba(0,0,0,0.05); transition: transform 0.3s ease, box-shadow 0.3s ease;" onmouseover="this.style.transform='scale(1.05)'; this.style.boxShadow='0 12px 24px rgba(0,0,0,0.15)'" onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='0 8px 20px rgba(0,0,0,0.05)'">
        <i class="fas fa-lock" style="font-size: 2rem; margin-bottom: 1rem;"></i>
        <h3 style="font-size: 1.4rem; margin-bottom: 1rem;">Transparent Payments</h3>
        <p style="line-height: 1.6;">With escrow protection and no hidden fees, both freelancers and clients enjoy peace of mind on every transaction.</p>
      </div>

      <!-- BLUE 3 -->
      <div style="background: linear-gradient(135deg, #d4fc79, #96e6a1); border-radius: 1.5rem; padding: 2rem; color: #1c4a00; box-shadow: 0 8px 20px rgba(0,0,0,0.05); transition: transform 0.3s ease, box-shadow 0.3s ease;" onmouseover="this.style.transform='scale(1.05)'; this.style.boxShadow='0 12px 24px rgba(0,0,0,0.15)'" onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='0 8px 20px rgba(0,0,0,0.05)'">
        <i class="fas fa-headset" style="font-size: 2rem; margin-bottom: 1rem;"></i>
        <h3 style="font-size: 1.4rem; margin-bottom: 1rem;">Global Human Support</h3>
        <p style="line-height: 1.6;">Get 24/7 live support—real people, real solutions—whenever and wherever you need help.</p>
      </div>

      <!-- RED 3 -->
      <div style="background: linear-gradient(135deg, #fcb1b1, #f77e7e); border-radius: 1.5rem; padding: 2rem; color: #4b1b1b; box-shadow: 0 8px 20px rgba(0,0,0,0.05); transition: transform 0.3s ease, box-shadow 0.3s ease;" onmouseover="this.style.transform='scale(1.05)'; this.style.boxShadow='0 12px 24px rgba(0,0,0,0.15)'" onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='0 8px 20px rgba(0,0,0,0.05)'">
        <i class="fas fa-chart-line" style="font-size: 2rem; margin-bottom: 1rem;"></i>
        <h3 style="font-size: 1.4rem; margin-bottom: 1rem;">Built for Scale</h3>
        <p style="line-height: 1.6;">Whether you're hiring one freelancer or managing teams—our platform grows with your needs.</p>
      </div>

    </div>
  </div>
</section>

    
        </div>
      
    
    
    
        
      
    
    
  <!-- Meet the Team Section -->
  <section style="background: linear-gradient(to right, #f0f0f0, #fafafa); padding: 5rem 2rem; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
    <h2 style="text-align: center; font-size: 2.5rem; margin-bottom: 3rem; color: #333;">Meet the Team</h2>
    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 2rem; max-width: 1200px; margin: auto;">
      
      <div style="background: white; padding: 2rem; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.08); text-align: center; transition: all 0.3s ease; transform: translateY(0);" class="team-member">
        <div style="width: 120px; height: 120px; margin: 0 auto 1.5rem; border-radius: 50%; overflow: hidden; border: 3px solid #4a6bff; padding: 3px; transition: all 0.3s ease;" class="img-container">
          <img src="<%=request.getContextPath()%>/images/team1.jpg" alt="Team member - Bishes" style="width: 100%; height: 100%; object-fit: cover; border-radius: 50%;">
        </div>
        <h3 style="margin: 0; font-size: 1.25rem; color: #222;">Bishes Maharjan</h3>
        <p style="margin: 0.5rem 0; color: #4a6bff; font-weight: 500;">
          <i class="fas fa-home" style="margin-right: 5px;"></i> Home Page
        </p>
        <p style="font-size: 0.95rem; color: #666; margin-bottom: 1rem;">Visionary leader passionate about connecting talents with opportunities globally.</p>
        <div style="display: flex; justify-content: center; gap: 1rem;">
          <a href="#" style="color: #555; transition: all 0.2s ease;" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
          <a href="#" style="color: #555; transition: all 0.2s ease;" class="social-icon"><i class="fab fa-twitter"></i></a>
          <a href="#" style="color: #555; transition: all 0.2s ease;" class="social-icon"><i class="fas fa-envelope"></i></a>
        </div>
      </div>
  
      <div style="background: white; padding: 2rem; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.08); text-align: center; transition: all 0.3s ease; transform: translateY(0);" class="team-member">
        <div style="width: 120px; height: 120px; margin: 0 auto 1.5rem; border-radius: 50%; overflow: hidden; border: 3px solid #ff6b6b; padding: 3px; transition: all 0.3s ease;" class="img-container">
          <img src="<%=request.getContextPath()%>/images/team2.jpg" alt="Team member - Manas" style="width: 100%; height: 100%; object-fit: cover; border-radius: 50%;">
        </div>
        <h3 style="margin: 0; font-size: 1.25rem; color: #222;">Manas Dongol</h3>
        <p style="margin: 0.5rem 0; color: #ff6b6b; font-weight: 500;">
          <i class="fas fa-briefcase" style="margin-right: 5px;"></i> Jobs Page
        </p>
        <p style="font-size: 0.95rem; color: #666; margin-bottom: 1rem;">Tech architect ensuring seamless experiences for freelancers and clients alike.</p>
        <div style="display: flex; justify-content: center; gap: 1rem;">
          <a href="#" style="color: #555; transition: all 0.2s ease;" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
          <a href="#" style="color: #555; transition: all 0.2s ease;" class="social-icon"><i class="fab fa-twitter"></i></a>
          <a href="#" style="color: #555; transition: all 0.2s ease;" class="social-icon"><i class="fas fa-envelope"></i></a>
        </div>
      </div>
  
      <div style="background: white; padding: 2rem; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.08); text-align: center; transition: all 0.3s ease; transform: translateY(0);" class="team-member">
        <div style="width: 120px; height: 120px; margin: 0 auto 1.5rem; border-radius: 50%; overflow: hidden; border: 3px solid #6bceff; padding: 3px; transition: all 0.3s ease;" class="img-container">
          <img src="<%=request.getContextPath()%>/images/team3.jpg" alt="Team member - Bigyan" style="width: 100%; height: 100%; object-fit: cover; border-radius: 50%;">
        </div>
        <h3 style="margin: 0; font-size: 1.25rem; color: #222;">Bigyan Nemkul</h3>
        <p style="margin: 0.5rem 0; color: #6bceff; font-weight: 500;">
          <i class="fas fa-info-circle" style="margin-right: 5px;"></i> Profile Page
        </p>
        <p style="font-size: 0.95rem; color: #666; margin-bottom: 1rem;">Creative mind behind our user-centric, clean, and modern design aesthetic.</p>
        <div style="display: flex; justify-content: center; gap: 1rem;">
          <a href="#" style="color: #555; transition: all 0.2s ease;" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
          <a href="#" style="color: #555; transition: all 0.2s ease;" class="social-icon"><i class="fab fa-twitter"></i></a>
          <a href="#" style="color: #555; transition: all 0.2s ease;" class="social-icon"><i class="fas fa-envelope"></i></a>
        </div>
      </div>
  
      <div style="background: white; padding: 2rem; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.08); text-align: center; transition: all 0.3s ease; transform: translateY(0);" class="team-member">
        <div style="width: 120px; height: 120px; margin: 0 auto 1.5rem; border-radius: 50%; overflow: hidden; border: 3px solid #a78bfa; padding: 3px; transition: all 0.3s ease;" class="img-container">
          <img src="<%=request.getContextPath()%>/images/team4.jpg" alt="Team member - Ayush" style="width: 100%; height: 100%; object-fit: cover; border-radius: 50%;">
        </div>
        <h3 style="margin: 0; font-size: 1.25rem; color: #222;">Ayush Das</h3>
        <p style="margin: 0.5rem 0; color: #a78bfa; font-weight: 500;">
          <i class="fas fa-info-circle" style="margin-right: 5px;"></i> About Us Page
        </p>
        <p style="font-size: 0.95rem; color: #666; margin-bottom: 1rem;">Creative mind behind our user-centric, clean, and modern design aesthetic.</p>
        <div style="display: flex; justify-content: center; gap: 1rem;">
          <a href="#" style="color: #555; transition: all 0.2s ease;" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
          <a href="#" style="color: #555; transition: all 0.2s ease;" class="social-icon"><i class="fab fa-twitter"></i></a>
          <a href="#" style="color: #555; transition: all 0.2s ease;" class="social-icon"><i class="fas fa-envelope"></i></a>
        </div>
      </div>
  
      <div style="background: white; padding: 2rem; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.08); text-align: center; transition: all 0.3s ease; transform: translateY(0);" class="team-member">
        <div style="width: 120px; height: 120px; margin: 0 auto 1.5rem; border-radius: 50%; overflow: hidden; border: 3px solid #20c997; padding: 3px; transition: all 0.3s ease;" class="img-container">
          <img src="<%=request.getContextPath()%>/images/team5.jpg" alt="Team member - Susam" style="width: 100%; height: 100%; object-fit: cover; border-radius: 50%;">
        </div>
        <h3 style="margin: 0; font-size: 1.25rem; color: #222;">Susam Pudasaini</h3>
        <p style="margin: 0.5rem 0; color: #20c997; font-weight: 500;">
          <i class="fas fa-database" style="margin-right: 5px;"></i> Backend and Database
        </p>
        <p style="font-size: 0.95rem; color: #666; margin-bottom: 1rem;">Creative mind behind our user-centric, clean, and modern design aesthetic.</p>
        <div style="display: flex; justify-content: center; gap: 1rem;">
          <a href="#" style="color: #555; transition: all 0.2s ease;" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
          <a href="#" style="color: #555; transition: all 0.2s ease;" class="social-icon"><i class="fab fa-twitter"></i></a>
          <a href="#" style="color: #555; transition: all 0.2s ease;" class="social-icon"><i class="fas fa-envelope"></i></a>
        </div>
      </div>
  
    </div>
  
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  
    <style>
      /* Hover effects */
      .team-member:hover {
        transform: translateY(-10px);
        box-shadow: 0 12px 24px rgba(0,0,0,0.12);
      }
      
      .team-member:hover .img-container {
        transform: scale(1.05);
      }
      
      .social-icon:hover {
        color: #4a6bff !important;
        transform: translateY(-2px);
      }
      
      /* Animation for the section header */
      h2 {
        position: relative;
        display: inline-block;
      }
      
      h2::after {
        content: '';
        position: absolute;
        width: 50%;
        height: 3px;
        bottom: -10px;
        left: 25%;
        background: linear-gradient(to right, #4a6bff, #6bceff);
        transform: scaleX(0);
        transform-origin: center;
        transition: transform 0.3s ease;
      }
      
      h2:hover::after {
        transform: scaleX(1);
      }
    </style>
  
    <script>
      // Add hover class to team members
      document.addEventListener('DOMContentLoaded', function() {
        const teamMembers = document.querySelectorAll('div[style*="background: white; padding: 2rem;"]');
        teamMembers.forEach(member => {
          member.classList.add('team-member');
          
          const imgContainer = member.querySelector('div[style*="width: 120px; height: 120px;"]');
          imgContainer.classList.add('img-container');
          
          const socialIcons = member.querySelectorAll('a');
          socialIcons.forEach(icon => {
            icon.classList.add('social-icon');
          });
        });
      });
    </script>
  </section>

    <!-- Call to Action -->
    <section style="background: linear-gradient(135deg, #3b82f6, #9333ea); padding: 4rem 2rem; border-radius: 2rem; margin: 4rem auto; max-width: 1200px; text-align: center; color: white; box-shadow: 0 12px 32px rgba(0, 0, 0, 0.15); transition: all 0.3s ease-in-out;">
      <div style="display: flex; flex-direction: column; align-items: center; gap: 1.5rem;">
        <i class="fas fa-rocket" style="font-size: 3rem; color: #fff; animation: float 3s ease-in-out infinite;"></i>
        <h2 style="font-size: 2.5rem; font-weight: 700;">Ready to Join Us?</h2>
        <p style="max-width: 600px; font-size: 1.2rem;">Whether you're a freelancer looking to shine or an employer hunting top-tier talent, your next big opportunity starts here.</p>
        <a href="#get-started" style="background: white; color: #4f46e5; padding: 0.9rem 2rem; font-size: 1.1rem; font-weight: 600; border-radius: 50px; text-decoration: none; transition: all 0.3s ease;">
          Get Started Now <i class="fas fa-arrow-right" style="margin-left: 0.5rem;"></i>
        </a>
      </div>
    </section>
    
    <!-- Floating animation for rocket icon -->
    <style>
    @keyframes float {
      0%, 100% {
        transform: translateY(0);
      }
      50% {
        transform: translateY(-8px);
      }
    }
    a:hover {
      background: #f0f0ff !important;
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    }
    </style>
    
    <!-- Font Awesome CDN (if not already added) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous">
    
  
  
  </body>
</html>