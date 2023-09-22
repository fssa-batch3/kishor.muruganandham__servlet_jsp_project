package com.fssa.librarymanagement_app;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		if (session.getAttribute("user") != null) {
			if ((boolean) session.getAttribute("isAdmin")) {
				response.sendRedirect(request.getContextPath() + "/librarian/book-list");
				return;
			}
			response.sendRedirect(request.getContextPath() + "/user/book-list");
			return;
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("signupName", request.getAttribute("signupName"));
		request.setAttribute("signupEmail", request.getAttribute("signupEmail"));
		request.setAttribute("signupMobileNo", request.getAttribute("signupMobileNo"));
		request.setAttribute("signupPassword", request.getAttribute("signupPassword"));
		request.setAttribute("signupGender", request.getAttribute("signupGender"));
		request.setAttribute("signupDob", request.getAttribute("signupDob"));
		request.setAttribute("loginEmail", request.getAttribute("loginEmail"));
		request.setAttribute("loginPassword", request.getAttribute("loginPassword"));
		request.setAttribute("errorMessage", request.getAttribute("errorMessage"));
		request.setAttribute("successMessage", request.getAttribute("successMessage"));
		RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
	}
}
