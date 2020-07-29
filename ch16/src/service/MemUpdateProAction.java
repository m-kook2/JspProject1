package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.MemberDto;

public class MemUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		System.out.println("id : "+id+", "+password+", "+email+", "+nickname);
		int result = 0;

		MemberDto vo = new MemberDto();
		vo.setId(id);
		vo.setPassword(password);
		vo.setEmail(email);
		vo.setNickname(nickname);

		MemberDao mem = MemberDao.getInstance();
		try {
			result = mem.memUpdateForm(vo);
			if(result==1) {
				session.setAttribute("email", email);
				session.setAttribute("nickname", nickname);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "member/memUpdatePro.jsp";
	}

}
