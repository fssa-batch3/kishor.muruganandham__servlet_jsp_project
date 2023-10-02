package com.fssa.librarymanagement_app.servlet.librarian;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.service.BookService;

@WebServlet("/librarian/delete-book")
public class DeleteBookServlet extends HttpServlet {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Retrieve form data
		int bookId = Integer.parseInt(request.getParameter("bookId"));

		BookService bookService = new BookService();

		try {
			bookService.deleteBook(bookId);

			response.sendRedirect(request.getContextPath() + "/librarian/book-list");
		} catch (ServiceException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}

	}
}
