<%@ page import="java.sql.*"%>
<%@ page import="com.todo.util.DBUtil"%>
<%
    // ✅ Session check
    String username = (String) session.getAttribute("username");
    Integer userId = (Integer) session.getAttribute("user_id"); // must be set in login.jsp
    if (username == null || userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String message = "";

    // ✅ Add new task
    if(request.getParameter("addTask") != null) {
        String taskDesc = request.getParameter("taskDesc");
        Integer collectionId = request.getParameter("collectionId") != null ? Integer.parseInt(request.getParameter("collectionId")) : null;
        try(Connection conn = DBUtil.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO todotasks (user_id, task_description, is_completed, collection_id) VALUES (?, ?, 0, ?)"
            );
            ps.setInt(1, userId);
            ps.setString(2, taskDesc);
            if(collectionId != null) {
                ps.setInt(3, collectionId);
            } else {
                ps.setNull(3, java.sql.Types.INTEGER);
            }
            ps.executeUpdate();
            message = "Task added successfully!";
        } catch(Exception e) {
            message = "Error: " + e.getMessage();
        }
    }

    // ✅ Mark task as completed
    if(request.getParameter("completeTask") != null) {
        int taskId = Integer.parseInt(request.getParameter("completeTask"));
        try(Connection conn = DBUtil.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                "UPDATE todotasks SET is_completed=1 WHERE task_id=? AND user_id=?"
            );
            ps.setInt(1, taskId);
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch(Exception e) {
            message = "Error: " + e.getMessage();
        }
    }

    // ✅ Mark task as undone
    if(request.getParameter("undoneTask") != null) {
        int taskId = Integer.parseInt(request.getParameter("undoneTask"));
        try(Connection conn = DBUtil.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                "UPDATE todotasks SET is_completed=0 WHERE task_id=? AND user_id=?"
            );
            ps.setInt(1, taskId);
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch(Exception e) {
            message = "Error: " + e.getMessage();
        }
    }

    // ✅ Delete task
    if(request.getParameter("deleteTask") != null) {
        int taskId = Integer.parseInt(request.getParameter("deleteTask"));
        try(Connection conn = DBUtil.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                "DELETE FROM todotasks WHERE task_id=? AND user_id=?"
            );
            ps.setInt(1, taskId);
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch(Exception e) {
            message = "Error: " + e.getMessage();
        }
    }

    // ✅ Create collection
    if(request.getParameter("createCollection") != null) {
        String collName = request.getParameter("collectionName");
        try(Connection conn = DBUtil.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO todocollections (user_id, collection_name) VALUES (?, ?)"
            );
            ps.setInt(1, userId);
            ps.setString(2, collName);
            ps.executeUpdate();
            message = "Collection created!";
        } catch(Exception e) {
            message = "Error: " + e.getMessage();
        }
    }
%>

<html>
<head>
<title>Dashboard</title>
<style>
body {
    font-family: Arial;
    background: #fff;
    color: #3d3328;
    margin: 0;
}

header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 30px;
    background-color: #3d3328;
    color: white;
}

header h1 {
    margin: 0;
    font-size: 24px;
}

header a {
    text-decoration: none;
    background: white;
    color: #3d3328;
    padding: 8px 15px;
    border-radius: 6px;
    font-weight: bold;
    margin-left: 10px;
}

header a:hover {
    background: #ddd;
}

.content {
    padding: 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

form {
    width: 75%;
    display: flex;
    gap: 10px;
    margin-bottom: 20px;
}

input[type=text] {
    flex: 1;
    padding: 8px;
    border: 1px solid #3d3328;
    border-radius: 5px;
}

input[type=submit] {
    background: #3d3328;
    color: white;
    padding: 8px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

input[type=submit]:hover {
    background: #5a4a3c;
}

.tasks-container, .collections-container {
    width: 75%;
    padding: 15px;
    border: 1px solid #3d3328;
    border-radius: 8px;
    background: #f9f9f9;
    margin-bottom: 20px;
}

.tasks-container h3, .collections-container h3 {
    text-align: center;
    margin-top: 0;
    color: #3d3328;
}

.task {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px;
    border: 1px solid #3d3328;
    border-radius: 5px;
    margin: 5px 0;
}

.task-buttons form {
    display: inline;
    margin-left: 5px;
}

.task-buttons button {
    background: #3d3328;
    color: white;
    border: none;
    padding: 5px 10px;
    border-radius: 5px;
    cursor: pointer;
}

.task-buttons button:hover {
    background: #5a4a3c;
}
</style>
</head>
<body>

<header>
    <h1>To-Do</h1>
    <div>
        <a href="landing.jsp">Home</a>
        <a href="logout.jsp" onclick="return confirmLogout();">Logout</a>
    </div>
</header>

<script>
function confirmLogout() {
    return confirm("Are you sure you want to logout?");
}
</script>

<div class="content">
    <h2>Welcome, <%= username %>!</h2>
    <p><%= message %></p>

    <!-- Add Task Form -->
    <form method="post">
        <input type="text" name="taskDesc" placeholder="Enter new task" required>
        <input type="submit" name="addTask" value="Add Task">
    </form>

    <!-- Tasks List -->
    <div class="tasks-container">
        <h3>Your Tasks</h3>
        <%
            try(Connection conn = DBUtil.getConnection()) {
                PreparedStatement ps = conn.prepareStatement(
                    "SELECT task_id, task_description, is_completed FROM todotasks WHERE user_id=? AND collection_id IS NULL ORDER BY task_id DESC"
                );
                ps.setInt(1, userId);
                ResultSet rs = ps.executeQuery();
                while(rs.next()) {
                    int tid = rs.getInt("task_id");
                    String desc = rs.getString("task_description");
                    boolean done = rs.getInt("is_completed") == 1;
        %>
        <div class="task">
            <span><%= desc %> - <%= done ? "&#10003; Completed" : "&#10024; Pending" %></span>
            <span class="task-buttons">
                <% if(!done) { %>
                <form method="post">
                    <button name="completeTask" value="<%= tid %>">Mark Done</button>
                </form>
                <% } else { %>
                <form method="post">
                    <button name="undoneTask" value="<%= tid %>">Mark Undone</button>
                </form>
                <% } %>
                <form method="post">
                    <button name="deleteTask" value="<%= tid %>">Delete</button>
                </form>
            </span>
        </div>
        <%
                }
            } catch(Exception e) {
                out.print("Error loading tasks: " + e.getMessage());
            }
        %>
    </div>

    <!-- Collections Section (after tasks) -->
    <div class="collections-container">
        <h3>Your Collections</h3>

        <!-- Create Collection Form (aligned like Add Task) -->
        <form method="post" style="width: 100%; display: flex; gap: 10px; margin-bottom: 20px;">
            <input type="text" name="collectionName" placeholder="New collection name" required
                   style="flex: 1; padding: 8px; border: 1px solid #3d3328; border-radius: 5px;">
            <input type="submit" name="createCollection" value="Create Collection"
                   style="background: #3d3328; color: white; padding: 8px 15px; border: none; border-radius: 5px; cursor: pointer;">
        </form>

        <%
            try(Connection conn = DBUtil.getConnection()) {
                PreparedStatement psColl = conn.prepareStatement(
                    "SELECT collection_id, collection_name FROM todocollections WHERE user_id=?"
                );
                psColl.setInt(1, userId);
                ResultSet rsColl = psColl.executeQuery();

                while(rsColl.next()) {
                    int cid = rsColl.getInt("collection_id");
                    String cname = rsColl.getString("collection_name");
        %>
        <div class="collection" style="margin-bottom: 15px; padding: 10px; border: 1px solid #3d3328; border-radius: 5px; background: #fff;">
            <h4><%= cname %></h4>

            <!-- Add task to this collection -->
            <form method="post" style="display: flex; gap: 10px; margin-bottom: 10px;">
                <input type="text" name="taskDesc" placeholder="Enter task for <%= cname %>" required>
                <input type="hidden" name="collectionId" value="<%= cid %>">
                <input type="submit" name="addTask" value="Add Task">
            </form>

            <!-- Display tasks in this collection -->
            <%
                PreparedStatement psTasks = conn.prepareStatement(
                    "SELECT task_id, task_description, is_completed FROM todotasks WHERE user_id=? AND collection_id=? ORDER BY task_id DESC"
                );
                psTasks.setInt(1, userId);
                psTasks.setInt(2, cid);
                ResultSet rsTasks = psTasks.executeQuery();

                while(rsTasks.next()) {
                    int tid = rsTasks.getInt("task_id");
                    String desc = rsTasks.getString("task_description");
                    boolean done = rsTasks.getInt("is_completed") == 1;
            %>
            <div class="task">
                <span><%= desc %> - <%= done ? "&#10003; Completed" : "&#10024; Pending" %></span>
                <span class="task-buttons">
                    <% if(!done) { %>
                    <form method="post">
                        <button name="completeTask" value="<%= tid %>">Mark Done</button>
                    </form>
                    <% } else { %>
                    <form method="post">
                        <button name="undoneTask" value="<%= tid %>">Mark Undone</button>
                    </form>
                    <% } %>
                    <form method="post">
                        <button name="deleteTask" value="<%= tid %>">Delete</button>
                    </form>
                </span>
            </div>
            <%
                }
            %>
        </div>
        <%
                }
            } catch(Exception e) {
                out.print("Error loading collections: " + e.getMessage());
            }
        %>
    </div>
</div>

</body>
</html>
