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
			System.out.println("왔냐?????????");
		 	request.setCharacterEncoding("utf-8"); 
	        String pageNum = request.getParameter("pageNum");
	        System.out.println("pageNum"+pageNum);
	        String id =request.getParameter("id");
	        String c_content= request.getParameter("c_content");
	        int m_idx = Integer.parseInt(request.getParameter("m_idx"));
	        /*int c_grade =Integer.parseInt(request.getParameter("c_grade"));*/
	        System.out.println("id="+id);
	        System.out.println("c_content="+c_content);
	        System.out.println("m_idx="+m_idx);
	        
	        
	        CommDto comm = new CommDto();
	        
	        comm.setId(id);
	        comm.setC_content(c_content);
	        comm.setM_idx(m_idx);
	        /*comm.setC_grade(c_grade);*/
	
	        
	        
	        /*comm.setId(request.getParameter("id"));
	        comm.setC_content(request.getParameter("c_content"));
	        comm.setM_idx(Integer.parseInt(request.getParameter("m_idx")));
	        comm.setC_grade(Integer.parseInt(request.getParameter("c_grade")));
	        comm.setM_idx(Integer.getInteger(request.getParameter("m_idx")));*/
	        CommDao cd = CommDao.getInstance();//DB 
	        int result = cd.insert(comm);
	        System.out.println("왔냐?");
	        request.setAttribute("result", result);
	        request.setAttribute("pageNum", pageNum);
	        request.setAttribute("m_idx", m_idx);
	        
		} catch(Exception e) { 
			System.out.println(e.getMessage()); 
			}
     return "/movie/commwritePro.jsp";
	}

}
