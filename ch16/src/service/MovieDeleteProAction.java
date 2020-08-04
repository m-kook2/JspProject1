package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.MovieDao;
import dao.ReviewDao;

public class MovieDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String m_idx = request.getParameter("m_idx");
			MovieDao ma = MovieDao.getInstance();
			int result = ma.delete(m_idx);
			request.setAttribute("result", result);
			request.setAttribute("m_idx", m_idx);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "movie/movieDeletePro.jsp";
	}

}
