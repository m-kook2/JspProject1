package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CSDao;
import dao.CSDto;
import dao.ReviewDao;
import dao.ReviewDto;

public class CSUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8"); 
	        String pageNum = request.getParameter("pageNum");
	        CSDto cs = new CSDto();
	        int num=Integer.parseInt(request.getParameter("num"));
	        String subject=request.getParameter("subject");
	        String content =request.getParameter("content");
	        System.out.println(num);
	        System.out.println(subject);
	        System.out.println(content);
	        cs.setNum(num);
	        cs.setSubject(subject);
	        cs.setContent(content);
	        /*review.setP_idx(Integer.parseInt(request.getParameter("p_idx")));
	        review.setP_title(request.getParameter("p_title"));
	        review.setP_content(request.getParameter("p_content"));*/
			CSDao cd = CSDao.getInstance();
			int result = cd.update(cs);
			System.out.println(result);
			request.setAttribute("result", result);
			request.setAttribute("num", cs.getNum());
			request.setAttribute("pageNum", pageNum);
		} catch(Exception e) { 
			System.out.println(e.getMessage()); 
		}
		return "cs/csUpdatePro.jsp";
	}
}
