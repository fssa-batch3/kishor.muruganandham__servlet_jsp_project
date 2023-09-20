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
 * Servlet implementation class UserBorrowsServlet
 */
@WebServlet("/librarian/borrow-list/user")
public class UserBorrowsServlet extends HttpServlet {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userIdStr = request.getParameter("userId");
		if (userIdStr != null && !userIdStr.isEmpty()) {
			int userId = Integer.parseInt(userIdStr);
			BorrowService borrowService = new BorrowService();
			List<Borrow> borrowList;
			try {
				borrowList = borrowService.getBorrowsByUser(userId);
				request.setAttribute("borrowList", borrowList);
				System.out.print(borrowList);
				request.getRequestDispatcher("/pages/librarian/user-borrows.jsp").forward(request, response);
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
