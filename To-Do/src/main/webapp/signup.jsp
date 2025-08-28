<%@ page import="java.sql.*" %>
<%@ page import="com.todo.util.DBUtil" %>

<%
    String message = "";
    if(request.getParameter("submit") != null) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        try (Connection conn = DBUtil.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO todousers (emailid, username, password) VALUES (?, ?, ?)"
            );
            ps.setString(1, email);
            ps.setString(2, username);
            ps.setString(3, password);
            ps.executeUpdate();
            message = "✅ Signup successful! Please login.";
        } catch(Exception e) {
            if(e.getMessage().contains("ORA-00001")) {
                message = "⚠️ Username already exists! Please choose another.";
            } else {
                message = "Error: " + e.getMessage();
            }
        }
    }
%>
<html>
<head>
    <title>Signup - To-Do</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            color: #3d3328;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            height: 100vh;
            margin: 0;
        }
        .header {
            width: 100%;
            background-color: #3d3328;
            color: white;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-sizing: border-box;
        }
        .header h1 {
            margin: 0;
        }
        .header a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            background: #5a4a3c;
            padding: 8px 15px;
            border-radius: 5px;
        }
        .form-container {
            margin-top: 50px;
            padding: 25px;
            border: 1px solid #3d3328;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            width: 350px;
            background-color: #fff;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        input[type=text], input[type=password], input[type=email] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #3d3328;
            border-radius: 5px;
        }
        input[type=submit] {
            width: 100%;
            padding: 10px;
            background-color: #3d3328;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background-color: #5a4a3c;
        }
        .message {
            text-align: center;
            margin-top: 15px;
            font-weight: bold;
        }
        .login-link {
            text-align: center;
            margin-top: 15px;
        }
        .login-link a {
            color: #3d3328;
            text-decoration: none;
            font-weight: bold;
        }
        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <h1>To-Do</h1>
        <a href="landing.jsp">Home</a>
    </div>

    <!-- Signup Form -->
    <div class="form-container">
        <h2>Signup</h2>
        <form method="post">
            <input type="email" name="email" placeholder="Email" required><br>
            <input type="text" name="username" placeholder="Username" required><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <input type="submit" name="submit" value="Signup">
        </form>
        <p class="message"><%= message %></p>
        <div class="login-link">
            Already have an account? <a href="login.jsp">Login now!</a>
        </div>
    </div>
</body>
</html>
