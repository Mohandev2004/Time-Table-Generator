<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smart Timetable Generator - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root { --primary-color: #4e73df; --secondary-color: #224abe; }
        .hero-section {
            background: linear-gradient(135deg, #4e73df 0%, #224abe 100%);
            color: white;
            padding: 100px 0;
            clip-path: polygon(0 0, 100% 0, 100% 90%, 0% 100%);
        }
        .feature-card {
            border: none;
            border-radius: 15px;
            transition: 0.3s;
            padding: 30px;
            background: white;
            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
        }
        .feature-card:hover { transform: translateY(-10px); }
        .feature-icon {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 20px;
        }
        .btn-custom {
            padding: 12px 35px;
            border-radius: 30px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-transparent position-absolute w-100">
        <div class="container">
            <a class="navbar-brand fw-bold fs-3" href="#">TimeGen <span class="text-warning">AI</span></a>
            <div class="ms-auto">
                <a href="login" class="btn btn-outline-light btn-custom">Login</a>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <header class="hero-section text-center">
        <div class="container">
            <h1 class="display-3 fw-bold mb-4">Automatic Timetable Generation <br>Made Simple.</h1>
            <p class="lead mb-5 px-md-5">Eliminate scheduling conflicts and save hours of manual work. Our algorithm ensures the perfect balance of teachers, rooms, and time slots with a single click.</p>
            <div class="d-flex justify-content-center gap-3">
                <a href="login" class="btn btn-warning btn-custom text-dark">Get Started Now</a>
                <a href="register" class="btn btn-outline-light btn-custom">Create Admin Account</a>
            </div>
        </div>
    </header>

    <!-- Features Section -->
    <section class="py-5 bg-light">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="fw-bold">Why Choose Smart Timetable?</h2>
                <div class="mx-auto bg-primary mt-2" style="height: 3px; width: 60px;"></div>
            </div>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="feature-card text-center h-100">
                        <i class="fas fa-bolt feature-icon"></i>
                        <h4>Auto-Generation</h4>
                        <p class="text-muted">Generate a full weekly schedule for your entire college in seconds using our conflict-free algorithm.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card text-center h-100">
                        <i class="fas fa-shield-alt feature-icon"></i>
                        <h4>Conflict Detection</h4>
                        <p class="text-muted">Zero errors. The system prevents a teacher or room from being assigned twice in the same slot.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card text-center h-100">
                        <i class="fas fa-file-pdf feature-icon"></i>
                        <h4>Export & Print</h4>
                        <p class="text-muted">Export your generated timetable directly to PDF or print it with professional formatting.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-dark text-white py-4 mt-5">
        <div class="container text-center">
            <p class="mb-0">&copy; 2026 Smart Timetable Generator Project. Developed with <i class="fas fa-heart text-danger"></i> for Academic Excellence.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
