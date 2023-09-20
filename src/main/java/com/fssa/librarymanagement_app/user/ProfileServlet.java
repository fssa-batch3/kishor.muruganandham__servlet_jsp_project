package com.fssa.librarymanagement_app.user;

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

			System.out.println(user);
			request.setAttribute("user", user);
			if (request.getAttribute("profileImage") != null) {
				request.setAttribute("profileImage", request.getAttribute("profileImage"));
			}
			request.getRequestDispatcher("/pages/user/profile.jsp").forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		String email = (String) session.getAttribute("user");

		String name = request.getParameter("name");
		char gender = request.getParameter("gender").charAt(0);
		LocalDate dob = LocalDate.parse(request.getParameter("ud-dob"));
		long mobileNo = Long.parseLong(request.getParameter("ud-phone-number"));
		String profileImage = request.getParameter("profileImage");

		// Create a User object and set the attributes
		User user = new User();
		user.setName(name);
		user.setGender(gender);
		user.setDob(dob);
		user.setMobileNo(mobileNo);
		user.setProfileImage(profileImage);
		user.setEmail(email);

		UserService userService = new UserService();
		System.out.println(user);
		try {
			userService.editUser(user);
			session.setAttribute("user", user.getEmail());
			session.setAttribute("userName", user.getName());
			session.setAttribute("profileImage", user.getProfileImage());
			response.sendRedirect(request.getContextPath() + "/user/profile");
		} catch (ServiceException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}

	}

}
