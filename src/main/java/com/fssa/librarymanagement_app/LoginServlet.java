package com.fssa.librarymanagement_app;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.model.User;
import com.fssa.librarymanagement.service.UserService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		// Check if user is already logged in
		if (session.getAttribute("user") != null) {
			if((boolean) session.getAttribute("isAdmin")) {
				response.sendRedirect(request.getContextPath() + "/librarian/book-list");
				return;
			} else {
				response.sendRedirect(request.getContextPath() + "/user/book-list");
				return;
			}
		}

		// Forward to the login page
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("username");
		String password = request.getParameter("password");

		HttpSession session = request.getSession();

		UserService userService = new UserService();
		User user = new User();
		user.setEmail(email);
		user.setPassword(password);

		try {
			User authenticatedUser = userService.loginUser(user);
			session.setAttribute("user", authenticatedUser.getEmail());
			session.setAttribute("userId", authenticatedUser.getUserId());
			session.setAttribute("isAdmin", authenticatedUser.isAdmin());
			session.setAttribute("profileImage", authenticatedUser.getProfileImage());

			String rememberValue = request.getParameter("remember");

	        // Set the cookie's expiration based on whether it was checked
	        int cookieMaxAge = (rememberValue != null && rememberValue.equals("on")) ? 3 * 24 * 60 * 60 : 24 * 60 * 60;

			session.setMaxInactiveInterval(cookieMaxAge);
			if (authenticatedUser.isAdmin()) {
				response.sendRedirect(request.getContextPath() + "/librarian/user-list");
			} else {
				response.sendRedirect(request.getContextPath() + "/user/book-list");
			}
		} catch (ServiceException | IOException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}
}
