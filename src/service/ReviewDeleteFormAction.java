package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDao;
import dao.ReviewDto;

public class ReviewDeleteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int p_idx=Integer.parseInt(request.getParameter("p_idx"));
			String pageNum = request.getParameter("pageNum");
			ReviewDao rd = ReviewDao.getInstance();
			ReviewDto review = rd.select(p_idx);
			request.setAttribute("num", p_idx);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("review", review);
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		return "review/reviewdeleteForm.jsp";
	}

}
