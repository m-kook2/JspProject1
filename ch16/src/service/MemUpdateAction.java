package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import dao.MemberDao;
import dao.MemberDto;

public class MemUpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		MemberDao md = MemberDao.getInstance();
		int result = 0;
		
		/*MemberDto vo2 = new MemberDto();
		vo2.setId(id);
		vo2.setPassword(password);
		vo2.setEmail(email);
		vo2.setNickname(nickname);*/
		
		request.setAttribute("id", id);
		request.setAttribute("password", password);
		request.setAttribute("email", email);
		request.setAttribute("nickname", nickname);
		try {
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			// TODO: handle exception
		}
		
		return null;
	}

}

/*request.setCharacterEncoding("utf-8");
		MemberDto mt = new MemberDto();
		mt.setId(request.getParameter("id"));
		mt.setPassword(request.getParameter("password"));
		mt.setEmail(request.getParameter("email"));
		mt.setPassword(request.getParameter("password"));
		MemberDao md = MemberDao.getInstance();
		try {
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}*/