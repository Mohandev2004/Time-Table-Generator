<%@ page import="com.timetable.model.ClassRoom, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Classes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .sidebar { background: #212529; color: white; min-height: 100vh; padding-top: 20px; }
        .nav-link { color: rgba(255,255,255,0.7); }
        .nav-link:hover { color: white; }
    </style>
</head>
<body class="bg-light">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2 sidebar d-none d-md-block">
                <h4 class="text-center mb-4">Timetable</h4>
                <ul class="nav flex-column">
                    <li class="nav-item"><a class="nav-link" href="dashboard"><i class="fas fa-home me-2"></i> Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="teachers"><i class="fas fa-chalkboard-teacher me-2"></i> Teachers</a></li>
                    <li class="nav-item"><a class="nav-link" href="subjects"><i class="fas fa-book me-2"></i> Subjects</a></li>
                    <li class="nav-item"><a class="nav-link active fw-bold text-white" href="classes"><i class="fas fa-school me-2"></i> Classes</a></li>
                    <li class="nav-item"><a class="nav-link" href="timetable"><i class="fas fa-calendar-alt me-2"></i> Timetable</a></li>
                    <li class="nav-item mt-4"><a class="nav-link text-danger" href="logout"><i class="fas fa-sign-out-alt me-2"></i> Logout</a></li>
                </ul>
            </div>
            <div class="col-md-10 p-4">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card shadow-sm border-0 p-4">
                            <h4>Add New Class</h4>
                            <form action="classes" method="post">
                                <div class="mb-3">
                                    <label class="form-label">Class Name (e.g. BCA)</label>
                                    <input type="text" name="name" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Section (e.g. A)</label>
                                    <input type="text" name="section" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Room Number</label>
                                    <input type="text" name="room" class="form-control" required>
                                </div>
                                <button type="submit" class="btn btn-warning w-100">Add Class</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card shadow-sm border-0 p-4">
                            <h4>Class List</h4>
                            <table class="table table-hover mt-3">
                                <thead class="table-dark">
                                    <tr>
                                        <th>ID</th>
                                        <th>Class Name</th>
                                        <th>Section</th>
                                        <th>Room No</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        List<ClassRoom> classes = (List<ClassRoom>) request.getAttribute("classes");
                                        if (classes != null) {
                                            for (ClassRoom c : classes) {
                                    %>
                                    <tr>
                                        <td><%= c.getId() %></td>
                                        <td><%= c.getClassName() %></td>
                                        <td><%= c.getSection() %></td>
                                        <td><%= c.getRoomNo() %></td>
                                        <td>
                                            <a href="classes?action=delete&id=<%= c.getId() %>" class="btn btn-sm btn-danger" onclick="return confirm('Delete this class?')"><i class="fas fa-trash"></i></a>
                                        </td>
                                    </tr>
                                    <% 
                                            }
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
