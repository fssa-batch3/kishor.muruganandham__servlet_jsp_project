package com.fssa.librarymanagement_app;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.service.UserService;

/**
 * Servlet implementation class ForgotPasswordServlet
 */
@WebServlet("/forgot-password")
public class ResetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userEmail = request.getParameter("email");
		String newPassword = request.getParameter("newPassword");
		String oldPassword = request.getParameter("oldPassword");

		UserService userService = new UserService();

		try {
			userService.updatePassword(userEmail, oldPassword, newPassword);
			// Forward to login.jsp with a success message
			response.sendRedirect(
					request.getContextPath() + "/login.jsp?successMessage=Password updated Successfully!");
		} catch (ServiceException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("reset-password.jsp").forward(request, response);
		}
	}
}
