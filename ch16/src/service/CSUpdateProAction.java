package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CSDao;
import dao.CSDto;
import dao.ReviewDao;
import dao.ReviewDto;

public class CSUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			// updateForm에서 받아옴
			request.setCharacterEncoding("utf-8");
			String pageNum = request.getParameter("pageNum");
			int c_idx = Integer.parseInt(request.getParameter("c_idx"));
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");

			System.out.println(c_idx);
			System.out.println(subject);
			System.out.println(content);

			CSDto cs = new CSDto();
			cs.setC_idx(c_idx);
			cs.setSubject(subject);
			cs.setContent(content);

			CSDao cd = CSDao.getInstance();
			int result = cd.update(cs);
			System.out.println(result);
			request.setAttribute("result", result);
			request.setAttribute("c_idx", cs.getC_idx());
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "cs/csUpdatePro.jsp";
	}
}
