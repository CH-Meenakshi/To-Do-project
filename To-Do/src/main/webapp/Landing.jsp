<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>To-Do - Simple Task Management</title>
    <meta name="description" content="Organize your life with To-Do. Create, manage, and track your daily tasks with our beautiful and intuitive to-do application.">
    <meta name="author" content="To-Do App">
    
    <!-- Open Graph Meta Tags -->
    <meta property="og:title" content="To-Do - Simple Task Management">
    <meta property="og:description" content="Organize your life with To-Do. Create, manage, and track your daily tasks with our beautiful and intuitive to-do application.">
    <meta property="og:type" content="website">
    <link rel="stylesheet" href="Landing.css">
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-container">
            <div>
                <h1 class="logo">To-Do</h1>
            </div>
            <div class="auth-buttons">
                <a href="login.jsp" class="btn btn-ghost">Login</a>
                <a href="signup.jsp" class="btn btn-primary">Sign Up</a>
            </div>
            <!-- Menu toggle button (non-functional without JS) -->
            <button class="menu-toggle">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <line x1="3" y1="6" x2="21" y2="6"></line>
                    <line x1="3" y1="12" x2="21" y2="12"></line>
                    <line x1="3" y1="18" x2="21" y2="18"></line>
                </svg>
            </button>
            <div class="mobile-menu" id="mobileMenu">
                <a href="#" class="btn btn-ghost">Login</a>
                <a href="#" class="btn btn-primary">Sign Up</a>
            </div>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-container">
            <div class="hero-content fade-in-up">
                <h1 class="hero-title">
                    Organize Your Life with <span class="hero-highlight">To-Do</span>
                </h1>
                <p class="hero-description">
                    Stay productive and never miss a task. Create, organize, and track your daily goals with our beautiful and intuitive to-do application.
                </p>
                <div class="hero-buttons">
                    <a href="#" class="btn btn-primary btn-lg">Get Started Free</a>
                    <a href="#" class="btn btn-outline btn-lg">Learn More</a>
                </div>
            </div>
            <div class="hero-image fade-in-up">
                <svg width="500" height="300" viewBox="0 0 500 300" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <rect width="500" height="300" rx="16" fill="#fefdfb"/>
                    <rect x="40" y="60" width="420" height="40" rx="8" fill="#f7f3ef"/>
                    <rect x="60" y="70" width="20" height="20" rx="4" fill="#8b7355"/>
                    <rect x="100" y="75" width="200" height="10" rx="2" fill="#6b6358"/>
                    <rect x="40" y="120" width="420" height="40" rx="8" fill="#f7f3ef"/>
                    <rect x="60" y="130" width="20" height="20" rx="4" fill="#e6ddd4"/>
                    <rect x="100" y="135" width="150" height="10" rx="2" fill="#6b6358"/>
                    <rect x="40" y="180" width="420" height="40" rx="8" fill="#f7f3ef"/>
                    <rect x="60" y="190" width="20" height="20" rx="4" fill="#8b7355"/>
                    <rect x="100" y="195" width="180" height="10" rx="2" fill="#6b6358"/>
                    <circle cx="60" cy="70" r="2" fill="#ffffff"/>
                    <circle cx="60" cy="190" r="2" fill="#ffffff"/>
                </svg>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features">
        <div class="features-container">
            <div class="features-header fade-in-up">
                <h2 class="features-title">Everything you need to stay organized</h2>
                <p class="features-description">
                    Powerful features designed to help you manage tasks efficiently and boost your productivity.
                </p>
            </div>
            <div class="features-grid">
                <div class="feature-card fade-in-up">
                    <div class="feature-icon">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
                            <polyline points="22,4 12,14.01 9,11.01"></polyline>
                        </svg>
                    </div>
                    <h3 class="feature-title">Simple Task Management</h3>
                    <p class="feature-description">
                        Create, edit, and complete tasks with ease. Our intuitive interface makes organizing your day effortless.
                    </p>
                </div>
                <div class="feature-card fade-in-up">
                    <div class="feature-icon">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                            <line x1="16" y1="2" x2="16" y2="6"></line>
                            <line x1="8" y1="2" x2="8" y2="6"></line>
                            <line x1="3" y1="10" x2="21" y2="10"></line>
                        </svg>
                    </div>
                    <h3 class="feature-title">Smart Scheduling</h3>
                    <p class="feature-description">
                        Set due dates and reminders to never miss important deadlines. Plan your week with our calendar integration.
                    </p>
                </div>
                <div class="feature-card fade-in-up">
                    <div class="feature-icon">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M6 8a6 6 0 0 1 12 0c0 7 3 9 3 9H3s3-2 3-9"></path>
                            <path d="M10.3 21a1.94 1.94 0 0 0 3.4 0"></path>
                        </svg>
                    </div>
                    <h3 class="feature-title">Smart Notifications</h3>
                    <p class="feature-description">
                        Get timely reminders and stay on track with intelligent notifications that adapt to your workflow.
                    </p>
                </div>
                <div class="feature-card fade-in-up">
                    <div class="feature-icon">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"></path>
                            <circle cx="9" cy="7" r="4"></circle>
                            <path d="M22 21v-2a4 4 0 0 0-3-3.87"></path>
                            <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                        </svg>
                    </div>
                    <h3 class="feature-title">Team Collaboration</h3>
                    <p class="feature-description">
                        Share lists and collaborate with team members. Perfect for both personal and professional projects.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta">
        <div class="cta-container fade-in-up">
            <h2 class="cta-title">Ready to Get Organized?</h2>
            <p class="cta-description">
                Join thousands of users who have transformed their productivity with To-Do. Start your journey today.
            </p>
            <div class="cta-buttons">
                <a href="#" class="btn btn-primary btn-lg">Get Started Now</a>
               <!--   <a href="#" class="btn btn-outline btn-lg">View Pricing</a> -->
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-grid">
                <div>
                    <div class="footer-brand">
                        <h3 class="footer-title">To-Do</h3>
                        <p class="footer-description">
                            The simple and elegant way to manage your tasks and boost productivity.
                        </p>
                    </div>
                </div>
                <div>
                    <h4 class="footer-section-title">Product</h4>
                    <ul class="footer-links">
                        <li><a href="#">Features</a></li>
                        <li><a href="#">Pricing</a></li>
                        <li><a href="#">Security</a></li>
                    </ul>
                </div>
                <div>
                    <h4 class="footer-section-title">Company</h4>
                    <ul class="footer-links">
                        <li><a href="#">About</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">Careers</a></li>
                    </ul>
                </div>
                <div>
                    <h4 class="footer-section-title">Support</h4>
                    <ul class="footer-links">
                        <li><a href="#">Help Center</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">API Docs</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 To-Do. All rights reserved.</p>
            </div>
        </div>
    </footer>
</body>
</html>
