package com.fssa.librarymanagement_app.librarian;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.model.Book;
import com.fssa.librarymanagement.service.BookService;

@WebServlet("/librarian/book-list")
public class BookListServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BookService bookService = new BookService();
		List<Book> bookList;
		try {
			bookList = bookService.listAllBooks();

			System.out.println(bookList);
			request.setAttribute("bookList", bookList);
			request.getRequestDispatcher("book-list.jsp").forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	}
}
