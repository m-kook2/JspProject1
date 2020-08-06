package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import dao.MovieDao;
import dao.MovieDto;
import util.FileUtil;

public class MovieInsertProAction implements CommandProcess {
 
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	 	HttpSession session = request.getSession();
	 	String saveDirectory =request.getServletContext().getRealPath("/images/main/photo/");
	 	MultipartRequest mp = new MultipartRequest(request, saveDirectory);
		String m_name = new String(mp.getParameter("m_name").getBytes("iso-8859-1"), "utf-8");
		String[] m_genre = mp.getParameterValues("m_genre");
		System.out.println("m_name : "+m_name);
		String genre="";
			for(int i=0; i< m_genre.length; i++) {
				if(genre.equals("")) { genre=m_genre[i]; }
				else {genre=genre+","+m_genre[i]; }
		}
		String m_date = new String(mp.getParameter("m_date").getBytes("iso-8859-1"), "utf-8");
		String m_nation = new String(mp.getParameter("m_nation").getBytes("iso-8859-1"), "utf-8");
	 	String m_time = new String(mp.getParameter("m_time").getBytes("iso-8859-1"), "utf-8");
	 	String m_rate = new String(mp.getParameter("m_rate").getBytes("iso-8859-1"), "utf-8");
	 	String m_story = new String(mp.getParameter("m_story").getBytes("iso-8859-1"), "utf-8");
	 	String[] m_cast = mp.getParameterValues("m_cast1");
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
	 	String m_director = new String(mp.getParameter("m_director").getBytes("iso-8859-1"), "utf-8");
	 	String m_photo = "";
	 	String m_video = new String(mp.getParameter("m_video").getBytes("iso-8859-1"), "utf-8");
	 	String m_poster = "";
	 	String id = mp.getParameter("id");
		FileUtil fu = new FileUtil();
		fu.filUpload(request, saveDirectory);	 	
		int result = 0;
		Enumeration en = mp.getFileNames();
		while(en.hasMoreElements()) {
			String filename1 = (String)en.nextElement(); 
			if(filename1.equals("m_photo")) {
				m_photo=mp.getFilesystemName(filename1);
			}
			if(filename1.equals("m_poster")) {
				m_poster= mp.getFilesystemName(filename1);
			}
		}
		MovieDto mt = new MovieDto();
		mt.setM_name(m_name);
		mt.setM_genre(new String(genre.getBytes("iso-8859-1"), "utf-8"));
		mt.setM_date(m_date);
		mt.setM_nation(m_nation);
		mt.setM_time(m_time);
		mt.setM_rate(m_rate);
		mt.setM_story(m_story);
		mt.setM_cast(new String(cast.getBytes("iso-8859-1"), "utf-8"));
		mt.setM_director(m_director);
		mt.setM_photo(new String(m_photo.getBytes("iso-8859-1"), "utf-8"));
		mt.setM_video(m_video);
		mt.setM_poster(new String(m_poster.getBytes("iso-8859-1"), "utf-8"));
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