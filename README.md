<h1>School Management System</h1>
A Spring Boot-based web application for managing school-related data such as student, teacher, and department details. This application provides a comprehensive dashboard for administrators to manage users, view statistics, and update profiles. The system supports role-based authentication for admins and teachers, ensuring secure access to sensitive data.

<h3>Features</h3>
<li>Admin Login: Secure login for administrators to access the dashboard.</li>
<li>Teacher and Student Management: Add, update, and delete teacher and student profiles</li>
<li>Department Management: Add or view teachers by department</li>
<li>Dashboard: Provides a summary of the total number of students, teachers, and departments</li>
<li>Profile Management: Admin and teachers can view and update their profiles.</li>
<li>Password Reset: Admins can reset their passwords and send a reset link to their email</li>
<h3>Tech Stack</h3>
<ul>
<li>Backend: Spring Boot</li>
<li>Frontend: Thymeleaf (for rendering HTML templates)</li>
<li>Database: MySQL</li>
<li>Security: Spring Security (Authentication and Authorization)</li>
<li>Email: JavaMailSender (for sending reset password emails)</li>
<li>Password Encryption: BCryptPasswordEncoder</li>
</ul>
