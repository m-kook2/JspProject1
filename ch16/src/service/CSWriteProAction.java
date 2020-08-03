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
			System.out.println("pageNum ->" + request.getParameter("pageNum"));
			request.setCharacterEncoding("utf-8");
			String pageNum = request.getParameter("pageNum");
			String c_idx_s = request.getParameter("c_idx");
			int c_idx;
			if(c_idx_s == null || c_idx_s == "") {
				c_idx = 0;
			}else {
				c_idx = Integer.parseInt(request.getParameter("c_idx"));
			}
			if(pageNum == null || pageNum == "") pageNum = "1";
			System.out.println("c_idx ->" + Integer.parseInt(request.getParameter("c_idx")));
			System.out.println("subject ->" +request.getParameter("subject"));
			System.out.println("writer ->" +request.getParameter("writer"));
			System.out.println("content ->" +request.getParameter("content"));
			CSDto cs = new CSDto();
			cs.setC_idx(Integer.parseInt(request.getParameter("c_idx")));
			cs.setSubject(request.getParameter("subject"));
			cs.setWriter(request.getParameter("writer"));
			cs.setContent(request.getParameter("content"));
			System.out.println("ref=>" + cs.getRef());
			cs.setRef(Integer.parseInt(request.getParameter("ref")));
			cs.setRe_step(Integer.parseInt(request.getParameter("re_step")));
			cs.setRe_level(Integer.parseInt(request.getParameter("re_level")));
			
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
