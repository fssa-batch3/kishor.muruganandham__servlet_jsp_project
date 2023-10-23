package com.fssa.librarymanagement_app.servlet.user;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.model.Book;
import com.fssa.librarymanagement.model.Comment;
import com.fssa.librarymanagement.model.User;
import com.fssa.librarymanagement.service.CommentService;

/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/user/comment")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static CommentService commentService = new CommentService();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BufferedReader reader = request.getReader();
		StringBuilder requestBody = new StringBuilder();
		String line;
		while ((line = reader.readLine()) != null) {
			requestBody.append(line);
		}

		JSONObject commentObj = new JSONObject(requestBody.toString());

		String description = commentObj.getString("comment");
		String email = commentObj.getString("email");
		String userName = commentObj.getString("userName");
		String bookTitle = commentObj.getString("bookTitle");
		String coverImage = commentObj.getString("coverImage");
		String profileImage = commentObj.getString("profileImage");
		int userId = commentObj.getInt("userId");
		int bookId = commentObj.getInt("bookId");

		User user = new User();
		user.setUserId(userId);
		user.setEmail(email);
		user.setName(userName);
		user.setProfileImage(profileImage);

		Book book = new Book();
		book.setBookId(bookId);
		book.setTitle(bookTitle);
		book.setCoverImage(coverImage);

		Comment comment = new Comment();
		comment.setBook(book);
		comment.setUser(user);
		comment.setDescription(description);
		try {
			Comment comments = commentService.createComment(comment);
			request.setAttribute("commentList", comments);
			JSONObject result = new JSONObject(comments);
			response.setContentType("application/json");
			response.getWriter().write(result.toString());
		} catch (ServiceException e) {
			response.getWriter().write(e.getMessage());
			e.printStackTrace();
		}
	}

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		BufferedReader reader = request.getReader();
		StringBuilder requestBody = new StringBuilder();
		String line;
		while ((line = reader.readLine()) != null) {
			requestBody.append(line);
		}

		JSONObject jsonObject = new JSONObject(requestBody.toString());

		int commentId = Integer.parseInt(request.getParameter("commentId"));
		String updatedDescription = jsonObject.getString("description");

		Comment comment = new Comment();
		comment.setDescription(updatedDescription);
		comment.setCommentId(commentId);

		try {
			commentService.updateComment(comment);
		} catch (ServiceException e) {
			response.setContentType("text/plain");
			response.getWriter().write(e.getMessage());
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
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			response.setContentType("text/plain");
			response.getWriter().write(e.getMessage());
			e.printStackTrace();
		}
	}

}
