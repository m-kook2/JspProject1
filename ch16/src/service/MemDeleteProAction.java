package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.MemberDto;

public class MemDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			request.setCharacterEncoding("utf-8");
			MemberDto md = new MemberDto();
			md.setId(request.getParameter("id"));
			md.setPassword(request.getParameter("password"));
			md.setNickname(request.getParameter("nickname"));
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String nickname = request.getParameter("nickname");
			MemberDao dao = MemberDao.getInstance();
			int result = dao.delete(id, password, nickname);
			request.setAttribute("result", result);
			request.setAttribute("password", password);
			request.setAttribute("nickname", nickname);
			
			if(result != 0) {
				session.invalidate();//세션끊는거
			}
			System.out.println("deleteProAction resule"+request.getParameter("result"));
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "member/memdelete.jsp";
	}

}
