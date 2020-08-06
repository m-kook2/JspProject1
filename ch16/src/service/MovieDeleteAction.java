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
	 	String saveDirectory ="C:/개발프로그랜util/egovframework/3.7/eGovFrameDev-3.7.0-64bit/workspace/jspProject/ch16/WebContent/images/main/photo/"; 
	 	String gubun=StringUtil.NullToEmpty(request.getParameter("gubun"));
	 	String m_photo=StringUtil.NullToEmpty(request.getParameter("m_photo"));
	 	String m_poster=StringUtil.NullToEmpty(request.getParameter("m_poster"));
	 	String m_idx=StringUtil.NullToEmpty(request.getParameter("m_idx"));
	 	if(gubun.equals("photo")){
	 		fu.fileDelete(saveDirectory, m_photo);
	 	}
	 	if(gubun.equals("poster")){
	 		fu.fileDelete(saveDirectory, m_poster);
	 	}
	 	request.setAttribute("m_idx", m_idx);
		return "movie/movieUpdateForm.jsp";
	}
}