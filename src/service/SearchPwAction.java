package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

public class SearchPwAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("SearchPwAction start...");
		MemberDao md = MemberDao.getInstance();
		String id = request.getParameter("id");
		System.out.println("SearchPwAction findPw id->"+ id);
		String email = request.getParameter("email");
		System.out.println("SearchPwAction findPw email->"+ email);
		String DBpw = "";
		try {
			DBpw = md.findPw(id, email);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			}

		request.setAttribute("pw", DBpw);
		
		System.out.println("searhPwAction DBpw->" + DBpw);
		return "./member/findPw.jsp";
	}

}
