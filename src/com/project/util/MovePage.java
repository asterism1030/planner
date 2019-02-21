package com.project.util;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MovePage {
	
	public static void redirect(String path, HttpServletResponse response) throws IOException {
		response.sendRedirect(path);
	}
	
	public static void forward(String path, HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		RequestDispatcher disp = request.getRequestDispatcher(path);
		disp.forward(request, response);
	}

}
