package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.MemberDto;

public class LoginAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDao dao = MemberDao.getInstance();
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		try {
			List<MemberDto> list = dao.loginchk(id, password);
			if (list.size() > 0 ) {
				for (int i = 0; i < list.size(); i++) {
					if(!list.get(i).getStatus().equals("3") && !list.get(i).getDel_yn().equals("Y")) {
						session.setAttribute("id", list.get(i).getId());
						session.setAttribute("idx", list.get(i).getIdx());
						session.setAttribute("password", list.get(i).getPassword());
						session.setAttribute("zip", list.get(i).getZip());
						session.setAttribute("addr", list.get(i).getAddr());
						session.setAttribute("email", list.get(i).getEmail());
						session.setAttribute("nickname", list.get(i).getNickname());
						session.setAttribute("gender", list.get(i).getGender());
						session.setAttribute("reg_date", list.get(i).getReg_date());
						session.setAttribute("del_yn", list.get(i).getDel_yn());
						session.setAttribute("status", list.get(i).getStatus());
						session.setAttribute("pic", list.get(i).getPic());
						request.setAttribute("msg", "로그인되었습니다.");
					}else if(list.get(i).getStatus().equals("3")){
						request.setAttribute("msg", "정지회원입니다.");
					}else if(list.get(i).getDel_yn().equals("Y")) {
						request.setAttribute("msg", "틸퇴회원입니다.");
					}
				}
			}else {
				request.setAttribute("msg", "찾을수 없는 회원입니다.");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "/login/loginChk.jsp";
	}
}