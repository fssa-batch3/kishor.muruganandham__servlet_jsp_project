package com.fssa.librarymanagement_app.user;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.model.Book;
import com.fssa.librarymanagement.model.Borrow;
import com.fssa.librarymanagement.model.User;
import com.fssa.librarymanagement.service.BorrowService;

/**
 * Servlet implementation class BorrowBookServlet
 */
@WebServlet("/user/borrow")
public class BorrowBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("userId");


		String bookIdStr = request.getParameter("bookId");
		if (bookIdStr != null && !bookIdStr.isEmpty()) {
			int bookId = Integer.parseInt(bookIdStr);

			BorrowService borrowService = new BorrowService();
			Borrow borrow = new Borrow();
			Book book = new Book();
			book.setBookId(bookId);
			User user = new User();
			user.setUserId(userId);
			borrow.setBook(book);
			borrow.setUser(user);
			borrow.setBorrowDate(LocalDate.now());
			try {
				boolean result = borrowService.borrowBook(borrow);

				System.out.println(result);
				request.setAttribute("book", result);
				request.getRequestDispatcher("borrow-history").forward(request, response);
			} catch (ServiceException e) {
				e.printStackTrace();
				request.setAttribute("errorMessage", e.getMessage());
				request.getRequestDispatcher("/error.jsp").forward(request, response);
			}

		} else {

			response.sendRedirect(request.getContextPath() + "/book-list");
		}
	}

}
