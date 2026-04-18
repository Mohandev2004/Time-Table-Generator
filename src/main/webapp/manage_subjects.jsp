<%@ page import="com.timetable.model.Subject, com.timetable.model.Teacher, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Subjects</title>
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
                    <li class="nav-item"><a class="nav-link active fw-bold text-white" href="subjects"><i class="fas fa-book me-2"></i> Subjects</a></li>
                    <li class="nav-item"><a class="nav-link" href="classes"><i class="fas fa-school me-2"></i> Classes</a></li>
                    <li class="nav-item"><a class="nav-link" href="timetable"><i class="fas fa-calendar-alt me-2"></i> Timetable</a></li>
                    <li class="nav-item mt-4"><a class="nav-link text-danger" href="logout"><i class="fas fa-sign-out-alt me-2"></i> Logout</a></li>
                </ul>
            </div>
            <div class="col-md-10 p-4">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card shadow-sm border-0 p-4">
                            <h4>Add New Subject</h4>
                            <form action="subjects" method="post">
                                <div class="mb-3">
                                    <label class="form-label">Subject Name</label>
                                    <input type="text" name="name" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Assign Teacher</label>
                                    <select name="teacher_id" class="form-select" required>
                                        <option value="">Select Teacher</option>
                                        <% 
                                            List<Teacher> teachers = (List<Teacher>) request.getAttribute("teachers");
                                            if (teachers != null) {
                                                for (Teacher t : teachers) {
                                        %>
                                        <option value="<%= t.getId() %>"><%= t.getName() %></option>
                                        <% 
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-success w-100">Add Subject</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card shadow-sm border-0 p-4">
                            <h4>Subject List</h4>
                            <table class="table table-hover mt-3">
                                <thead class="table-dark">
                                    <tr>
                                        <th>ID</th>
                                        <th>Subject</th>
                                        <th>Teacher</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        List<Subject> subjects = (List<Subject>) request.getAttribute("subjects");
                                        if (subjects != null) {
                                            for (Subject s : subjects) {
                                    %>
                                    <tr>
                                        <td><%= s.getId() %></td>
                                        <td><%= s.getName() %></td>
                                        <td><%= s.getTeacherName() %></td>
                                        <td>
                                            <a href="subjects?action=delete&id=<%= s.getId() %>" class="btn btn-sm btn-danger" onclick="return confirm('Delete this subject?')"><i class="fas fa-trash"></i></a>
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
