package com.fssa.librarymanagement_app.servlet.librarian;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.model.Book;
import com.fssa.librarymanagement.service.BookService;

@WebServlet("/librarian/book/update")
public class UpdateBookServlet extends HttpServlet {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bookId = Integer.parseInt(request.getParameter("bookId"));

		BookService bookService = new BookService();
		Book bookDetails;
		try {
			bookDetails = bookService.getBookById(bookId);

			request.setAttribute("book", bookDetails);
			request.getRequestDispatcher("/pages/librarian/update-book.jsp").forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Retrieve form data
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		String genre = request.getParameter("genre");
		int pages = Integer.parseInt(request.getParameter("pages"));
		String language = request.getParameter("language");
		String description = request.getParameter("description");
		int totalCopies = Integer.parseInt(request.getParameter("totalCopies"));
		int availableCopies = Integer.parseInt(request.getParameter("availableCopies"));
		String coverImage = request.getParameter("coverImage");

		BookService bookService = new BookService();
		Book book = new Book();
		book.setBookId(bookId);
		book.setTitle(title);
		book.setAuthor(author);
		book.setPublisher(publisher);
		book.setGenre(genre);
		book.setPages(pages);
		book.setLanguage(language);
		book.setDescription(description);
		book.setTotalCopies(totalCopies);
		book.setCoverImage(coverImage);
		book.setAvailableCopies(availableCopies);
		try {
			bookService.updateBook(book);

			response.sendRedirect(request.getContextPath() + "/librarian/book-list");
		} catch (ServiceException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}

	}
}
