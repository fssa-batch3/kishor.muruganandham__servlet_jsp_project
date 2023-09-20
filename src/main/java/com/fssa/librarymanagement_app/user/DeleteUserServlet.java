package com.fssa.librarymanagement_app.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.service.UserService;

/**
 * Servlet implementation class DeleteUserServlet
 */
@WebServlet("/user/delete-user")
public class DeleteUserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		String userEmail = (String) session.getAttribute("user");
		UserService userService = new UserService();

		try {
			boolean result = userService.deleteUser(userEmail);
			if (result) {
				session.invalidate();
				request.setAttribute("errorMessage", "Account Deleted Successfully");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			} else {
				throw new ServiceException("Failed to Delete User");
			}
		} catch (ServiceException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}

	}

}
