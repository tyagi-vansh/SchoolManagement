<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

  <title>Class Management</title>
  <style>
    @import url(https://fonts.googleapis.com/css?family=Roboto:300,400,700);

    body, html {
      height: 100%;
      margin: 0;
      font-family: 'Roboto', sans-serif;
      background-image: url('/images/school.jpg');
      background-size: cover;
      background-position: center;
      color: #fff;
      display: flex;
      flex-direction: column;
    }

    .header {
      background: rgba(0, 0, 0, 0.8);
      text-align: center;
      padding: 20px 0;
      position: fixed;
      width: 100%;
      top: 0;
      z-index: 10;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
    }

    .header h1 {
      margin: 0;
      font-size: 2.5rem;
    }

    .nav-button {
      position: fixed;
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
      display: none; /* Initially hidden */
      flex-direction: column; /* Vertical layout */
      position: fixed;
      top: 155px; /* Below the header */
      left: 30px; /* Align with button */
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

    h1 {
      text-align: center;
      margin-top: 100px; /* Adjust for fixed header */
      font-size: 48px;
      color: white;
    }

    p {
      text-align: center;
      font-size: 20px;
      color: black;
    }

    .class-form {
      display: flex;
      justify-content: center;
      flex-wrap: wrap;
      margin-top: 10px;
    }

    .class-btn, .add-student-btn {
      margin: 10px;
      padding: 15px 30px;
      font-size: 18px;
      cursor: pointer;
      color: white;
      border: none;
      border-radius: 5px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
      transition: background-color 0.3s ease;
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
    }
    .classmg{
        text-align: center;
        margin-top: 100px;
        font-size: 48px;
        color: black;
    }

    .class-btn {
      background-color: rgba(76, 175, 80, 0.8);
      width: 250px;
      height: 50px;
    }

    .class-btn:hover {
      background-color:black;
    }

    .add-student-btn {
      background-color: rgba(33, 150, 243, 0.8);
      width: 200px;
      height: 50px;
    }
    .back-button {
      background-color: #4CAF50;
      width: 200px;
      color:white;
      height: 50px;
      margin-top: 20px;
      border: none;
      border-radius: 5px;
      font-size: 18px;
      transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .back-button:hover {
      background-color: black;
      color: white;
      transform: scale(1.05);
    }


    .add-student-btn:hover {
      background-color: rgba(30, 136, 229, 0.9);
    }

    .underlay-black {
      background: rgba(0, 0, 0, 0.5);
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      z-index: -1;
    }
  </style>
</head>
<body>

  <div class="header">
    <h1>ABC International School</h1>
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

  <h1 class = "classmg">Class Management</h1>

  <!-- Add Student Button -->
  <form action="/addStudent" method="get" style="display: flex; justify-content: center;">
    <input type="submit" value="Add Student" class="add-student-btn">
  </form>

  <p>Select a class to view its students:</p>

  <!-- Class buttons -->
  <div class="class-form">
    <form action="/student-management" method="get">
      <input type="hidden" name="id" value="1">
      <input type="submit" name="className" value="1" class="class-btn">
    </form>
    <form action="/student-management" method="get">
      <input type="submit" name="className" value="2" class="class-btn">
    </form>
    <form action="/student-management" method="get">
      <input type="submit" name="className" value="3" class="class-btn">
    </form>
    <form action="/student-management" method="get">
      <input type="submit" name="className" value="4" class="class-btn">
    </form>
    <form action="/student-management" method="get">
      <input type="submit" name="className" value="5" class="class-btn">
    </form>
    <form action="/student-management" method="get">
      <input type="submit" name="className" value="6" class="class-btn">
    </form>
    <form action="/student-management" method="get">
      <input type="submit" name="className" value="7" class="class-btn">
    </form>
    <form action="/student-management" method="get">
      <input type="submit" name="className" value="8" class="class-btn">
    </form>
    <form action="/student-management" method="get">
      <input type="submit" name="className" value="9" class="class-btn">
    </form>
    <form action="/student-management" method="get">
      <input type="submit" name="className" value="10" class="class-btn">
    </form>
    <form action="/student-management" method="get">
      <input type="submit" name="className" value="11" class="class-btn">
    </form>
    <form action="/student-management" method="get">
      <input type="submit" name="className" value="12" class="class-btn">
    </form>
  </div>

  <div class="underlay-black"></div>

  <script>
    function toggleNavbar() {
      const navbar = document.getElementById('navbar');
      navbar.style.display = navbar.style.display === 'flex' ? 'none' : 'flex';
    }
  </script>

</body>
</html>
