package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommDao;
import dao.CommDto;

public class CommExcelDownAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CommDao dao = CommDao.getInstance();
		try {
			List<CommDto> list = dao.commMngExcelDown();
			request.setAttribute("list", list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "mng/commExcelDown.jsp";
	}

}
