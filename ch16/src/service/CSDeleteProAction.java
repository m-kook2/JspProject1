package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.CSDao;
import dao.ReviewDao;

public class CSDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int c_idx = Integer.parseInt(request.getParameter("c_idx"));
			String pageNum = request.getParameter("pageNum");
			CSDao cd = CSDao.getInstance();
			int result = cd.delete(c_idx);
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("c_idx", c_idx);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "cs/csDeletePro.jsp";
	}

}
