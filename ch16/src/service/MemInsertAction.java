package service;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dao.MemberVO;
public class MemInsertAction implements CommandProcess {
	public String requestPro(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		String gender = request.getParameter("gender");
		int result = 0;
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPassword(password);
		vo.setEmail(email);
		vo.setNickname(nickname);
		vo.setGender(gender);
		
		MemberDAO mem = MemberDAO.getInstance();
		
		try {
			result=mem.insert(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "member/memInsert.jsp";
	}
}