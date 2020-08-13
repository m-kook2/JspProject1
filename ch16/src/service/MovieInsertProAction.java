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
		
		// (포토, 포스터에 사용할)파일 크기 정하고(유저 초고용량 파일 업로드 시 사버 다운 등 문제 사전 방지)
		int maxSize = 5*1024*1024;
		// 경로 정하고
		String fileSave = "/images/main/photo";
		//ID 값 받기 위해서.
	 	HttpSession session = request.getSession();
		String realPath = request.getSession().getServletContext().getRealPath(fileSave);
//	 	String saveDirectory =request.getServletContext().getRealPath("/images/main/photo/");
//	 	MultipartRequest mp = new MultipartRequest(request, saveDirectory);

		// 파일 업로드. 폼에서 가져온 인자값을 얻기 위해(request 객체 전달, 업로드 경로, 파일 최대 크기, 한글처리(utf-8), 파일 중복처리)
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize,"utf-8", new DefaultFileRenamePolicy());
		
		//값 받아올 때, getParameter를 MultipartRequest 통해서 값 넣어줌. 
		String m_name = multi.getParameter("m_name");

		// 배열은 getParameterValues로 받고서, 
		String[] m_genre = multi.getParameterValues("m_genre");
		System.out.println("m_name : "+m_name);
		//for문 통해서 , 로 String으로 저장한다. / setM_genre은 genre값 넣어줌(m_genre 아님.) 
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

	 	// input 출연진 name=m_cast1로 설정함.
	 	String[] m_cast = multi.getParameterValues("m_cast1");
		String cast="";
		for(int i=0; i< m_cast.length; i++) {
			// 값이 없을 때,
			if(cast.equals("")) {
				if(!m_cast[i].equals("")) {
					cast=m_cast[i];	
				}
				// 값이 있을 때,
			}else{
				if(!m_cast[i].equals("")) {
					cast=cast+","+m_cast[i];	
				}
			}
		}
	 	String m_director = multi.getParameter("m_director");
	 	
	 	//포토 및 포스터 null값 방지하기 위해서 ""; 값 반영함. 
	 	String m_photo = "";
	 	String m_video = multi.getParameter("m_video");
	 	String m_poster = "";
	 	String id = multi.getParameter("id");

/*	 	FileUtil fu = new FileUtil();*/
		int result = 0;

/*		Enumeration 인터페이스 정리
		Enumeration 인터페이스는 객체들의 집합(Vector)에서 각각의 객체들을 한순간에 하나씩 처리할 수 있는 메소드를 제공하는 켈렉션이다.*/

/*		* Enumeration 인터페이스 메소드
		boolean hasMoreElements() : Vector로 부터 생성된 Enumeration의 요소가 있으면 true, 아니면 false 반환
		Object nextElement() : Enumeration 내의 다음 요소를 반환한다. */

/*		* getFileNames() 메소드
	    Enumeration files = multi.getFileNames();
	    getFileNames() 메소드는 폼 요소 중 input 태그에서 file 속성으로 지정된 태그의 name 속성의
	    값, 즉 file 속성을 가진 파라미터의 이름을 Enumeration 객체 타입으로 반환한다. 예를 들면,
	    <input type="file" name="uploadFile"> 태그가 폼 요소에 있었다면 getFileNames() 메소드는
	    uploadFile이란 파라미터의 이름을 저장한 Enumeration 객체를 반환한다.
		출처: https://hyeonstorage.tistory.com/210 [개발이 하고 싶어요] */

		/*nextElement()는 현재 커서가 가리키고 있는 데이타-객체(Object)-를 리턴해주고 커서의 위치를 다음 칸으로 옮깁니다..
		맨처음 nextElement()를 실행하면 값은 첫번째 객체가 리턴되고 실행 후의 커서는 첫번째 데이타를 지나 두번째 데이타가 있는 곳을 가리키게 되죠...*/

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