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

@WebServlet("/librarian/borrow-list")
public class BorrowListServlet extends HttpServlet {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		BorrowService borrowService = new BorrowService();
		List<Borrow> borrowList;
		try {
			borrowList = borrowService.getAllBorrows();
			request.setAttribute("borrowList", borrowList);
			System.out.print(borrowList);
			request.getRequestDispatcher("/librarian/borrow-list.jsp").forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}

	}
}
