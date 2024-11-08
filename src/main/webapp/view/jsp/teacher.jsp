<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Teacher Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <style>
    @import url(https://fonts.googleapis.com/css?family=Roboto:300,400,700);

    body, html {
      height: 100%;
      margin: 0;
      background-image: url('/images/school.jpg');
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
      font-family: 'Roboto', sans-serif;
      color: #fff;
      display: flex;
      flex-direction: column;
      overflow: hidden;
    }

    .header {
      background: rgba(0, 0, 0, 0.8);
      text-align: center;
      padding: 20px 0;
      position: fixed;
      width: 100%;
      top: 0;
      z-index: 1;
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
      z-index: 10;
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

    .navbar-button:hover {
      background: rgba(76, 175, 80, 0.8);
    }

    .table-container {
      overflow: auto;
      height: calc(100% - 160px);
      margin: 8rem auto 0;
      max-width: 85%;
      padding: 1rem;
      background-color: rgba(0, 0, 0, 0.7);
      border-radius: 10px;
    }

    .table-text {
      color: black;
      font-size: 35px;
      margin: 0 auto;
      max-width: 50%;
      padding: 0.5rem;
      text-align: center;
    }

    table {
      width: 100%;
      background-color: rgba(0, 0, 0, 0.7);
      border-collapse: collapse;
      margin: 1rem 0;
    }

    th, td {
      padding: 1rem;
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

    .back-button, .add-button, .delete-button, .update-button {
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

    .back-button:hover, .add-button:hover, .delete-button:hover, .update-button:hover {
      background-color: #66bb6a;
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
      background-color: green;
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

        button {
          padding: .75rem;
          background-color: rgba(255, 255, 255, 0.3);
          border: none;
          color: white;
          background-color: green;
          font-size: 1.1rem;
          cursor: pointer;
          border-radius: 5px;
        }

        button:hover {
          background-color: rgba(255, 255, 255, 0.5);
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
    <h1>ABC International School</h1>
  </div>

  <button class="nav-button" onclick="toggleNavbar()"> MENU</button>

  <div class="navbar" id="navbar">
    <button class="navbar-button" onclick="location.href='/dashboard'">Back to Dashboard</button>
    <button class="navbar-button" onclick="location.href='/teacher'">Teacher Management</button>
    <button class="navbar-button" onclick="location.href='/classdisplay'">Student Management</button>
    <button class="navbar-button" onclick="location.href='/department'">Department Management</button>
  </div>

  <div class="table-container">
    <h1 style="text-align: center; margin-top: 10px; color: white;">Teacher Details</h1>

    <c:if test="${not empty teacher}">
      <div class="teacher-details" style="text-align: center;">
        <p><strong>Name:</strong> ${teacher.name}</p>
        <p><strong>Email:</strong> ${teacher.email}</p>
        <p><strong>Mobile:</strong> ${teacher.mobile}</p>
      </div>
    </c:if>

    <table>
      <thead>
        <tr>
          <th>Name</th>
          <th>Email</th>
          <th>Mobile</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="teach" items="${teachers}">
          <tr>
            <td>${teach.name}</td>
            <td>${teach.email}</td>
            <td>${teach.mobile}</td>
            <td>
              <button onclick="openUpdateModal('${teach.id}', '${teach.name}', '${teach.email}', '${teach.mobile}')" class="update-button">Update</button>
              <button onclick="deleteTeacher('${teach.id}')" class="delete-button">Delete</button>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

  <div style="text-align: center; margin-bottom: 20px;">
    <form action="/dashboard" method="get" style="display: inline;">
      <input type="submit" value="Back to Dashboard" class="back-button">
    </form>
    <form action="/addteacher" method="get" style="display: inline;">
      <input type="submit" value="Add Teacher" class="add-button">
    </form>
  </div>

  <div class="underlay-black"></div>

  <div id="upmodal" class="upmodal">
    <span class="close" onclick="closeupmodal()">&times;</span>
    <div class="upmodal-content">
     <div class="form-container">
        <p class="form-text">Update Teacher Profile</p>
            <c:if test="${not empty errorMessage}">
                 <h3 class="error-message">${errorMessage}</h3>
            </c:if>
            <c:if test="${not empty errorMessage}">
                 <h3 class="error-message">${success}</h3>
            </c:if>
            <form action="/saveteacherprofile" method="post" id="updateTeacherForm" class="form">
                    <input type="hidden" id="teacherId" name="id" value="">

                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" required>

                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required>

                    <label for="mobile">Mobile</label>
                    <input type="tel" id="mobile" name="mobile" required>

                    <button type="submit">Update Profile</button>
            </form>

        </form>
      </div>
    </div>
  </div>


  <script>
    var upmodal = document.getElementById("upmodal");

    function toggleNavbar() {
      const navbar = document.getElementById('navbar');
      navbar.style.display = navbar.style.display === 'flex' ? 'none' : 'flex';
    }

    function deleteTeacher(id) {
      if (confirm("Press OK to delete teacher")) {
        $.ajax({
          url: "/deleteTeacher/" + id,
          type: "post",
          success: function(data) {
            alert("Teacher deleted successfully!");
            location.reload();
          },
          error: function(data) {
            alert(data.message);
          }
        });
      }
    }

    function openUpdateModal(id, name, email, mobile) {
      document.getElementById("teacherId").value = id;
      document.getElementById("name").value = name;
      document.getElementById("email").value = email;
      document.getElementById("mobile").value = mobile;

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
