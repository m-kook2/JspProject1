package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

public class MemberMngView implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberDao dao = MemberDao.getInstance();
		String id = request.getParameter("id");
		try {
			/*List<MemberDto> list = dao.loginchk(id);
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
			}*/
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "mng/memberMngView.jsp";
	}

}
