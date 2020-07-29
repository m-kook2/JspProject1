package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.BookmarkDao;

public class BookmarkDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String id = request.getParameter("id");
			int m_idx = Integer.parseInt(request.getParameter("m_idx"));
			String pageNum = request.getParameter("pageNum");
			BookmarkDao bd = BookmarkDao.getInstance();
			int result = bd.delete(id, m_idx);
			request.setAttribute("pageNum", pageNum);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "bookmark/bkmarkForm.jsp";
	}

}
