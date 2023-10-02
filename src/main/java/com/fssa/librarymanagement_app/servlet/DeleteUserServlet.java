package com.fssa.librarymanagement_app.servlet;

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
@WebServlet("/delete")
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
			if (!result) {
				throw new ServiceException("Failed to Delete User");
			}
			session.invalidate();
			request.setAttribute("errorMessage", "Account Deleted Successfully");
			request.getRequestDispatcher("/home").forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}

	}

}
