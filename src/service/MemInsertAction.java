package service;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import dao.MemberDao;
import dao.MemberDto;
import dao.MovieDto;
import util.FileUtil;
import util.StringUtil;
public class MemInsertAction implements CommandProcess {
	public String requestPro(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		System.out.println("---------------MemInsertAction----------------------");
		request.setCharacterEncoding("utf-8"); 
		response.setCharacterEncoding("utf-8");
		String saveDirectory =request.getServletContext().getRealPath("/images/member/img/");
		//String saveDirectory ="C:/개발프로그랜util/egovframework/3.7/eGovFrameDev-3.7.0-64bit/workspace/jspProject/ch16/WebContent/images/member/img/";
		MultipartRequest mp = new MultipartRequest(request, saveDirectory);
		String id = new String(mp.getParameter("id").getBytes("iso-8859-1"), "utf-8");
		String password = new String(mp.getParameter("password").getBytes("iso-8859-1"), "utf-8");
		String postcode = new String(mp.getParameter("postcode").getBytes("iso-8859-1"), "utf-8");
		String roadAddress = new String(mp.getParameter("roadAddress").getBytes("iso-8859-1"), "utf-8");
		String email = new String(mp.getParameter("email").getBytes("iso-8859-1"), "utf-8");
		String nickname = new String(mp.getParameter("nickname").getBytes("iso-8859-1"), "utf-8");
		String gender = new String(mp.getParameter("gender").getBytes("iso-8859-1"), "utf-8");
		
		FileUtil fu = new FileUtil();
		fu.filUpload(request, saveDirectory);
		
		/*String id = request.getParameter("id");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		String gender = request.getParameter("gender");*/
		
		int result = 0;
		String filename ="";
		String pic ="";
		//vo.setFileName(filename);
		Enumeration en = mp.getFileNames();
/*			String filename1 = (String)en.nextElement(); 
			filename = StringUtil.NullToEmpty(new String(mp.getFilesystemName(filename1).getBytes("iso-8859-1"), "utf-8"));
			if(!filename.equals(null)) {
			System.out.println("filename ==>" + filename);
			}else{
				vo.setPic(pic);
			}
			}*/
		while(en.hasMoreElements()) {
			String filename1 = (String)en.nextElement(); 
			pic=mp.getFilesystemName(filename1);
			}
		
		MemberDto vo = new MemberDto();
		vo.setId(id);
		vo.setPassword(password);
		vo.setZip(postcode);
		vo.setAddr(roadAddress);
		vo.setEmail(email);
		vo.setNickname(nickname);
		vo.setGender(gender);
		vo.setPic(new String(pic.getBytes("iso-8859-1"), "utf-8"));
		System.out.println("filename : "+filename+" , "+gender);
		MemberDao mem = MemberDao.getInstance();
		try {
			result=mem.insert(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "member/memInsert.jsp";
	}
}