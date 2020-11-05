package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommDao;

public class ScommDeleteProAction  implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("답글 삭제부분");
			int c_idx = Integer.parseInt(request.getParameter("c_idx"));
			int m_idx = Integer.parseInt(request.getParameter("m_idx"));
			System.out.println(c_idx);
			System.out.println(m_idx);
			
			CommDao cd = CommDao.getInstance();
			int result = cd.sdelete(c_idx);
			request.setAttribute("result", result);
			request.setAttribute("m_idx", m_idx);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "movie/scommdeletePro.jsp";
	}

}
