<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

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
      background-color: indianred;
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

        .upmodal {
          display: none;
          position: fixed;
          z-index: 1;
          left: 0;
          top: 0;
          width: 100%;
          height: 100%;
          background-color: rgba(0, 0, 0, 0.7);
          justify-content: center;
          align-items: center;
        }

        .upmodal-content {
          background: url('https://31.media.tumblr.com/41c01e3f366d61793e5a3df70e46b462/tumblr_n4vc8sDHsd1st5lhmo1_1280.jpg');
          background-color: rgba(0, 0, 0, 0.7); /
          padding: 2rem;
          border-radius: 10px;
          overflow: auto;
          box-shadow: 0 15px 35px rgba(0, 0, 0, 0.9);
          width: 50%;
          max-width: 600px;
          color: white;
          display: flex;
          flex-direction: column;
          gap: 1.5rem;
        }

        label {
          margin: 0.5rem 0 0.2rem;
          font-size: 1rem;
        }

        input[type="text"], input[type="email"], input[type="tel"] {
          padding: .75rem;
          border: 1px solid rgba(255, 255, 255, 0.5);
          background-color: rgba(255, 255, 255, 0.1);
          color: white;
          font-size: 1.1rem;
          border-radius: 5px;
        }

        button {
          padding: .75rem;
          background-color: rgba(255, 255, 255, 0.3);
          border: none;
          color: white;
          background-color: #4CAF50;
          font-size: 1.1rem;
          cursor: pointer;
          border-radius: 5px;
          transition: background-color 0.3s ease-in-out;
        }

        button:hover {
          background-color: rgba(255, 255, 255, 0.5);
        }

        .close {
          position: absolute;
          top: 10px;
          right: 10px;
          color: white;
          font-size: 2em;
          cursor: pointer;
          z-index: 10;
        }

        .underlay-black {
          background: rgba(0, 0, 0, 0.7);
          position: fixed;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          z-index: -1;
        }
        .form-container {
              min-height: 10rem;
              margin: 2rem auto 0;
              max-width: 70%;
              padding: 1rem;
            }

            .form {
              background-color: rgba(0, 0, 0, 0.7);
              padding: 1.5rem;
              border-radius: 10px;
              color: white;
              display: flex;
              flex-direction: column;
              gap: 1rem;
            }

            label {
              margin: 0.5rem 0 0.2rem;
            }

            input[type="text"], input[type="email"], input[type="tel"] {
              padding: .75rem;
              border: 1px solid rgba(255, 255, 255, 0.5);
              background-color: rgba(255, 255, 255, 0.1);
              color: white;
              font-size: 1.1rem;
              border-radius: 5px;
            }

            .underlay-photo {
              animation: hue-rotate 6s infinite;
              background-size: cover;
              -webkit-filter: grayscale(30%);
              z-index: -1;
            }

            .underlay-black {
              background: rgba(0,0,0,0.7);
              z-index: -1;
            }

            .form-text{
              font-weight: 800;
              font-size: x-large;
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
    <form class="add-student-form" action="/addStudent" method="get">
      <button class="add-student-btn" type="submit">Add Student</button>
    </form>
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
                  <button onclick="openUpdateModal('${student.id}', '${student.name}', '${student.standard}', '${student.fathers_name}','${student.contact_number}')" class="update-button">Update</button>
                  <button onclick="deleteStudent('${student.id}')" class="delete-button">Delete</button>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
<div id="upmodal" class="upmodal">
    <span class="close" onclick="closeupmodal()">&times;</span>
    <div class="upmodal-content">
     <div class="form-container">
        <p class="form-text">Update Student Profile</p>
            <c:if test="${not empty errorMessage}">
                 <h3 class="error-message">${errorMessage}</h3>
            </c:if>
            <c:if test="${not empty errorMessage}">
                 <h3 class="error-message">${success}</h3>
            </c:if>
            <form action="/savestudentprofile"  method="post" id="updateStudentForm" class="form">
                    <input type="hidden" id="studentid" name="id" value="">

                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" required>

                    <label for="standard">Standard</label>
                    <input type="standard" id="standard" name="standard" required>

                    <label for="fathers_name">fathers_name</label>
                    <input type="tel" id="fathers_name" name="fathers_name" required>

                    <label for="contact_number">contact_number</label>
                    <input type="tel" id="contact_number" name="contact_number" required>

                    <button type="submit">Update Profile</button>
            </form>
        </form>
      </div>
    </div>
  </div>
  <div class="underlay-black"></div>

  <script>
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
    function openUpdateModal(id, name, standard, fathers_name,contact_number) {
          document.getElementById("studentid").value = id;
          document.getElementById("name").value = name;
          document.getElementById("standard").value = standard;
          document.getElementById("fathers_name").value = fathers_name;
          document.getElementById("contact_number").value = contact_number;

          upmodal.style.display = "flex";
        }

        function closeupmodal() {
          upmodal.style.display = "none";
        }

        window.onclick = function(event) {
          if (event.target === upmodal) {
            closeupmodal();
          }
        }
  </script>

</body>
</html>
