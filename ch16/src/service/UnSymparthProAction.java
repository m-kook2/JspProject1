package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommDao;
import dao.CommDto;

public class UnSymparthProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
		
	        String pageNum = request.getParameter("pageNum");
	        int c_idx = Integer.parseInt(request.getParameter("c_idx"));
	        int m_idx = Integer.parseInt(request.getParameter("m_idx"));
	        String id = "/"+request.getParameter("id")+"/";
	        System.out.println("c_idx"+ c_idx);
	        System.out.println("m_idx"+ m_idx);
	        CommDto comm = new CommDto();
	        
	        comm.setM_idx(Integer.parseInt(request.getParameter("m_idx")));
	        comm.setC_idx(Integer.parseInt(request.getParameter("c_idx")));
	        CommDao cd = CommDao.getInstance();//DB 
	        int result = cd.uupdate(c_idx, id);
	        request.setAttribute("m_idx", comm.getM_idx());
	        request.setAttribute("result", result);
	        request.setAttribute("pageNum", pageNum);
	        
		} catch(Exception e) { 
			System.out.println(e.getMessage()); 
			}
     return "/movie/unsympathPro.jsp";
	}
}