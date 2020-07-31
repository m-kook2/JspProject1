package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CSDto;

public class CSProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String pageNum = request.getParameter("pageNum");
			CSDto email = new CSDto();
			email.setNum(Integer.parseInt(request.getParameter("num")));
			email.setSubject(request.getParameter("subject"));
			email.setWriter(request.getParameter("writer"));
			email.setContent(request.getParameter("content"));
			email.setPasswd(request.getParameter("passwd"));
		} catch (Exception e) {
			System.out.println(e.getMessage());	}
		
		return "cs/csForm.jsp";
	}

}
