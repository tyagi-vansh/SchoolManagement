<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Student</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    @import url(https://fonts.googleapis.com/css?family=Open+Sans:100,300,400,700);
    @import url(//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css);

    body, html {
      height: 100%;
      margin: 0;
      font-family: 'Open Sans';
      font-weight: 100;
      display: flex;
      flex-direction: column;
      overflow: scroll;
      background-image: url('/images/school.jpg');
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
    }

    .header {
      color: black;
      text-align: center;
      font-size: 1.5rem;
      font-weight: bold;
      position: absolute;
      padding: 1rem 0;
      top: 25px;
      left: 0;
      right: 0;
      z-index: 10;
    }

    .header h1 {
      margin: 0;
    }

    .form-container {
      min-height: 10rem;
      margin: 6rem auto 0;
      max-width: 70%;
      padding: .5rem;
    }

    .form-text {
      color: black;
      font-size: 1.5rem;
      margin: 0 auto;
      max-width: 50%;
      padding: .5rem;
      text-align: center;
    }

    form {
      background-color: rgba(0, 0, 0, 0.7);
      padding: 1.5rem;
      border-radius: 10px;
      color: white;
      display: flex;
      flex-direction: column;
      gap: 1rem;
    }

    input[type="text"] {
      padding: .75rem;
      border: 1px solid rgba(255, 255, 255, 0.5);
      background-color: rgba(255, 255, 255, 0.1);
      color: white;
      font-size: 1.1rem;
    }

    button {
      padding: .75rem;
      background-color: rgba(255, 255, 255, 0.3);
      border: none;
      color: white;
      font-size: 1.1rem;
      cursor: pointer;
    }

    button:hover {
      background-color: rgba(255, 255, 255, 0.5);
    }

    .nav-button {
      position: absolute;
      top: 110px;
      left: 30px;
      background: #4CAF50;
      border: none;
      border-radius: 5px;
      color: white;
      font-size: 1.2rem;
      padding: 10px 20px;
      cursor: pointer;
      transition: background 0.3s, transform 0.2s;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
    }

    .nav-button:hover {
      background: #45a049;
      transform: scale(1.05);
    }

    .navbar {
      display: none;
      flex-direction: column;
      position: absolute;
      top: 155px;
      left: 30px;
      background: rgba(0, 0, 0, 0.9);
      border-radius: 5px;
      z-index: 15;
      padding: 10px 0;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
    }

    .navbar-button {
      padding: 15px;
      color: #fff;
      text-align: center;
      border: none;
      background: transparent;
      cursor: pointer;
      width: 200px;
      transition: background 0.3s, transform 0.2s;
      position: relative;
    }

    .navbar-button::before {
      content: '';
      position: absolute;
      left: 0;
      right: 0;
      bottom: 0;
      height: 2px;
      background: #4CAF50;
      transform: scaleX(0);
      transition: transform 0.3s;
    }

    .navbar-button:hover {
      background: rgba(76, 175, 80, 0.8);
    }

    .navbar-button:hover::before {
      transform: scaleX(1);
    }

    .underlay-photo {
      animation: hue-rotate 6s infinite;
      background: url('https://31.media.tumblr.com/41c01e3f366d61793e5a3df70e46b462/tumblr_n4vc8sDHsd1st5lhmo1_1280.jpg');
      background-size: cover;
      -webkit-filter: grayscale(30%);
      z-index: -1;
    }

    .underlay-black {
      background: rgba(0,0,0,0.7);
      z-index: -1;
    }

    @keyframes hue-rotate {
      from {
        -webkit-filter: grayscale(30%) hue-rotate(0deg);
      }
      to {
        -webkit-filter: grayscale(30%) hue-rotate(360deg);
      }
    }
  </style>
</head>

<body>

  <div class="header">
    <h1>XYZ School of Excellence</h1>
  </div>

  <button class="nav-button" onclick="toggleNavbar()"> MENU</button>

  <div class="navbar" id="navbar">
    <button class="navbar-button" onclick="location.href='/dashboard'">Back to Dashboard</button>
    <button class="navbar-button" onclick="location.href='/teacher'">
      <i class="fa fa-user-graduate"></i> Teacher Management
    </button>
    <button class="navbar-button" onclick="location.href='/classdisplay'">
      <i class="fa fa-user-graduate"></i> Student Management
    </button>
    <button class="navbar-button" onclick="location.href='/department'">
      <i class="fa fa-user-graduate"></i> Department Management
    </button>
  </div>

  <div class="form-container">
    <p class="form-text">Add New Student</p>

    <form action="/addNewStudent" method="POST">
      <label for="name">Student Name:</label>
      <input type="text" id="name" name="name" required>

      <label for="standard">Class (Standard):</label>
      <input type="text" id="standard" name="standard" value="${classId}" required>

      <label for="fatherName">Father's Name:</label>
      <input type="text" id="fatherName" name="fathers_name" required>

      <label for="contactNumber">Contact Number:</label>
      <input type="text" id="contactNumber" name="contact_number" required>

      <button type="submit">Add Student</button>
    </form>
  </div>

  <div class="underlay-photo"></div>
  <div class="underlay-black"></div>

  <script>
    function toggleNavbar() {
      const navbar = document.getElementById('navbar');
      navbar.style.display = navbar.style.display === 'flex' ? 'none' : 'flex';
    }
  </script>

</body>
</html>
