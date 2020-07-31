package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommDao;
import dao.CommDto;
import dao.ReviewDao;
import dao.ReviewDto;

public class CommWriteProAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("왔냐?");
		 	request.setCharacterEncoding("utf-8"); 
	        String pageNum = request.getParameter("pageNum");
	        System.out.println("pageNum"+pageNum);
	        CommDto comm = new CommDto();
	        
	        comm.setId(request.getParameter("id"));
	        comm.setC_content(request.getParameter("c_content"));
	        comm.setM_idx(Integer.parseInt(request.getParameter("m_idx")));
	        comm.setC_grade(Integer.parseInt(request.getParameter("c_grade")));
	        comm.setM_idx(Integer.getInteger(request.getParameter("m_idx")));
	        CommDao cd = CommDao.getInstance();//DB 
	        int result = cd.insert(comm);
	        System.out.println("왔냐?");
	        request.setAttribute("result", result);
	        request.setAttribute("pageNum", pageNum);
	        
		} catch(Exception e) { 
			System.out.println(e.getMessage()); 
			}
     return "/movie/commwritePro.jsp";
	}

}
