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
				int num = Integer.parseInt(request.getParameter("num"));
				if(pageNum == null) pageNum = "1";
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("num", num);
				request.setAttribute("id", id);
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return "cs/csWriteForm.jsp";
	
	}

}
