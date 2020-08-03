package service;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.MemberDto;
public class MemExcelDownAction implements CommandProcess {
	public String requestPro(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		MemberDao md = MemberDao.getInstance();
		try {
			List<MemberDto> list=md.memMngExcelDown();
			request.setAttribute("list", list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "mng/memExcelDown.jsp";
	}
}