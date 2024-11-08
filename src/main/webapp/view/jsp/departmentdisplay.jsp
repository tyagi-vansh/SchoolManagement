<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <title>Department Details</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-image: url('/images/school.jpg');
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
      color: #fff;
    }

    .header {
          color: black;
          text-align: center;
          font-size: 25px;
          font-weight: bold;
          padding: 1rem 0;
          top: 30px;
          left: 0;
          right: 0;
          z-index: 10;
        }

        .header h1 {
          margin: 0;
        }

    h1 {
      text-align: center;
      margin-top: 20px;
      font-size: 48px;
      color: black;
    }

    .department-details {
      background-color: rgba(0, 0, 0, 0.7);
      padding: 20px;
      margin: 30px auto;
      width: 60%;
      border-radius: 10px;
      text-align: center;
    }

    .department-details p {
      font-size: 20px;
      color: white;
    }

    /* Style for the Faculty Members Table */
    table {
      width: 100%;
      border-collapse: collapse;
      margin: 20px auto;
      background-color: rgba(0, 0, 0, 0.7);
      border-radius: 10px;
      padding: 10px;
    }

    th, td {
      padding: 10px;
      text-align: left;
      color: white;
    }

    th {
      background-color: #333;
      font-size: 18px;
    }

    tr:nth-child(even) {
      background-color: rgba(255, 255, 255, 0.1);
    }

    tr:hover {
      background-color: rgba(0, 0, 0, 0.5);
    }

    .back-button {
      padding: 10px 20px;
      margin-top: 20px;
      background-color: #4CAF50;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 18px;
    }

    .back-button:hover {
      background-color: #66bb6a;
    }
  </style>
</head>
<body>

      <div class="header">
        <h1>ABC International School</h1>
      </div>

  <h1>Department Details</h1>

  <c:if test="${not empty department}">
    <div class="department-details">
      <p><strong>Department Name:</strong> ${department.name}</p>
      <p><strong>Department_ID:</strong> ${department.id}</p>
      <p><strong>Email:</strong> ${department.email}</p>
    </div>
  </c:if>

  <h2 style="text-align: center; color: midnightblue;">Faculty Members</h2>

  <table>
    <thead>
      <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Mobile</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="teach" items="${teacher}">
        <tr>
          <td>${teach.name}</td>
          <td>${teach.email}</td>
          <td>${teach.mobile}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>

  <form action="/department" method="get" style="text-align: center;">
    <input type="submit" value="Back to Departments" class="back-button">
  </form>

</body>
</html>
