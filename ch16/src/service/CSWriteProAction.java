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
			System.out.println("writeProAction");
			System.out.println(request.getParameter("pageNum"));
			request.setCharacterEncoding("utf-8");
			String pageNum = request.getParameter("pageNum");
			CSDto cs = new CSDto();
			System.out.println(Integer.parseInt(request.getParameter("c_idx")));
			System.out.println(request.getParameter("subject"));
			System.out.println(request.getParameter("writer"));
			System.out.println(request.getParameter("content"));
			cs.setC_idx(Integer.parseInt(request.getParameter("c_idx")));
			cs.setSubject(request.getParameter("subject"));
			cs.setWriter(request.getParameter("writer"));
			cs.setContent(request.getParameter("content"));
			
			System.out.println(cs.getWriter());
			System.out.println(cs.getContent());
			CSDao cd = CSDao.getInstance();
			int result = cd.insert(cs);
			request.setAttribute("c_idx", cs.getC_idx());
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println(e.getMessage());	}
		
		return "cs/csWritePro.jsp";
	}

}
