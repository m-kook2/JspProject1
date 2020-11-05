package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import dao.BookmarkDao;

public class BookmarkDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			System.out.println("BookmarkDeleteProAction start...");
			// 로그인 된 id를 받아온다
			String id = (String) session.getAttribute("id");
			// jsp에서 보낸 m_idx를 받아온다
			int m_idx = Integer.parseInt(request.getParameter("m_idx"));
			System.out.println("BookmarkDeleteProAction id->" + id);
			System.out.println("BookmarkDeleteProAction m_idx->" + m_idx);
			String pageNum = request.getParameter("pageNum");
			BookmarkDao bd = BookmarkDao.getInstance();
			int result = bd.delete(id, m_idx);
			System.out.println("BookmarkDeleteProAction result->" + result);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("result", result);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "bookmark/bookDeleteChk.jsp";
	}

}
