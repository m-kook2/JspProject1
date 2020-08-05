package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.MemberDto;

public class MemMngUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		String zip = request.getParameter("zip");
		String addr = request.getParameter("addr");
		String gender = request.getParameter("gender");
		String status = request.getParameter("status");
		String del_yn = request.getParameter("del_yn");
		int result = 0;

		MemberDto dto = new MemberDto();
		dto.setId(id);
		dto.setPassword(password);
		dto.setEmail(email);
		dto.setNickname(nickname);
		dto.setZip(zip);
		dto.setAddr(addr);
		dto.setGender(gender);
		dto.setStatus(status);
		dto.setDel_yn(del_yn);
		MemberDao mem = MemberDao.getInstance();
		try {
			result = mem.memMngUpdate(dto);
			if(result==1){
				request.setAttribute("result", id);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "mng/memMngUpdatePro.jsp";
	}

}
