package com.fssa.librarymanagement_app.user;

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
 * Servlet implementation class UserProfileServlet
 */
@WebServlet("/user/user-profile")
public class UserProfileServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		int userId = (int) session.getAttribute("userId");
		UserService userService = new UserService();
		User user;
		try {
			user = userService.getUserById(userId);

			System.out.println(user);
			request.setAttribute("user", user);
			request.getRequestDispatcher("user-profile.jsp").forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}

	}
}
