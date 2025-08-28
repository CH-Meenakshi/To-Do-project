<%@ page import="java.sql.*" %>
<%@ page import="com.todo.util.DBUtil" %>
<%
    String message = "";
    if(request.getParameter("submit") != null) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = DBUtil.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                "SELECT user_id FROM todousers WHERE username=? AND password=?"
            );
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                session.setAttribute("user_id", rs.getInt("user_id"));
                session.setAttribute("username", username); 
                response.sendRedirect("dashboard.jsp");
            }else {
                message = "Invalid credentials!";
            }
        } catch(Exception e) {
            message = "Error: " + e.getMessage();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
body {
	background-color: #ffffff;
	font-family: Arial, sans-serif;
	color: #3d3328;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.header {
	width: 100%;
	background-color: #3d3328;
	color: #fff;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 12px 40px; /* more space from edges */
	position: fixed;
	top: 0;
	left: 0;
	z-index: 1000;
	box-sizing: border-box;
}

.header .title {
	font-size: 20px;
	font-weight: bold;
}

.header .home-btn {
	background-color: #fff;
	color: #3d3328;
	text-decoration: none;
	padding: 8px 16px;
	border-radius: 6px;
	font-weight: bold;
	white-space: nowrap; /* keep button text on one line */
}

.header .home-btn:hover {
	background-color: #ddd;
}

.login-container {
	background-color: #fff;
	border: 2px solid #3d3328;
	border-radius: 10px;
	padding: 30px;
	width: 320px;
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
	text-align: center;
	margin-top: 80px; /* push below header */
}

.login-container h2 {
	margin-bottom: 20px;
	color: #3d3328;
}

.login-container input[type="text"], .login-container input[type="password"]
	{
	width: 90%;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #3d3328;
	border-radius: 5px;
}

.login-container input[type="submit"] {
	background-color: #3d3328;
	color: #fff;
	border: none;
	padding: 12px;
	width: 100%;
	border-radius: 5px;
	cursor: pointer;
	font-weight: bold;
}

.login-container input[type="submit"]:hover {
	background-color: #2c251e;
}

.login-container p {
	margin-top: 15px;
	font-size: 14px;
}

.login-container a {
	color: #3d3328;
	text-decoration: none;
	font-weight: bold;
}

.login-container a:hover {
	text-decoration: underline;
}

.message {
	margin-top: 10px;
	color: red;
	font-size: 14px;
}
</style>
</head>
<body>
    <div class="header">
        <div class="title">To-Do</div>
        <div class="nav">
            <a href="Landing.jsp" class="home-btn">Home</a>
        </div>
    </div>

    <div class="login-container">
        <h2>Login</h2>
        <form method="post">
            <input type="text" name="username" placeholder="Enter Username" required><br>
            <input type="password" name="password" placeholder="Enter Password" required><br>
            <input type="submit" name="submit" value="Login">
        </form>
        <div class="message"><%= message %></div>
        <p>Don't have an account? <a href="signup.jsp">Sign up here!</a></p>
    </div>
</body>
</html>
