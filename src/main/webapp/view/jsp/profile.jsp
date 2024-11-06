<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Profile</title>
  <style>
    @import url(https://fonts.googleapis.com/css?family=Open+Sans:100,300,400,700);
    @import url(//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css);

    body, html {
      height: 100%;
      margin: 0;
    }

    body {
      background-image: url('/images/school.jpg');
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
      font-family: 'Open Sans';
      font-weight: 100;
      display: flex;
      flex-direction: column;
      overflow: scroll;
    }

    .header {
      color: black;
      text-align: center;
      font-size: 1.5rem;
      font-weight: bold;
      padding: 1rem 0;
      position: absolute;
      top: 25px;
      left: 0;
      right: 0;
      z-index: 10;
    }

    .header h1 {
      margin: 0;
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

    .table-container {
      min-height: 10rem;
      margin: 6rem auto 0;
      max-width: 70%;
      padding: .5rem;
    }

    .table-text {
      color: black;
      font-size: 1.5rem;
      margin: 0 auto;
      font-size:30px;
      font-weight:bold;
      max-width: 50%;
      padding: .5rem;
      text-align: center;
    }

    table {
      width: 100%;
      background-color: rgba(0, 0, 0, 0.7);
      border-collapse: collapse;
      margin: 1rem 0;
    }

    th, td {
      padding: .75rem;
      text-align: left;
      border: 1px solid rgba(255, 255, 255, 0.5);
    }

    th {
      background-color: rgba(255, 255, 255, 0.3);
      color: white;
    }

    td {
      background-color: rgba(255, 255, 255, 0.1);
      color: white;
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

    .footer-buttons {
      display: flex;
      justify-content: center;
      margin-top: 2rem;
    }

    .footer-button {
      background: dodgerblue;
      border: 1px solid white;
      color: white;
      padding: 0.75rem 2rem;
      font-size: 1.2rem;
      cursor: pointer;
      transition: 250ms background ease-in;
      border-radius: 4px;
      box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.2);
      margin: 0 1rem; /* Add space between buttons */
    }

    .footer-button:hover,
    .footer-button:focus {
      background: white;
      color: black;
      transition: 250ms background ease-in;
    }
  </style>
</head>

<body>

  <div class="header">
    <h1>Admin Profile</h1>
  </div>

  <button class="nav-button" onclick="toggleNavbar()"> MENU</button>

  <div class="navbar" id="navbar">
    <button class="navbar-button" onclick="location.href='/dashboard'">Back to Dashboard</button>
    <button class="navbar-button" onclick="location.href='/teacher'">Teacher Management</button>
    <button class="navbar-button" onclick="location.href='/classdisplay'">Student Management</button>
    <button class="navbar-button" onclick="location.href='/department'">Department Management</button>
  </div>

  <br>

  <div class="table-container">
    <p class="table-text">Admin Details</p>

    <table>
      <thead>
        <tr>
          <th>Name</th>
          <th>Email</th>
          <th>Mobile</th>
          <th>Address</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>${admin.name}</td>
          <td>${admin.email}</td>
          <td>${admin.mobile}</td>
          <td>${admin.address}</td>
        </tr>
      </tbody>
    </table>
  </div>

  <div class="footer-buttons">
  <c:if test="${not empty errorMessage}">
               <h3 class="success">${success}</h3>
          </c:if>
    <form action="/updateprofile" method="get" class="footer-button-form">
        <button type="submit" class="footer-button">
            Update Profile
        </button>
    </form>
    <form action="/updatepassword" method="get" class="footer-button-form">
        <button type="submit" class="footer-button">
            Update Password
        </button>
    </form>
    <form action="/logout" method="get" class="footer-button-form">
        <button type="submit" class="footer-button">
            Logout
        </button>
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
