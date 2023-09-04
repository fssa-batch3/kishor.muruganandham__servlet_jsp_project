<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.fssa.librarymanagement.model.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User List</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Add custom CSS for rounded images */
        .rounded-image {
            border-radius: 50%;
            width: 50px; /* Adjust the width to your preference */
            height: 50px; /* Adjust the height to your preference */
            object-fit: cover;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1>User List</h1>

        <div class="table-responsive">
            <table class="table table-bordered">
                <thead class="thead-light">
                    <tr>
                        <th>User ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Mobile No</th>
                        <th>Gender</th>
                        <th>Date of Birth</th>
                        <th>Created Date</th>
                        <th>Status</th>
                        <th>Role</th>
                        <th>Profile Image</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${userList}" var="user">
                        <tr>
                            <td>${user.userId}</td>
                            <td>${user.name}</td>
                            <td>${user.email}</td>
                            <td>${user.mobileNo}</td>
                            <td>${user.gender}</td>
                            <td>${user.dob}</td>
                            <td>${user.createdDate}</td>
                            <td>
                                <%-- Display "Active" or "Inactive" based on the isActive property --%>
                                ${user.isActive ? 'Active' : 'Inactive'}
                            </td>
                            <td>
                                <%-- Display "Librarian" or "User" based on the isAdmin property --%>
                                ${user.isAdmin ? 'Librarian' : 'User'}
                            </td>
                            <td>
                                <%-- Display a round-shaped profile image --%>
                                <img src="${user.profileImage}" alt="Profile Image" class="rounded-image">
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </div>

    <!-- Include Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
