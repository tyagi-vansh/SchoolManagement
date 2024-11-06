<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Records</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <style>
    @import url(https://fonts.googleapis.com/css?family=Open+Sans:100,300,400,700);
    @import url(//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css);

    body, html {
      height: 100%;
      margin: 0;
      font-family: 'Open Sans';
      font-weight: 100;
      overflow: hidden; /* Prevent body scrollbars */
      color: #fff;
      display: flex;
      flex-direction: column;
      background-image: url('/images/school.jpg');
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
    }

    /* Header Styling */
    .header {
      background: rgba(255, 255, 255, 0.7); /* Light background for visibility */
      color: black;
      text-align: center;
      font-size: 1.5rem;
      font-weight: bold;
      padding: 1rem 0;
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      z-index: 10;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    }

    .header h1 {
      margin: 0;
    }

    .add-student-btn {
      background-color: #4CAF50;
      color: white;
      border: none;
      padding: 10px 20px;
      font-size: 1rem;
      cursor: pointer;
      border-radius: 5px;
      transition: background 0.3s, transform 0.2s;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
    }

    .add-student-btn:hover {
      background-color: #45a049;
      transform: scale(1.05);
    }

    /* Navigation Button Styling */
    .nav-button {
      position: fixed;
      top: 80px;
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
      z-index: 10;
    }

    .nav-button:hover {
      background: #45a049;
      transform: scale(1.05);
    }

    /* Navbar Styling */
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

    /* Main Content Container */
    .content {
      margin-top: 120px; /* Space for fixed header */
      flex-grow: 1;
      overflow: hidden; /* Prevent extra scrolling in body */
    }

    .table-container {
      overflow-y: auto; /* Enable vertical scrolling */
      height: calc(100vh - 160px); /* Adjust height based on header */
      margin: 1rem auto;
      max-width: 70%;
      padding: .5rem;
    }

    .table-text {
      color: black;
      font-size: 35px;
      margin: 0 auto;
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

    .delete-button {
      padding: 10px 20px;
      margin: 20px;
      background-color: #4CAF50;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 18px;
      transition: background-color 0.3s;
    }

    .delete-button:hover {
      background-color: #66bb6a;
    }

    .underlay-black {
      background: rgba(0, 0, 0, 0.7);
      z-index: -1;
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
    }

  </style>
</head>

<body>

  <!-- Fixed Header -->
  <div class="header">
    <h1>XYZ School of Excellence</h1>
    <form class="add-student-form" action="/addStudent" method="get">
      <button class="add-student-btn" type="submit">Add Student</button>
    </form>
  </div>

  <!-- Fixed Menu Button -->
  <button class="nav-button" onclick="toggleNavbar()"> MENU</button>

  <!-- Navbar (hidden initially) -->
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

  <!-- Content Section with Scrollable Table -->
  <div class="content">
    <div class="table-container">
      <p class="table-text">Student Records</p>

      <table>
        <thead>
          <tr>
            <th>Roll Number</th>
            <th>Name</th>
            <th>Class</th>
            <th>Father's Name</th>
            <th>Contact Number</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="student" items="${students}">
            <tr>
              <td>${student.id}</td>
              <td>${student.name}</td>
              <td>${student.standard}</td>
              <td>${student.fathers_name}</td>
              <td>${student.contact_number}</td>
              <td>
                  <button onclick="deleteStudent('${student.id}')" class="delete-button">Delete</button>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>

  <div class="underlay-black"></div>

  <script>
    // Toggle Navbar visibility
    function toggleNavbar() {
      const navbar = document.getElementById('navbar');
      navbar.style.display = navbar.style.display === 'flex' ? 'none' : 'flex';
    }

    function deleteStudent(id){
        if(confirm("Press ok to delete Student")){
            $.ajax({
                url : "/deleteStudent/"+ id,
                type : "post",
                success : function(data){
                        alert("Student deleted successfully");
                        location.reload();
                },
                error : function(data){
                    alert(data.message);
                }
            });
        }
    }
  </script>

</body>
</html>
