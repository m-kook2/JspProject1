package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommDao;
import dao.CommDto;

public class CommIdchekAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
		
	        String pageNum = request.getParameter("pageNum");
	        int c_idx = Integer.parseInt(request.getParameter("c_idx"));
	        int m_idx = Integer.parseInt(request.getParameter("m_idx"));
	       /* String id = "/"+request.getParameter("id")+"/";*/
	        int result =0;
	    	CommDao cd = CommDao.getInstance();
	        
	       /* result = cd.chek(id, c_idx);*/
	        
	        System.out.println("pageNum"+pageNum);
	        System.out.println("c_idx"+c_idx);
	        System.out.println("m_idx"+m_idx);
	        /*System.out.println("id"+id);*/
	        
	        /*request.setAttribute("id", id);*/
	        request.setAttribute("c_idx", c_idx);
	        request.setAttribute("m_idx", m_idx);
	        request.setAttribute("pageNum", pageNum);
	        request.setAttribute("result", result);
		} catch(Exception e) { 
			System.out.println(e.getMessage()); 
			}
     return "/movie/commidchek.jsp";
	}
}