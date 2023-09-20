package com.fssa.librarymanagement_app.librarian;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.model.Book;
import com.fssa.librarymanagement.service.BookService;

/**
 * Servlet implementation class CreateBookServlet
 */
@WebServlet("/librarian/create-book")
public class CreateBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/pages/librarian/create-book.jsp").forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Retrieve form data from the request
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		String genre = request.getParameter("genre");
		String language = request.getParameter("language");
		String description = request.getParameter("description");
		int totalCopies = Integer.parseInt(request.getParameter("totalCopies"));
		String coverImage = request.getParameter("coverImage");

		BookService bookService = new BookService();
		Book book = new Book();
		book.setTitle(title);
		book.setAuthor(author);
		book.setPublisher(publisher);
		book.setGenre(genre);
		book.setLanguage(language);
		book.setDescription(description);
		book.setTotalCopies(totalCopies);
		book.setCoverImage(coverImage);
		try {
			bookService.addBook(book);

			response.sendRedirect(request.getContextPath() + "/librarian/book-list");
		} catch (ServiceException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}

}
