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
		System.out.println("=====================MovieUpdateProAction========================");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int maxSize = 5*1024*1024;
	 	HttpSession session = request.getSession();
	// 	String saveDirectory =request.getServletContext().getRealPath("/images/main/photo/");
		String fileSave = "/images/main/photo";
		String realPath = request.getSession().getServletContext().getRealPath(fileSave);
		System.out.println("WriteProAction start, request.getSession().getServletContext().getRealPath(fileSave)->" + realPath);
		MultipartRequest multi = new MultipartRequest (request, realPath, maxSize,"utf-8", new DefaultFileRenamePolicy());
	 	//MultipartRequest mp = new MultipartRequest(request, saveDirectory);
	 	String v_m_photo = multi.getParameter("m_photo");
	 	String v_m_poster = multi.getParameter("m_poster");
	 	System.out.println("v_m_photo ==>" + v_m_photo);
	 	System.out.println("v_m_poster ==>" + v_m_poster);
		MovieDto mt = new MovieDto();
		
		// Image를 가져올 때 실제 저장한 것이 아니면 인식 하지 못하므로  기존 것 저장하기 위해 , 초기화 저장 
		mt.setM_photo(v_m_photo);
		mt.setM_poster(v_m_poster);

	 	//System.out.println("MovieUpdateProAction mp : "+ mp);
	 	String m_idx = new String(multi.getParameter("m_idx"));
	 	//System.out.println("MovieUpdateProAction m_idx : "+ m_idx);
	 	String m_name = new String(multi.getParameter("m_name"));
	 	//System.out.println("MovieUpdateProAction m_name : "+ m_name);
	 	String[] m_genre = multi.getParameterValues("m_genre");
		
	 	String genre="";
			for(int i=0; i< m_genre.length; i++) {
				if(genre.equals("")) { genre=m_genre[i]; }
				else {genre=genre+", "+m_genre[i]; }
		}
		//System.out.println("MovieUpdateProAction m_genre : "+ m_genre);
		String m_date = new String(multi.getParameter("m_date"));
		//System.out.println("MovieUpdateProAction m_date : "+ m_date);
		String m_nation = new String(multi.getParameter("m_nation"));
		//System.out.println("MovieUpdateProAction m_nation : "+ m_nation);
		String m_time = new String(multi.getParameter("m_time"));
		//System.out.println("MovieUpdateProAction m_time : "+ m_time);
		String m_rate = new String(multi.getParameter("m_rate"));
		//System.out.println("MovieUpdateProAction m_rate : "+ m_rate);
		String m_story = new String(multi.getParameter("m_story"));
		//System.out.println("MovieUpdateProAction m_story : "+ m_story);
		String[] m_cast = multi.getParameterValues("m_cast1");
		String cast="";
		for(int i=0; i< m_cast.length; i++) {
			if(cast.equals("")) {
				if(!m_cast[i].equals("")) {
					cast=m_cast[i];	
				}
			}else{
				if(!m_cast[i].equals("")) {
					cast=cast+", "+m_cast[i];	
				}
			}
		}
		//System.out.println("MovieUpdateProAction cast : "+ cast);
		String m_director = new String(multi.getParameter("m_director"));
		//System.out.println("MovieUpdateProAction m_director :" +  m_director);
		String m_video = new String(multi.getParameter("m_video"));
		//System.out.println("MovieUpdateProAction m_video : "+ m_video);
		// String filename1 = "";
		int result = 0;
		Enumeration en = multi.getFileNames();
		System.out.println("en ==>" + en);
		System.out.println("en.hasMoreElements() ==>" + en.hasMoreElements());
		
		// Image 수정 했을 때
		while(en.hasMoreElements()) {
			String filename1 = (String)en.nextElement(); // input 태그의 속성이 file인 name 속성값:패라미터이름
			System.out.println("1.filename1 ==>" + filename1);
			String filename = multi.getFilesystemName(filename1); // 서버에 저장된 파일이름
			System.out.println("1.filename ==>" + filename);
			// 실제 서버에 저장되지 않았다면
			// 실제 수정한게 없을 때 
			if (filename != null)  {
				if(filename1.equals("m_photo")) {
					System.out.println("2. filename1 m_photo setM_photo ==>" + filename);
					mt.setM_photo(filename);
				}
				if(filename1.equals("m_poster")) {
					System.out.println("2. filename1 setM_poster ==>" + filename);
					mt.setM_poster(filename);
				}
			}
		}
		mt.setM_name(m_name);
		mt.setM_genre(genre);
		mt.setM_date(m_date);
		mt.setM_nation(m_nation);
		mt.setM_time(m_time);
		mt.setM_rate(m_rate);
		mt.setM_story(m_story);
		mt.setM_cast(cast);
		mt.setM_director(m_director);
		mt.setM_video(m_video);
		mt.setId((String)session.getAttribute("id"));
		mt.setM_idx(m_idx);
		System.out.println("id : "+(String)session.getAttribute("id"));
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