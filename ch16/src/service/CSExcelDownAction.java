package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CSDao;
import dao.CSDto;

public class CSExcelDownAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CSDao md = CSDao.getInstance();
		try {
			List<CSDto> list=md.cslistExcelDown();
			request.setAttribute("list", list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "cs/csExcelDown.jsp";
	}
}