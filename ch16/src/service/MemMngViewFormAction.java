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
			String id = request.getParameter("id");
			MemberDao dao = MemberDao.getInstance();
			List<MemberDto> list = new ArrayList<MemberDto>(); 
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "mng/memMngViewForm.jsp";
	}

}
