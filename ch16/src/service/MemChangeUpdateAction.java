package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemChangeDAO;
import dao.MemberDAO;

public class MemChangeUpdateAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemChangeDAO dao = MemChangeDAO.getInstance();
		return null;
	}

}
