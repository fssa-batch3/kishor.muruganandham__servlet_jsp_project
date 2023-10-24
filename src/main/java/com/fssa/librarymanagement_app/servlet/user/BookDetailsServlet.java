package com.fssa.librarymanagement_app.servlet.user;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.model.Book;
import com.fssa.librarymanagement.model.Borrow;
import com.fssa.librarymanagement.model.Comment;
import com.fssa.librarymanagement.service.BookService;
import com.fssa.librarymanagement.service.BorrowService;
import com.fssa.librarymanagement.service.CommentService;
import com.fssa.librarymanagement.service.RatingService;

/**
 * Servlet implementation class BookDetailsServlet
 */
@WebServlet("/user/book-details")
public class BookDetailsServlet extends HttpServlet {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		int userId = (int) session.getAttribute("userId");

		String bookIdStr = request.getParameter("bookId");
		if (bookIdStr != null && !bookIdStr.isEmpty()) {
			int bookId = Integer.parseInt(bookIdStr);

			BookService bookService = new BookService();
			BorrowService borrowService = new BorrowService();
			RatingService ratingService = new RatingService();
			CommentService commentService = new CommentService();

			Book bookDetails;
			Map<String, Object> ratingDetails;
			int rating;
			try {
				bookDetails = bookService.getBookById(bookId);
				ratingDetails = ratingService.getAverageRatingAndCountByBook(bookId);
				rating = ratingService.getRatingByBookAndUser(bookId, userId);
				Borrow existingBorrow = borrowService.getBorrowByUserAndBook(userId, bookId);
				List<Comment> comments = commentService.listCommentsByBook(bookId);

				request.setAttribute("commentList", comments);

				if (existingBorrow != null) {
					request.setAttribute("borrowed", true);
				}

				request.setAttribute("book", bookDetails);
				request.setAttribute("ratingDetails", ratingDetails);
				request.setAttribute("rating", rating);
				request.getRequestDispatcher("/pages/user/book-details.jsp").forward(request, response);
			} catch (ServiceException e) {
				e.printStackTrace();
				request.setAttribute("errorMessage", e.getMessage());
				request.getRequestDispatcher("/error.jsp").forward(request, response);
			}

		} else {

			response.sendRedirect(request.getContextPath() + "/book-list.jsp");
		}
	}
}
