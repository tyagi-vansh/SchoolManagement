<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <title>Confirm Password</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:100,300,400,700&display=swap');

        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Open Sans', sans-serif;
            background-image: url('/images/school.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        .header {
            color: black;
            text-align: center;
            margin-top: 50px;
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

        .confirm-password-container {
            min-height: 70vh;
            display: flex;
            margin-top: 100px;
            justify-content: center;
            align-items: center;
        }

        .confirm-password {
            background: rgba(0, 0, 0, 0.7);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.9);
            color: #fff;
            text-align: center;
        }

        .confirm-password h2 {
            font-size: 2em;
            color: #fff; /* Changed to white */
            margin-bottom: 20px;
        }

        .confirm-password .form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .confirm-password .form .inputBox {
            position: relative;
            width: 100%;
        }

        .confirm-password .form .inputBox input {
            width: 100%;
            background: #333;
            border: none;
            padding: 15px 10px;
            border-radius: 4px;
            color: #fff;
            font-weight: 500;
            font-size: 1em;
            outline: none;
        }

        .confirm-password .form .inputBox input[type="submit"] {
            background: #fff; /* Changed to white */
            color: #000;
            font-weight: 600;
            font-size: 1.2em;
            cursor: pointer;
            padding: 10px;
            border: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .confirm-password .form .inputBox input[type="submit"]:hover {
            background-color: #f0f0f0; /* Light gray on hover */
        }

        .error-message {
            color: red;
            font-weight: bold;
            margin: 10px 0;
        }

        .spacing {
            margin-top: 30px; /* Adjust this value as needed */
        }
    </style>
</head>

<body>

    <div class="header">
        <h1>XYZ School of Excellence</h1>
    </div>

    <div class="confirm-password-container">
        <div class="confirm-password">
            <h2>Confirm Password</h2>
            <c:if test="${not empty errorMessage}">
                <h3 class="error-message">${errorMessage}</h3>
            </c:if>
            <div class="spacing"></div>
            <form id="resetForm" action="/confirmpassword/${encodedEmail}" method="POST">
                <div class="form">
                    <div class="inputBox">
                        <input type="password" id="newPassword" name="newPassword" required placeholder="Password">
                    </div>
                    <div class="inputBox">
                        <input type="password" id="confirmPassword" name="confirmpassword" required placeholder="Confirm Password">
                    </div>
                    <div class="inputBox">
                        <input type="submit" value="Submit">
                    </div>
                </div>
            </form>
            <p id="message" class="error-message" style="display: none;"></p>
        </div>
    </div>

    <script>
        document.getElementById('resetForm').addEventListener('submit', function(event) {
                    const newPassword = document.getElementById('newPassword').value;
                    const confirmPassword = document.getElementById('confirmPassword').value;
                    const errorMessage = document.getElementById('password-error');

                    if (newPassword !== confirmPassword) {
                        event.preventDefault();
                        errorMessage.textContent = 'Passwords do not match!';
                        errorMessage.style.display = 'block';
                    } else {
                        errorMessage.style.display = 'none';
                    }
                });
    </script>
</body>
</html>
