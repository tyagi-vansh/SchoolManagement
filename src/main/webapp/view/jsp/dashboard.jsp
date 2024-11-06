<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard</title>
  <style>
    @import url(https://fonts.googleapis.com/css?family=Roboto:300,400,700);
    @import url(//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css);

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
      top: 100px;
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
      position: fixed;
      top: 145px;
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

    .dashboard {
      display: flex;
      flex-direction: row;
      justify-content: space-around;
      align-items: center;
      height: calc(100% - 120px);
      margin-top: 80px;
    }

    .info-box {
      background: #4CAF50;
      border-radius: 10px;
      padding: 20px;
      text-align: center;
      font-size: 1.5rem;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
      transition: transform 0.3s;
    }

    .info-box:hover {
      background: black;
      transform: scale(1.05);
    }

    .underlay-black {
      background: rgba(0, 0, 0, 0.5);
      z-index: -1;
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
    }

    /* Profile Button Styles */
    .profile-button {
      position: fixed;
      top: 20px;
      right: 30px;
      width: 50px;
      height: 50px;
      background: #4CAF50;
      border: none;
      border-radius: 50%;
      color: white;
      font-size: 1.5rem;
      cursor: pointer;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
      display: flex;
      justify-content: center;
      align-items: center;
      transition: background 0.3s, transform 0.2s;
      z-index:10;
    }

    .profile-button:hover {
      background: #45a049;
      transform: scale(1.05);
    }
  </style>
</head>
<body>

  <div class="header">
    <h1>ABC International School</h1>
  </div>

  <button class="nav-button" onclick="toggleNavbar()"> MENU</button>

  <button class="profile-button" onclick="location.href='/profile'">
    <i class="fa fa-user"></i>
  </button>

  <div class="navbar" id="navbar">
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

  <div class="dashboard">
    <div class="info-box" onclick="location.href='/classdisplay'">Total Students: <span id="totalStudents" >${studentcount}</span></div>
    <div class="info-box" onclick="location.href='/teacher'">Total Teachers: <span id="totalTeachers" >${teachercount}</span></div>
    <div class="info-box" onclick="location.href='/department'">Total Departments: <span id="totalDepartments" >${departmentcount}</span></div>
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
