package service;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import dao.MemberDao;
import dao.MemberDto;
import util.FileUtil;
public class MemInsertAction implements CommandProcess {
	public String requestPro(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		String saveDirectory ="C:/Users/user/git/jspProject/ch16/WebContent/images/";
		MultipartRequest mp = new MultipartRequest(request, saveDirectory);
		String id = mp.getParameter("id");
		String password = mp.getParameter("password");
		String email = mp.getParameter("email");
		String nickname = mp.getParameter("nickname");
		String gender = mp.getParameter("gender");
		
		FileUtil fu = new FileUtil();
		fu.filUpload(request, saveDirectory);
		
		/*String id = request.getParameter("id");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		String gender = request.getParameter("gender");*/
		
		int result = 0;
		String filename ="";
		Enumeration en = mp.getFileNames();
		while(en.hasMoreElements()) {
			String filename1 = (String)en.nextElement(); 
			filename = mp.getFilesystemName(filename1); 
			}
		System.out.println("filename : "+filename+" , "+gender);
		MemberDto vo = new MemberDto();
		vo.setId(id);
		vo.setPassword(password);
		vo.setEmail(email);
		vo.setNickname(nickname);
		vo.setGender(gender);
		vo.setPic(filename);
		//vo.setFileName(filename);
		MemberDao mem = MemberDao.getInstance();
		
		try {
			result=mem.insert(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "member/memInsert.jsp";
	}
}