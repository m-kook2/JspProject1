package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookmarkDao;
import dao.BookmarkDto;

public class BookExcelDownAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		BookmarkDao bd = BookmarkDao.getInstance();
		try {
			List<BookmarkDto> list = bd.bdExcelDown(id);
			request.setAttribute("list", list);
			request.setAttribute("id", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "bookmark/bookMarkExcelDown.jsp";
	}

}
