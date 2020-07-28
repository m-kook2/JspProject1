package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemUpdateDao;
import dao.MemUpdateDto;
import dao.MemberDao;

public class MemUpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemUpdateDao dao = MemUpdateDao.getInstance();
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		try {
			List<MemUpdateDto> list = dao.memUpdateForm(id, password, email, nickname);
			if(list != null) {
				for(int i = 0; i > list.size();i++){
					MemUpdateDto md = new MemUpdateDto();
					session.setAttribute("id", list.get(i).getId());
					session.setAttribute("password", list.get(i).getPassword());
					session.setAttribute("email", list.get(i).getEmail());
					session.setAttribute("nickname", list.get(i).getNickname());
					session.setAttribute("nickname", nickname);
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "memUpdateForm.jsp";
	}
	

}
