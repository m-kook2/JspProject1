package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CSDao;
import dao.CSDto;

public class CSViewAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int c_idx = Integer.parseInt(request.getParameter("c_idx"));
			String pageNum = request.getParameter("pageNum");
			CSDao cd = CSDao.getInstance();
			CSDto cs = cd.select(c_idx);

			request.setAttribute("c_idx", c_idx);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("cs", cs);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "cs/csView.jsp";
	}
}
