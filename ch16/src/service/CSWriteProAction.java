package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CSDao;
import dao.CSDto;

public class CSWriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String pageNum = request.getParameter("pageNum");
			CSDto cs = new CSDto();
			cs.setNum(Integer.parseInt(request.getParameter("num")));
			cs.setSubject(request.getParameter("subject"));
			cs.setWriter(request.getParameter("writer"));
			cs.setContent(request.getParameter("content"));
			cs.setPasswd(request.getParameter("password"));
			
			System.out.println(Integer.parseInt(request.getParameter("num")));
			System.out.println(request.getParameter("subject"));
			System.out.println(cs.getWriter());
			System.out.println(cs.getContent());
			System.out.println(cs.getPasswd());
			CSDao cd = CSDao.getInstance();
			int result = cd.insert(cs);
			request.setAttribute("num", cd.getNum());
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println(e.getMessage());	}
		
		return "cs/csWritePro.jsp";
	}

}
