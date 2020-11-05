package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.ReviewDao;

public class ReviewDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int p_idx = Integer.parseInt(request.getParameter("p_idx"));
			String pageNum = request.getParameter("pageNum");
			BoardDao bd = BoardDao.getInstance();
			ReviewDao rd = ReviewDao.getInstance();
			int result = rd.delete(p_idx);
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("p_idx", p_idx);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "review/reviewdeletepro.jsp";
	}

}
