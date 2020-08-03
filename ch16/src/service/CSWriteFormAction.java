package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CSWriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			try {
				HttpSession session = request.getSession();
				String id = (String) session.getAttribute("id");
				String pageNum = request.getParameter("pageNum");
				String c_idx_s = request.getParameter("c_idx");
				System.out.println("pageNum =>" + pageNum);
				int c_idx;
				if(c_idx_s == null || c_idx_s == "") {
					c_idx = 0;
				}else {
					c_idx = Integer.parseInt(request.getParameter("c_idx"));
				}
				if(pageNum == null || pageNum == "") pageNum = "1";
				System.out.println("pageNum =>" + pageNum);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("c_idx", c_idx);
				request.setAttribute("id", id);
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return "cs/csWriteForm.jsp";
	
	}

}
