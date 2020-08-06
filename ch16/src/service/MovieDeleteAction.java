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
import util.StringUtil;

public class MovieDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	 	FileUtil fu=new FileUtil();
	 	String saveDirectory ="C:/Users/user/git/jspProject/ch16/WebContent/images/main/photo/"; 
	 	String gubun=StringUtil.NullToEmpty(request.getParameter("gubun"));
	 	String m_photo=StringUtil.NullToEmpty(request.getParameter("m_photo"));
	 	String m_poster=StringUtil.NullToEmpty(request.getParameter("m_poster"));
	 	String m_idx=StringUtil.NullToEmpty(request.getParameter("m_idx"));
	 	MovieDto dto=new MovieDto();
	 	if(gubun.equals("photo")){
	 		fu.fileDelete(saveDirectory, m_photo);
	 		m_photo="";
	 		dto.setM_photo(m_photo);
	 		dto.setM_poster(m_poster);
	 		System.out.println("1 : "+m_photo+", "+m_poster);
	 	}
	 	if(gubun.equals("poster")){
	 		fu.fileDelete(saveDirectory, m_poster);
	 		m_poster="";
	 		dto.setM_photo(m_photo);
	 		dto.setM_poster(m_poster);
	 		System.out.println("2 : "+m_photo+", "+m_poster);
	 	}
	 	dto.setM_idx(m_idx);
	 	MovieDao dao=MovieDao.getInstance();
	 	int result=0;
	 	try {
	 		result=dao.imgUpdate(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	 	request.setAttribute("m_idx", m_idx);
	 	request.setAttribute("result", result);
		return "movie/movieDelete.jsp";
	}
}