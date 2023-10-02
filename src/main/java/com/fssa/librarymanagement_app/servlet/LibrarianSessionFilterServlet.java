package com.fssa.librarymanagement_app.servlet;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter("/librarian/*")
public class LibrarianSessionFilterServlet implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession();
		if (session.getAttribute("user") == null) {
			request.setAttribute("errorMessage", "Session Expired");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
		boolean isAdmin = (boolean) session.getAttribute("isAdmin");

		if (!isAdmin) {
			request.setAttribute("errorMessage", "Unauthorized Access");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
		chain.doFilter(request, response);
	}

}
