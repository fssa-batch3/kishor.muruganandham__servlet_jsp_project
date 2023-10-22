package com.fssa.librarymanagement_app.servlet.librarian;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.service.BookService;

/**
 * Servlet implementation class BookRequestListServlet
 */
@WebServlet("/librarian/book-request")
public class BookRequestListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BookService bookService = new BookService();
		List<Map<String, String>> requestList = new ArrayList<>();
		try {
			requestList = bookService.getAllBookRequests();

			System.out.println(requestList);
			request.setAttribute("requestList", requestList);
			request.getRequestDispatcher("/pages/librarian/list-book-request.jsp").forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	}

}
