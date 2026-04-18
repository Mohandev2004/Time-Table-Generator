<%@ page import="com.timetable.model.*, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Timetable</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .sidebar { background: #212529; color: white; min-height: 100vh; padding-top: 20px; }
        .nav-link { color: rgba(255,255,255,0.7); }
        .nav-link:hover { color: white; }
        .timetable-card { border: none; border-radius: 10px; }
        @media print {
            .sidebar, .filter-section, .btn-print, .btn-gen { display: none !important; }
            .col-md-10 { width: 100% !important; margin: 0 !important; }
            body { background: white !important; }
        }
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
                    <li class="nav-item"><a class="nav-link" href="classes"><i class="fas fa-school me-2"></i> Classes</a></li>
                    <li class="nav-item"><a class="nav-link active fw-bold text-white" href="timetable"><i class="fas fa-calendar-alt me-2"></i> Timetable</a></li>
                    <li class="nav-item mt-4"><a class="nav-link text-danger" href="logout"><i class="fas fa-sign-out-alt me-2"></i> Logout</a></li>
                </ul>
            </div>
            <div class="col-md-10 p-4">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h3>Academic Timetable</h3>
                    <div>
                        <button onclick="window.print()" class="btn btn-secondary btn-print"><i class="fas fa-print"></i> Print / PDF</button>
                        <form action="timetable" method="post" class="d-inline btn-gen">
                            <input type="hidden" name="action" value="generate">
                            <button type="submit" class="btn btn-primary">Re-Generate All</button>
                        </form>
                    </div>
                </div>

                <% if(request.getParameter("msg") != null) { %>
                    <div class="alert alert-success"><%= request.getParameter("msg") %></div>
                <% } %>
                <% if(request.getParameter("error") != null) { %>
                    <div class="alert alert-danger"><%= request.getParameter("error") %></div>
                <% } %>

                <div class="card shadow-sm border-0 p-3 mb-4 filter-section">
                    <form action="timetable" method="get" class="row g-3">
                        <div class="col-md-4">
                            <select name="classId" class="form-select" onchange="this.form.submit()">
                                <option value="">View All Classes</option>
                                <% 
                                    List<ClassRoom> classes = (List<ClassRoom>) request.getAttribute("classes");
                                    String selectedId = request.getParameter("classId");
                                    if (classes != null) {
                                        for (ClassRoom c : classes) {
                                            String selected = String.valueOf(c.getId()).equals(selectedId) ? "selected" : "";
                                %>
                                <option value="<%= c.getId() %>" <%= selected %>><%= c.getClassName() %> - <%= c.getSection() %></option>
                                <% 
                                        }
                                    }
                                %>
                            </select>
                        </div>
                    </form>
                </div>

                <div class="card shadow-sm border-0">
                    <div class="table-responsive">
                        <table class="table table-bordered align-middle text-center mb-0">
                            <thead class="table-dark">
                                <tr>
                                    <th>Day</th>
                                    <th>Time Slot</th>
                                    <th>Class</th>
                                    <th>Subject</th>
                                    <th>Teacher</th>
                                    <th>Room</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                    List<TimetableEntry> entries = (List<TimetableEntry>) request.getAttribute("entries");
                                    if (entries != null && !entries.isEmpty()) {
                                        for (TimetableEntry e : entries) {
                                %>
                                <tr>
                                    <td class="fw-bold"><%= e.getDayName() %></td>
                                    <td><%= e.getStartTime().substring(0,5) %> - <%= e.getEndTime().substring(0,5) %></td>
                                    <td><span class="badge bg-info text-dark"><%= e.getClassName() %></span></td>
                                    <td><%= e.getSubjectName() %></td>
                                    <td><%= e.getTeacherName() %></td>
                                    <td><span class="badge bg-secondary"><%= e.getRoomNo() %></span></td>
                                </tr>
                                <% 
                                        }
                                    } else {
                                %>
                                <tr>
                                    <td colspan="6" class="p-5 text-muted">No timetable entries found. Click 'Generate' to create one.</td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
