package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReviewWriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String pageNum = request.getParameter("pageNum");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "review/reviewwriteForm.jsp";
	}

}
