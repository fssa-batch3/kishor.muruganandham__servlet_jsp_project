package com.fssa.librarymanagement_app;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.model.User;
import com.fssa.librarymanagement.service.UserService;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        long mobileNo = Long.parseLong(request.getParameter("mobileNo"));
        String password = request.getParameter("password");
        char gender = request.getParameter("gender").charAt(0);
        String dob = request.getParameter("dob");

        UserService userService = new UserService();
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setMobileNo(mobileNo);
        user.setPassword(password);
        user.setGender(gender);
        user.setDob(LocalDate.parse(dob));

        try {
            userService.registerUser(user);
            // Forward to login.jsp with a success message
            request.setAttribute("success", "Registration was successful.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);

        } catch (ServiceException e) {
            e.printStackTrace();
            // Forward to index.jsp with an error message
            request.setAttribute("errorMessage", e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
