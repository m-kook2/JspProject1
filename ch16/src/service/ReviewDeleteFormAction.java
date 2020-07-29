package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReviewDeleteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		return null;
	}

}
