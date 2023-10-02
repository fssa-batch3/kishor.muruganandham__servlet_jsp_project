package com.fssa.librarymanagement_app.servlet.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.model.Book;
import com.fssa.librarymanagement.service.BookService;

/**
 * Servlet implementation class HomePageServlet
 */
@WebServlet("/user/dashboard")
public class HomePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int booksInLibrary = 10;
		int booksBorrowed = 5;
		int ratingsGiven = 7;
		int commentsWritten = 3;

		BookService bookService = new BookService();
		List<Book> bookList;
		try {
			bookList = bookService.listAllBooks();

			request.setAttribute("bookList", bookList);
			request.setAttribute("booksInLibrary", booksInLibrary);
			request.setAttribute("booksBorrowed", booksBorrowed);
			request.setAttribute("ratingsGiven", ratingsGiven);
			request.setAttribute("commentsWritten", commentsWritten);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/user/home.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	}

}
