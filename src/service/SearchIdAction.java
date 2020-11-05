package service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

public class SearchIdAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberDao md = MemberDao.getInstance();
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String pw = "";
		try {
			id = md.findId(email);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		request.setAttribute("id", id);
		System.out.println("id---"+ id);
		return "./member/findId.jsp";
	}

}
