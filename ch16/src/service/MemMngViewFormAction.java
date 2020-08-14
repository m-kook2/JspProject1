package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.MemberDto;

public class MemMngViewFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String saveDirectory = request.getServletContext().getRealPath("/images/member/img/");
			String id = request.getParameter("id");
			MemberDao dao = MemberDao.getInstance();
			MemberDto dto = dao.memMngView(id);
			request.setAttribute("result", dto);
			request.setAttribute("saveDirectory", saveDirectory);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "mng/memMngViewForm.jsp";
	}

}
