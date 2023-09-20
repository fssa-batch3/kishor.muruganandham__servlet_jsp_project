package com.fssa.librarymanagement_app.librarian;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.model.Borrow;
import com.fssa.librarymanagement.service.BorrowService;

/**
 * Servlet implementation class ReturnBorrowServlet
 */
@WebServlet("/librarian/borrow-list/return")
public class ReturnBorrowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String borrowIdStr = request.getParameter("borrowId");
		if (borrowIdStr != null && !borrowIdStr.isEmpty()) {
			int borrowId = Integer.parseInt(borrowIdStr);

			BorrowService borrowService = new BorrowService();
			Borrow borrowDetails;
			try {
				borrowDetails = borrowService.getBorrowById(borrowId);
				borrowDetails.setReturnDate(LocalDate.now());
				borrowService.returnBook(borrowDetails);

				response.sendRedirect(request.getContextPath() + "/librarian/borrow-list");
			} catch (ServiceException e) {
				e.printStackTrace();
				request.setAttribute("errorMessage", e.getMessage());
				request.getRequestDispatcher("/error.jsp").forward(request, response);
			}
		} else {

			response.sendRedirect(request.getContextPath() + "/librarian/borrow-list");
		}
	}

}
