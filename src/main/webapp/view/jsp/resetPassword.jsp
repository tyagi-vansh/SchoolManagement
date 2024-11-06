<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>
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
            margin-top:50px;
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

        .reset-password-container {
            min-height: 70vh;
            display: flex;
            margin-top:100px;
            justify-content: center;
            align-items: center;
        }

        .reset-password {
            background: rgba(0, 0, 0, 0.7);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.9);
            color: #fff;
            text-align: center;
        }

        .reset-password h2 {
            font-size: 2em;
            color: #fff; /* Changed to white */
            margin-bottom: 20px;
        }

        .reset-password .form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .reset-password .form .inputBox {
            position: relative;
            width: 100%;
        }

        .reset-password .form .inputBox input {
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

        .reset-password .form .inputBox input[type="submit"] {
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

        .reset-password .form .inputBox input[type="submit"]:hover {
            background-color: #f0f0f0; /* Light gray on hover */
        }

        .error-message {
            color: red;
            font-weight: bold;
            margin: 10px 0;
        }

        /* Add margin to create space between header and input field */
        .spacing {
            margin-top: 30px; /* Adjust this value as needed */
        }
    </style>
</head>

<body>

    <div class="header">
        <h1>XYZ School of Excellence</h1>
    </div>

    <div class="reset-password-container">
        <div class="reset-password">
            <h2>Reset Password</h2>
            <c:if test="${not empty errorMessage}">
                <h3 class="error-message">${errorMessage}</h3>
            </c:if>
            <div class="spacing"></div> <!-- Space between header and input -->
            <form action="/resetpassword" method="POST" onsubmit="showAlert()">
                <div class="form">
                    <div class="inputBox">
                        <input type="email" name="email" required placeholder="Email">
                    </div>
                    <div class="inputBox">
                        <input type="submit" value="Send Email">
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script>
        function showAlert() {
            alert('A password reset email has been sent! Please check your inbox.');
        }
    </script>
</body>
</html>
