package com.fssa.librarymanagement_app;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.service.UserService;
import com.fssa.librarymanagement.utils.CloudinaryUtil;
import com.fssa.librarymanagement.utils.ImageUploader;

/**
 * Servlet implementation class UploadImageServlet
 */
@WebServlet("/upload-image")
@MultipartConfig
public class UploadImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ImageUploader imageUploader;

	@Override
	public void init() throws ServletException {
		CloudinaryUtil cloudinaryConfig = new CloudinaryUtil();
		imageUploader = new ImageUploader(cloudinaryConfig.getCloudinary());
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("userId");
		String userName = (String) session.getAttribute("userName");
		Part filePart = request.getPart("image-file");
		InputStream fileContent = filePart.getInputStream();

		Map uploadResult = imageUploader.uploadImage(fileContent, String.valueOf(userId), userName);

		String imageUrl = (String) uploadResult.get("url");

		UserService userService = new UserService();

		try {
			userService.updateProfileImage(userId, imageUrl);
			if ((boolean) session.getAttribute("isAdmin")) {
				response.sendRedirect(request.getContextPath() + "/librarian/profile");
			} else {
				response.sendRedirect(request.getContextPath() + "/user/profile");
			}
		} catch (ServiceException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}
}
