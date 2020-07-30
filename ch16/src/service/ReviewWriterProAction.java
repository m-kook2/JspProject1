package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import dao.ReviewDao;
import dao.ReviewDto;

public class ReviewWriterProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
		 	request.setCharacterEncoding("utf-8"); 
	        String pageNum = request.getParameter("pageNum");
	        ReviewDto review = new ReviewDto();
	        review.setP_idx(Integer.parseInt(request.getParameter("p_idx")));
	        review.setP_title(request.getParameter("p_title"));
	        review.setP_content(request.getParameter("p_content"));
	        review.setM_idx(Integer.parseInt(request.getParameter("m_idx")));
	        ReviewDao rd = ReviewDao.getInstance();//DB 
	        int result = rd.insert(review);
	        request.setAttribute("num", review.getP_idx());
	        request.setAttribute("result", result);
	        request.setAttribute("pageNum", pageNum);
		} catch(Exception e) { System.out.println(e.getMessage()); }
     return "/review/reviewwritePro.jsp";
	}

	
}
