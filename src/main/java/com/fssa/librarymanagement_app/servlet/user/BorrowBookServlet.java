package com.fssa.librarymanagement_app.servlet.user;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.exceptions.ValidationException;
import com.fssa.librarymanagement.model.Book;
import com.fssa.librarymanagement.model.Borrow;
import com.fssa.librarymanagement.model.User;
import com.fssa.librarymanagement.service.BorrowService;
import com.fssa.librarymanagement.service.BorrowingDurationEnumMapper;

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
		borrow.setBorrowDate(LocalDateTime.now());
		try {
			borrow.setDueDate(BorrowingDurationEnumMapper.mapToBorrowingDuration(days));
			borrowService.borrowBook(borrow);

		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			response.getWriter().write(e.getMessage());
		}

	}

}
