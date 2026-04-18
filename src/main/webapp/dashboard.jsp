<%@ page import="com.timetable.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Timetable</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .sidebar { background: #212529; color: white; min-height: 100vh; padding-top: 20px; }
        .nav-link { color: rgba(255,255,255,0.7); }
        .nav-link:hover { color: white; }
        .active { color: white !important; font-weight: bold; }
        .stat-card { transition: 0.3s; border-radius: 15px; border: none; }
        .stat-card:hover { transform: translateY(-5px); box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
    </style>
</head>
<body class="bg-light">
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-2 sidebar d-none d-md-block">
                <h4 class="text-center mb-4">Timetable</h4>
                <ul class="nav flex-column">
                    <li class="nav-item"><a class="nav-link active" href="dashboard"><i class="fas fa-home me-2"></i> Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="teachers"><i class="fas fa-chalkboard-teacher me-2"></i> Teachers</a></li>
                    <li class="nav-item"><a class="nav-link" href="subjects"><i class="fas fa-book me-2"></i> Subjects</a></li>
                    <li class="nav-item"><a class="nav-link" href="classes"><i class="fas fa-school me-2"></i> Classes</a></li>
                    <li class="nav-item"><a class="nav-link" href="timetable"><i class="fas fa-calendar-alt me-2"></i> Timetable</a></li>
                    <li class="nav-item mt-4"><a class="nav-link text-danger" href="logout"><i class="fas fa-sign-out-alt me-2"></i> Logout</a></li>
                </ul>
            </div>

            <!-- Main Content -->
            <div class="col-md-10 p-4">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h3>Welcome, <%= user.getUsername() %></h3>
                    <span class="text-muted"><i class="far fa-calendar"></i> <%= new java.util.Date() %></span>
                </div>

                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="card stat-card bg-primary text-white p-4">
                            <h5>Total Teachers</h5>
                            <h2><%= request.getAttribute("teacherCount") %></h2>
                            <i class="fas fa-users float-end opacity-50" style="font-size: 2rem; margin-top: -40px;"></i>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card stat-card bg-success text-white p-4">
                            <h5>Total Subjects</h5>
                            <h2><%= request.getAttribute("subjectCount") %></h2>
                            <i class="fas fa-book-open float-end opacity-50" style="font-size: 2rem; margin-top: -40px;"></i>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card stat-card bg-warning text-dark p-4">
                            <h5>Total Classes</h5>
                            <h2><%= request.getAttribute("classCount") %></h2>
                            <i class="fas fa-door-open float-end opacity-50" style="font-size: 2rem; margin-top: -40px;"></i>
                        </div>
                    </div>
                </div>

                <div class="mt-5">
                    <div class="card border-0 shadow-sm p-4">
                        <h4>Quick Actions</h4>
                        <div class="d-flex gap-3 mt-3">
                            <a href="teachers" class="btn btn-outline-primary">Add Teacher</a>
                            <a href="subjects" class="btn btn-outline-success">Add Subject</a>
                            <a href="classes" class="btn btn-outline-warning">Add Class</a>
                            <form action="timetable" method="post" class="d-inline">
                                <input type="hidden" name="action" value="generate">
                                <button type="submit" class="btn btn-primary">Generate Timetable</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
