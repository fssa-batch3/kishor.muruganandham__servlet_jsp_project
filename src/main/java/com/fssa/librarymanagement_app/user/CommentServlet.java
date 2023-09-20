package com.fssa.librarymanagement_app.user;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.model.Comment;
import com.fssa.librarymanagement.service.CommentService;

/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/user/comment")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CommentService commentService = new CommentService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		try {
			List<Comment> comments = commentService.listCommentsByBook(bookId);

			request.setAttribute("commentList", comments);
			System.out.println(comments);
		} catch (ServiceException e) {
			e.printStackTrace();
		}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int commentId = Integer.parseInt(request.getParameter("commentId"));
		String updatedDescription = request.getParameter("description");
		System.out.println(updatedDescription);
		System.out.println(commentId);
		Comment comment = new Comment();
		comment.setEditedAt(LocalDateTime.now());
		comment.setDescription(updatedDescription);
		comment.setCommentId(commentId);
		try {
			commentService.updateComment(comment);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int commentId = Integer.parseInt(request.getParameter("commentId"));

		try {
			commentService.deleteComment(commentId);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	}

}
