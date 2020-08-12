package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.MovieDao;
import dao.MovieDto;
import util.FileUtil;

public class MovieInsertProAction implements CommandProcess {
 
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int maxSize = 5*1024*1024;
		String fileSave = "/images/main/photo";
	 	HttpSession session = request.getSession();
		String realPath = request.getSession().getServletContext().getRealPath(fileSave);
//	 	String saveDirectory =request.getServletContext().getRealPath("/images/main/photo/");
//	 	MultipartRequest mp = new MultipartRequest(request, saveDirectory);
	 	MultipartRequest multi = new MultipartRequest (request, realPath, maxSize,"utf-8", new DefaultFileRenamePolicy());
		String m_name = multi.getParameter("m_name");
		String[] m_genre = multi.getParameterValues("m_genre");
		System.out.println("m_name : "+m_name);
		String genre="";
			for(int i=0; i< m_genre.length; i++) {
				if(genre.equals("")) { genre=m_genre[i]; }
				else {genre=genre+","+m_genre[i]; }
		}
		String m_date = multi.getParameter("m_date");
		String m_nation = multi.getParameter("m_nation");
	 	String m_time = multi.getParameter("m_time");
	 	String m_rate = multi.getParameter("m_rate");
	 	String m_story = multi.getParameter("m_story");
	 	String[] m_cast = multi.getParameterValues("m_cast1");
		String cast="";
		for(int i=0; i< m_cast.length; i++) {
			if(cast.equals("")) {
				if(!m_cast[i].equals("")) {
					cast=m_cast[i];	
				}
			}else{
				if(!m_cast[i].equals("")) {
					cast=cast+","+m_cast[i];	
				}
			}
		}
	 	String m_director = multi.getParameter("m_director");
	 	String m_photo = "";
	 	String m_video = multi.getParameter("m_video");
	 	String m_poster = "";
	 	String id = multi.getParameter("id");
		FileUtil fu = new FileUtil();
		int result = 0;
		Enumeration en = multi.getFileNames();
		while(en.hasMoreElements()) {
			String filename1 = (String)en.nextElement(); 
			if(filename1.equals("m_photo")) {
				m_photo=multi.getFilesystemName(filename1);
			}
			if(filename1.equals("m_poster")) {
				m_poster= multi.getFilesystemName(filename1);
			}
		}
		MovieDto mt = new MovieDto();
		mt.setM_name(m_name);
		mt.setM_genre(genre);
		mt.setM_date(m_date);
		mt.setM_nation(m_nation);
		mt.setM_time(m_time);
		mt.setM_rate(m_rate);
		mt.setM_story(m_story);
		mt.setM_cast(cast);
		mt.setM_director(m_director);
		mt.setM_photo(m_photo);
		mt.setM_video(m_video);
		mt.setM_poster(m_poster);
		mt.setId((String)session.getAttribute("id"));

		MovieDao ma = MovieDao.getInstance();
		try {
			result = ma.insert(mt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("result", result);
		
		return "movie/movieInsertPro.jsp";
	}
}