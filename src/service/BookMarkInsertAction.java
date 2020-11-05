package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookmarkDao;
import dao.BookmarkDto;

public class BookMarkInsertAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String pageNum = request.getParameter("pageNum");
		String idx = request.getParameter("idx");
		try {			
			BookmarkDao bd = BookmarkDao.getInstance();
			int m_idx = Integer.parseInt(request.getParameter("m_idx"));
			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}
			int result = bd.insert(m_idx, id);
			request.setAttribute("result", result);
	        request.setAttribute("pageNum", pageNum);
	        request.setAttribute("m_idx", m_idx);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "bookmark/bookMarkInsert.jsp";
	}

}
