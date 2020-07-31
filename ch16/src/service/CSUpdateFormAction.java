package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CSDao;
import dao.CSDto;
import dao.ReviewDao;
import dao.ReviewDto;

public class CSUpdateFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int num = Integer.parseInt(request.getParameter("num"));
			String pageNum = request.getParameter("pageNum");
			CSDao cd = CSDao.getInstance();
			CSDto cs = cd.select(num);
			
			request.setAttribute("num", num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("cs", cs);
		} catch(Exception e) { System.out.println(e.getMessage()); }
		return "cs/csUpdateForm.jsp";
	}

}
