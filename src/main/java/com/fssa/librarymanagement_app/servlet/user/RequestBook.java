package com.fssa.librarymanagement_app.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.model.BookRequest;
import com.fssa.librarymanagement.service.BookRequestService;

/**
 * Servlet implementation class RequestBook
 */
@WebServlet("/user/request-book")
public class RequestBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/pages/user/request-book.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String bookName = request.getParameter("book-name");
		String authorName = request.getParameter("author-name");
		String sourceLink = request.getParameter("source-link");
		String description = request.getParameter("description");
		BookRequestService bookRequestService = new BookRequestService();
		BookRequest bookRequest = new BookRequest();

		// Add the parameters to the map
		bookRequest.setBookName(bookName);
		bookRequest.setAuthorName(authorName);
		bookRequest.setSourceLink(sourceLink);
		bookRequest.setDescription(description);
		try {
			bookRequestService.createBookRequest(bookRequest);
			request.setAttribute("successMessage", "Book request sent successfully!");
			doGet(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
			doGet(request, response);
		}

	}

}
