package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import dao.MemberDao;
import dao.MemberDto;
import dao.MovieDao;
import dao.MovieDto;
import util.FileUtil;
import util.StringUtil;

public class MovieUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	 	HttpSession session = request.getSession();
	 	String saveDirectory =request.getServletContext().getRealPath("/images/main/photo/");
	 	
		MovieDto mt = new MovieDto();
		
	 	MultipartRequest mp = new MultipartRequest(request, saveDirectory);
	 	//System.out.println("MovieUpdateProAction mp : "+ mp);
	 	String m_idx = new String(mp.getParameter("m_idx").getBytes("iso-8859-1"), "utf-8");
	 	//System.out.println("MovieUpdateProAction m_idx : "+ m_idx);
	 	String m_name = new String(mp.getParameter("m_name").getBytes("iso-8859-1"), "utf-8");
	 	//System.out.println("MovieUpdateProAction m_name : "+ m_name);
	 	String[] m_genre = mp.getParameterValues("m_genre");
		
	 	String genre="";
			for(int i=0; i< m_genre.length; i++) {
				if(genre.equals("")) { genre=m_genre[i]; }
				else {genre=genre+","+m_genre[i]; }
		}
		//System.out.println("MovieUpdateProAction m_genre : "+ m_genre);
		String m_date = new String(mp.getParameter("m_date").getBytes("iso-8859-1"), "utf-8");
		//System.out.println("MovieUpdateProAction m_date : "+ m_date);
		String m_nation = new String(mp.getParameter("m_nation").getBytes("iso-8859-1"), "utf-8");
		//System.out.println("MovieUpdateProAction m_nation : "+ m_nation);
		String m_time = new String(mp.getParameter("m_time").getBytes("iso-8859-1"), "utf-8");
		//System.out.println("MovieUpdateProAction m_time : "+ m_time);
		String m_rate = new String(mp.getParameter("m_rate").getBytes("iso-8859-1"), "utf-8");
		//System.out.println("MovieUpdateProAction m_rate : "+ m_rate);
		String m_story = new String(mp.getParameter("m_story").getBytes("iso-8859-1"), "utf-8");
		//System.out.println("MovieUpdateProAction m_story : "+ m_story);
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
		//System.out.println("MovieUpdateProAction cast : "+ cast);
		String m_director = new String(mp.getParameter("m_director").getBytes("iso-8859-1"), "utf-8");
		//System.out.println("MovieUpdateProAction m_director :" +  m_director);
		String m_video = new String(mp.getParameter("m_video").getBytes("iso-8859-1"), "utf-8");
		//System.out.println("MovieUpdateProAction m_video : "+ m_video);
		String m_photo = "";
		String m_poster = "";	
		String photoChk="";
		String posterChk="";
		int result = 0;
		Enumeration en = mp.getFileNames();
		while(en.hasMoreElements()) {
			String filename1 = (String)en.nextElement(); 
			System.out.println("filename1 : "+filename1);
			if(filename1.equals("m_photo")) {
				m_photo=StringUtil.NullToEmpty(new String(mp.getFilesystemName(filename1).getBytes("iso-8859-1"), "utf-8"));
				if(!m_photo.equals("")){
					mt.setM_photo(m_photo);
					FileUtil fu = new FileUtil();
					fu.filUpload(request, saveDirectory);
				}
			}else{
				photoChk=mp.getParameter("m_photo")!=null?mp.getParameter("m_photo"):"";
				if(!photoChk.equals("")){
					mt.setM_photo(photoChk);
				}
			}
			if(filename1.equals("m_poster")) {
				m_poster= StringUtil.NullToEmpty(new String(mp.getFilesystemName(filename1).getBytes("iso-8859-1"), "utf-8"));
				if(!m_poster.equals("")){
					mt.setM_poster(m_poster);
					FileUtil fu = new FileUtil();
					fu.filUpload(request, saveDirectory);	
				}
			}else{
				posterChk=mp.getParameter("m_poster")!=null?mp.getParameter("m_poster"):"";
				if(!posterChk.equals("")){
					mt.setM_poster(posterChk);
				}
			}
		}
		
		mt.setM_name(m_name);
		mt.setM_genre(new String(genre.getBytes("iso-8859-1"), "utf-8"));
		mt.setM_date(m_date);
		mt.setM_nation(m_nation);
		mt.setM_time(m_time);
		mt.setM_rate(m_rate);
		mt.setM_story(m_story);
		mt.setM_cast(new String(cast.getBytes("iso-8859-1"), "utf-8"));
		mt.setM_director(m_director);
		mt.setM_video(m_video);
		mt.setId((String)session.getAttribute("id"));
		mt.setM_idx(m_idx);
		//System.out.println("id : "+(String)session.getAttribute("id"));
		MovieDao ma = MovieDao.getInstance();
		try {
			result = ma.update(mt);
			System.out.println("MovieUpdateProAction result : " +result);
		} catch (SQLException e) {
			System.out.println("MovieUpdateProAction ERROR!!");
			e.printStackTrace();
		}
		request.setAttribute("result", result);
		request.setAttribute("m_idx", m_idx);

		
		return "movie/movieUpdatePro.jsp";
	}
	}