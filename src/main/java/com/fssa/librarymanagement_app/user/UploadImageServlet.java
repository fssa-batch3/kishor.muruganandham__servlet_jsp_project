package com.fssa.librarymanagement_app.user;

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

import com.fssa.librarymanagement.utils.CloudinaryUtil;
import com.fssa.librarymanagement.utils.ImageUploader;

/**
 * Servlet implementation class UploadImageServlet
 */
@WebServlet("/librarian/upload-image")
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

		String imageUrl = null;

		String imageURLParameter = request.getParameter("image-url");
		if (imageURLParameter != null && !imageURLParameter.isEmpty()) {
			imageUrl = imageURLParameter;
		} else {
			Part filePart = request.getPart("image-file");
			if (filePart != null && filePart.getSize() > 0) {
				InputStream fileContent = filePart.getInputStream();
				Map uploadResult = imageUploader.uploadImage(fileContent, String.valueOf(userId), userName);
				imageUrl = (String) uploadResult.get("url");
			}
		}

		response.setContentType("text/plain");
		response.getWriter().write(imageUrl);

	}
}
