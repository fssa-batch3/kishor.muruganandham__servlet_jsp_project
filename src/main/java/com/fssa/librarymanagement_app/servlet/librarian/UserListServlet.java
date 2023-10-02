package com.fssa.librarymanagement_app.servlet.librarian;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.model.User;
import com.fssa.librarymanagement.service.UserService;

/**
 * Servlet implementation class UserListServlet
 */
@WebServlet("/librarian/user-list")
public class UserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserService userService = new UserService();
		List<User> userList = new ArrayList<>();
		try {
			userList = userService.listAllUser();

			System.out.println(userList);
			request.setAttribute("userList", userList);
			request.getRequestDispatcher("/pages/librarian/list-user.jsp").forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	}

}
