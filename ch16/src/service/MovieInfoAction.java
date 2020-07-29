package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MovieDao;
import dao.MovieDto;

public class MovieInfoAction implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("MovieInfoAction 시작");
			String m_idx = request.getParameter("m_idx");
			String pageNum = request.getParameter("pageNum");
			MovieDao md = MovieDao.getInstance();
			MovieDto mt = md.select(m_idx);
			System.out.println(pageNum);
			System.out.println(m_idx);
			System.out.println(mt);
			
			request.setAttribute("m_idx", m_idx);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("mt", mt);
		} catch(Exception e) { System.out.println(e.getMessage()); }
		return "movie/movieInfo.jsp";
	}
}
