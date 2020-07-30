package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import dao.ReviewDao;
import dao.ReviewDto;

public class ReviewUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
		request.setCharacterEncoding("utf-8"); 
        String pageNum = request.getParameter("pageNum");
        ReviewDto review = new ReviewDto();
        int p_idx=Integer.parseInt(request.getParameter("p_idx"));
        String p_title=request.getParameter("p_title");
        String p_content =request.getParameter("p_content");
        System.out.println(p_idx);
        System.out.println(p_title);
        System.out.println(p_content);
        review.setP_idx(p_idx);
        review.setP_title(p_title);
        review.setP_content(p_content);
        /*review.setP_idx(Integer.parseInt(request.getParameter("p_idx")));
        review.setP_title(request.getParameter("p_title"));
        review.setP_content(request.getParameter("p_content"));*/
		ReviewDao rd = ReviewDao.getInstance();
		int result = rd.update(review);
		System.out.println(result);
		request.setAttribute("result", result);
		request.setAttribute("p_idx", review.getP_idx());
		request.setAttribute("pageNum", pageNum);
	} catch(Exception e) { 
		System.out.println(e.getMessage()); 
	}
	return "review/reviewupdatePro.jsp";
}

}
