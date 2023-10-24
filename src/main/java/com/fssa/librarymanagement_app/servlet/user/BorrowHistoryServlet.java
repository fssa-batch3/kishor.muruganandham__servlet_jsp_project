package com.fssa.librarymanagement_app.servlet.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.model.Borrow;
import com.fssa.librarymanagement.service.BorrowService;

/**
 * Servlet implementation class BorrowHistoryServlet
 */
@WebServlet("/user/borrow-history")
public class BorrowHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		int userId = (int) session.getAttribute("userId");
		BorrowService borrowService = new BorrowService();
		List<Borrow> borrowList;
		try {
			borrowList = borrowService.getBorrowsByUser(userId);

			request.setAttribute("borrowList", borrowList);
			request.getRequestDispatcher("/pages/user/borrow-history.jsp").forward(request, response);
		} catch (ServiceException e) {
			if (e.getMessage().equals("Borrows not found.")) {
				request.getRequestDispatcher("/pages/user/borrow-history.jsp").forward(request, response);
				return;
			}
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}

	}

}
