package com.fssa.librarymanagement_app;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/home")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		if (session.getAttribute("user") != null) {
			if ((boolean) session.getAttribute("isAdmin")) {
				response.sendRedirect(request.getContextPath() + "/pages/librarian/list-book");
				return;
			}
			response.sendRedirect(request.getContextPath() + "/pages/user/list-book");
			return;
		}

		response.sendRedirect(request.getContextPath() + "/index.html");
	}
}
