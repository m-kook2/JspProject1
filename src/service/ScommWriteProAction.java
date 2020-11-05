package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommDao;
import dao.CommDto;

public class ScommWriteProAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("왔냐?????????");
		 	request.setCharacterEncoding("utf-8"); 
	        /*String pageNum = request.getParameter("pageNum");
	        System.out.println("pageNum"+pageNum);*/
	        /*String id =request.getParameter("s_id");*/
	        String c_content= request.getParameter("s_content");
	        int step = Integer.parseInt(request.getParameter("s_step"));
	        int m_idx = Integer.parseInt(request.getParameter("s_m_idx"));
	        String id = request.getParameter("id");
	        
	        
	        
	        CommDto comm = new CommDto();
	        
	        comm.setId(id);
	        comm.setC_content(c_content);
	        comm.setM_idx(m_idx);
	        comm.setStep(step);
	
	       
	        CommDao cd = CommDao.getInstance();//DB 
	        int result = cd.insert2(comm);
	        System.out.println("왔냐?");
	        request.setAttribute("result", result);
	        request.setAttribute("m_idx", m_idx);
	        request.setAttribute("step", step);
	        
		} catch(Exception e) { 
			System.out.println(e.getMessage()); 
			}
     return "/movie/scommwritePro.jsp";
	}

}