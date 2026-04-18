<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Time Table Generator</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; display: flex; align-items: center; }
        .card { border: none; border-radius: 1rem; box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1); }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card p-4">
                    <h3 class="text-center mb-4">Register Admin</h3>
                    <% if(request.getAttribute("error") != null) { %>
                        <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
                    <% } %>
                    <form action="register" method="post">
                        <div class="mb-3">
                            <label class="form-label">Username</label>
                            <input type="text" name="username" class="form-control" required placeholder="Create username">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" class="form-control" required placeholder="Create password">
                        </div>
                        <button type="submit" class="btn btn-success w-100 py-2">Create Account</button>
                    </form>
                    <div class="text-center mt-3">
                        <a href="login" class="text-decoration-none">Already have an account? Login</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
