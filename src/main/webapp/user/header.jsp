<!-- header.jsp -->
<nav class="navbar navbar-expand-lg bg-dark border-bottom border-body" data-bs-theme="dark">
    <div class="container-fluid">
        <!-- Hamburger menu button -->
        <button class="btn btn-outline-secondary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNav"
            aria-controls="offcanvasNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Navbar links -->
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <!-- User profile image with a link -->
                <li class="nav-item">
                    <a href="user-profile" title="Profile Image">
                        <img src="<%= session.getAttribute("profileImage") %>" style="width: 60px" alt="Profile Image" class="rounded-circle rounded-image">
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>


<!-- Offcanvas navigation menu -->
<div class="offcanvas offcanvas-start" data-bs-scroll="true" tabindex="-1" id="offcanvasNav"
    aria-labelledby="offcanvasNavLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasNavLabel">Navigation Menu</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <!-- Add your navigation links here -->
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link" href="book-list">Book List</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="borrow-history">Borrow History</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="user-profile">User Profile</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../logout">Log Out</a>
            </li>
        </ul>
    </div>
</div>
