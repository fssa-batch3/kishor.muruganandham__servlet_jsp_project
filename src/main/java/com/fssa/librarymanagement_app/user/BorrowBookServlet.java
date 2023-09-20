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
import com.fssa.librarymanagement.utils.BorrowingDurationEnumMapper;

/**
 * Servlet implementation class BorrowBookServlet
 */
@WebServlet("/user/borrow")
public class BorrowBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("userId");
		int days = Integer.parseInt(request.getParameter("days"));
		int bookId = Integer.parseInt(request.getParameter("bookId"));

		BorrowService borrowService = new BorrowService();
		Borrow borrow = new Borrow();
		Book book = new Book();
		book.setBookId(bookId);
		User user = new User();
		user.setUserId(userId);
		borrow.setBook(book);
		borrow.setUser(user);
		borrow.setBorrowDate(LocalDate.now());
		borrow.setDueDate(BorrowingDurationEnumMapper.mapToBorrowingDuration(days));
		try {
			boolean result = borrowService.borrowBook(borrow);

			System.out.println(result);
			request.setAttribute("book", borrow);
			response.sendRedirect("borrow-history");
		} catch (ServiceException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}

	}

}
