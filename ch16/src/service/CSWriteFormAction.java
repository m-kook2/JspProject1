package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board;
import dao.BoardDao;
import dao.CSDao;
import dao.CSDto;

public class CSWriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int ref = 0, re_level = 0, re_step = 0;
			HttpSession session = request.getSession();
			String writer = (String) session.getAttribute("id");
			String pageNum = request.getParameter("pageNum");
			String c_idx_s = request.getParameter("c_idx");
			String ref_s = request.getParameter("ref");
			if (ref_s == null || ref_s == "") {
				ref = 0;
			} else {
				ref = Integer.parseInt(request.getParameter("ref"));
			}

			System.out.println("pageNum1 =>" + pageNum);

			int c_idx;
			if (c_idx_s == null || c_idx_s == "") {
				c_idx = 0;
			} else {
				c_idx = Integer.parseInt(request.getParameter("c_idx"));
			}
			if (pageNum == null || pageNum == "")
				pageNum = "1";
			System.out.println("pageNum2 =>" + pageNum);

			System.out.println("ref 1 =>" + ref);
			// 댓글
			if (request.getParameter("c_idx") != null) {
				c_idx = Integer.parseInt(request.getParameter("c_idx"));
				CSDao cd = CSDao.getInstance();
				CSDto cs = cd.select(c_idx);
				ref = cs.getRef();
				re_level = cs.getRe_level();
				re_step = cs.getRe_step();
			}

			System.out.println("ref 2 =>" + ref);

			request.setAttribute("pageNum", pageNum);
			request.setAttribute("c_idx", c_idx);
			request.setAttribute("writer", writer);
			request.setAttribute("ref", ref);
			request.setAttribute("re_level", re_level);
			request.setAttribute("re_step", re_step);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "cs/csWriteForm.jsp";

	}

}
