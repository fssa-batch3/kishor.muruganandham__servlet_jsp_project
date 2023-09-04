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
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/user/update-user")
public class UpdateUserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


        String name = request.getParameter("name");
        String profileImage = request.getParameter("profileImage");
        long mobileNo = Long.parseLong(request.getParameter("mobileNo"));
        LocalDate dob = LocalDate.parse(request.getParameter("dob"));


		HttpSession session = request.getSession();


		String email = (String) session.getAttribute("user");

		UserService userService = new UserService();
		User user = new User();
		user.setName(name);
		user.setProfileImage(profileImage);
		user.setMobileNo(mobileNo);
		user.setGender('M');
		user.setDob(dob);
		user.setEmail(email);
		try {
			System.out.print(user);
			userService.editUser(user);
			session.setAttribute("profileImage", user.getProfileImage());
			response.sendRedirect(request.getContextPath() + "/user/user-profile");
		} catch (ServiceException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}

	}

}
