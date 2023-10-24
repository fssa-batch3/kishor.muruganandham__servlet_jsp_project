package com.fssa.librarymanagement_app.servlet.user;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.model.User;
import com.fssa.librarymanagement.service.UserService;

/**
 * Servlet implementation class UserProfileServlet
 */
@WebServlet("/user/profile")
public class ProfileServlet extends HttpServlet {

	private static final String SUCCESS_MESSAGE = "successMessage";
	private static final String PROFILE_IMAGE = "profileImage";
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		int userId = (int) session.getAttribute("userId");
		UserService userService = new UserService();
		User user;
		try {
			user = userService.getUserById(userId);

			request.setAttribute("user", user);
			if (request.getAttribute(PROFILE_IMAGE) != null) {
				request.setAttribute(PROFILE_IMAGE, request.getAttribute(PROFILE_IMAGE));
			}
			if (request.getAttribute(SUCCESS_MESSAGE) != null) {
				request.setAttribute(SUCCESS_MESSAGE, request.getAttribute(SUCCESS_MESSAGE));
			}
			request.getRequestDispatcher("/pages/user/profile.jsp").forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/pages/user/profile.jsp").forward(request, response);
		}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		String email = (String) session.getAttribute("user");

		String name = request.getParameter("name");

		char gender = request.getParameter("ud-gender").charAt(0);
		LocalDate dob = LocalDate.parse(request.getParameter("ud-dob"));
		long mobileNo = Long.parseLong(request.getParameter("ud-phone-number"));
		String profileImage = request.getParameter(PROFILE_IMAGE);

		// Create a User object and set the attributes
		User user = new User();
		user.setName(name);
		user.setGender(gender);
		user.setDob(dob);
		user.setMobileNo(mobileNo);
		user.setProfileImage(profileImage);
		user.setEmail(email);

		UserService userService = new UserService();

		try {
			userService.editUser(user);
			session.setAttribute("user", user.getEmail());
			session.setAttribute("userName", user.getName());
			session.setAttribute(PROFILE_IMAGE, user.getProfileImage());

			request.setAttribute(SUCCESS_MESSAGE, "Details updated successfully!");
			doGet(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();

			request.setAttribute("errorMessage", e.getMessage());
			doGet(request, response);
		}

	}

}
