package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MovieDao;
import dao.MovieDto;
import dao.ReviewDao;
import dao.ReviewDto;

public class MovieUpdateFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String m_idx = request.getParameter("m_idx");
			System.out.println();
			MovieDao ma = MovieDao.getInstance();
			
			MovieDto mt = ma.select(m_idx);
			
			
			request.setAttribute("m_idx", m_idx);
			request.setAttribute("mt", mt);
		} catch(Exception e) { System.out.println(e.getMessage()); }
		
		return "movie/movieUpdateForm.jsp";
	}

}
