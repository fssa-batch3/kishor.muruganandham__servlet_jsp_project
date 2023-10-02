package com.fssa.librarymanagement_app.servlet.user;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.model.Rating;
import com.fssa.librarymanagement.service.RatingService;

/**
 * Servlet implementation class RatingServlet
 */
@WebServlet("/user/rating")
public class RatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BufferedReader reader = request.getReader();
		StringBuilder requestBody = new StringBuilder();
		String line;
		while ((line = reader.readLine()) != null) {
			requestBody.append(line);
		}

		JSONObject jsonObject = new JSONObject(requestBody.toString());
		int userId = jsonObject.getInt("user_id");
		int ratingValue = jsonObject.getInt("rating");
		int bookId = jsonObject.getInt("book_id");

		Rating rating = new Rating();
		rating.setBookId(bookId);
		rating.setUserId(userId);
		rating.setRating(ratingValue);
		RatingService ratingService = new RatingService();
		Map<String, Object> avgCount;
		try {
			ratingService.submitRating(rating);
			avgCount = ratingService.getAverageRatingAndCountByBook(bookId);
			JSONObject avgObject = new JSONObject(avgCount);
			response.setContentType("application/json");
			response.getWriter().write(avgObject.toString());
		} catch (ServiceException e) {
			response.setContentType("text/plain");
			response.getWriter().write(e.getMessage());
			e.printStackTrace();
		}
	}

}
