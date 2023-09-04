package com.fssa.librarymanagement_app.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.librarymanagement.dao.BorrowDAO;
import com.fssa.librarymanagement.exceptions.DAOException;
import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.model.Book;
import com.fssa.librarymanagement.model.Borrow;
import com.fssa.librarymanagement.service.BookService;

/**
 * Servlet implementation class BookDetailsServlet
 */
@WebServlet("/user/book-details")
public class BookDetailsServlet extends HttpServlet {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();


		int userId = (int) session.getAttribute("userId");

		String bookIdStr = request.getParameter("bookId");
		if (bookIdStr != null && !bookIdStr.isEmpty()) {
			int bookId = Integer.parseInt(bookIdStr);

			BookService bookService = new BookService();
			BorrowDAO borrowDAO = new BorrowDAO();
			Book bookDetails;
			try {
				bookDetails = bookService.getBookById(bookId);
				Borrow existingBorrow = borrowDAO.getBorrowByUserAndBook(userId,bookId);

				if(existingBorrow != null) {
					request.setAttribute("borrowed", true);
				}
				System.out.println(bookDetails);
				request.setAttribute("book", bookDetails);
				request.getRequestDispatcher("book-details.jsp").forward(request, response);
			} catch (ServiceException | DAOException e) {
				e.printStackTrace();
			}

		} else {

			response.sendRedirect(request.getContextPath() + "/book-list.jsp");
		}
	}
}
