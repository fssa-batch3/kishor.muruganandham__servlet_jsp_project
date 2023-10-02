package com.fssa.librarymanagement_app.servlet;

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
			session.setAttribute("userName", authenticatedUser.getName());
			session.setAttribute("userId", authenticatedUser.getUserId());
			session.setAttribute("isAdmin", authenticatedUser.isAdmin());
			session.setAttribute("profileImage", authenticatedUser.getProfileImage());

			int cookieMaxAge = 24 * 60 * 60;

			session.setMaxInactiveInterval(cookieMaxAge);
			if (authenticatedUser.isAdmin()) {
				response.sendRedirect(request.getContextPath() + "/librarian/user-list");
			} else {
				System.out.println(authenticatedUser);
				response.sendRedirect(request.getContextPath() + "/user/book-list");
			}
		} catch (ServiceException | IOException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
			request.setAttribute("loginEmail", email);
			request.setAttribute("loginPassword", password);
			request.getRequestDispatcher("/home").forward(request, response);
		}
	}
}
