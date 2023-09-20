package com.fssa.librarymanagement_app.librarian;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.model.Borrow;
import com.fssa.librarymanagement.service.BorrowService;

/**
 * Servlet implementation class BookBorrowsServlet
 */
@WebServlet("/librarian/borrow-list/book")
public class BookBorrowsServlet extends HttpServlet {

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
			BorrowService borrowService = new BorrowService();
			List<Borrow> borrowList;
			try {
				borrowList = borrowService.getBorrowsByBook(bookId);
				request.setAttribute("borrowList", borrowList);
				System.out.print(borrowList);
				request.getRequestDispatcher("/pages/librarian/book-borrows.jsp").forward(request, response);
			} catch (ServiceException e) {
				e.printStackTrace();
				request.setAttribute("errorMessage", e.getMessage());
				request.getRequestDispatcher("/error.jsp").forward(request, response);
			}
		} else {
			response.sendRedirect(request.getContextPath() + "book-list.jsp");
		}

	}
}
