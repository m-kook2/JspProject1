package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dao.MemberVO;

public class LoginAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDAO dao = MemberDAO.getInstance();
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		try {
			List<MemberVO> list = dao.loginchk(id, password);
			if (list != null) {
				for (int i = 0; i < list.size(); i++) {
					session.setAttribute("id", list.get(i).getId());
					session.setAttribute("idx", list.get(i).getIdx());
					session.setAttribute("password", list.get(i).getPassword());
					session.setAttribute("email", list.get(i).getEmail());
					session.setAttribute("nickname", list.get(i).getNickname());
					session.setAttribute("gender", list.get(i).getGender());
					session.setAttribute("reg_date", list.get(i).getReg_date());
					session.setAttribute("del_yn", list.get(i).getDel_yn());
					session.setAttribute("status", list.get(i).getStatus());
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "/login/loginChk.jsp";
	}
}