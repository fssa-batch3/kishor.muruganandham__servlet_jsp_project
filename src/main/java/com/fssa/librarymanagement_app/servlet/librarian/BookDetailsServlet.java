package com.fssa.librarymanagement_app.servlet.librarian;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.model.Book;
import com.fssa.librarymanagement.service.BookService;

/**
 * Servlet implementation class BookDetailsServlet
 */
@WebServlet("/librarian/book-details")
public class BookDetailsServlet extends HttpServlet {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String bookIdStr = request.getParameter("bookId");
		if (bookIdStr != null && !bookIdStr.isEmpty()) {
			int bookId = Integer.parseInt(bookIdStr);

			BookService bookService = new BookService();
			Book bookDetails;
			try {
				bookDetails = bookService.getBookById(bookId);
				System.out.println(bookDetails);
				request.setAttribute("book", bookDetails);
				request.getRequestDispatcher("book-details.jsp").forward(request, response);
			} catch (ServiceException e) {
				e.printStackTrace();
			}

		} else {

			response.sendRedirect(request.getContextPath() + "book-list.jsp");
		}
	}
}
