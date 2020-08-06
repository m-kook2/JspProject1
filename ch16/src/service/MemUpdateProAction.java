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
import util.FileUtil;
import util.StringUtil;

public class MemUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDao mem = MemberDao.getInstance();
		String saveDirectory = "C:/개발프로그랜util/egovframework/3.7/eGovFrameDev-3.7.0-64bit/workspace/jspProject/ch16/WebContent/images/member/img/";
		MultipartRequest mp = new MultipartRequest(request, saveDirectory);
		String id = (String) session.getAttribute("id");
		String password = StringUtil.NullToEmpty(mp.getParameter("chkpassword"));
		String zip = mp.getParameter("zip");
		String addr = mp.getParameter("addr");
		String email = StringUtil.NullToEmpty(mp.getParameter("email"));
		String nickname = StringUtil.NullToEmpty(mp.getParameter("nickname"));
		String gender = StringUtil.NullToEmpty(mp.getParameter("gender"));
		String pic = StringUtil.NullToEmpty(mp.getParameter("pic"));
		FileUtil fu = new FileUtil();
		if(!pic.equals("")) {
			try {
				int result=mem.memUpdatePic(id);
				if(result!=0) {
					fu.fileDelete(saveDirectory, pic);
					fu.filUpload(request, saveDirectory);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/*String id = request.getParameter("id");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		String gender = request.getParameter("gender");*/
		System.out.println("id : " + id + ", " + password + ", " + email + ", " + nickname + "," + gender+","+ zip+","+addr);
		int result = 0;
		String filename ="";
		Enumeration en = mp.getFileNames();
		while(en.hasMoreElements()) {
			String filename1 = (String)en.nextElement(); 
			filename = mp.getFilesystemName(filename1); 
		}
		MemberDto vo = new MemberDto();
		vo.setId(id);
		vo.setPassword(password);
		vo.setZip(zip);
		vo.setAddr(addr);
		vo.setEmail(email);
		vo.setNickname(nickname);
		vo.setGender(gender);
		vo.setPic(filename);

		
		try {
			result = mem.memUpdateForm(vo);
			if (result == 1) {
				session.setAttribute("email", email);
				session.setAttribute("nickname", nickname);
				session.setAttribute("zip", zip);
				session.setAttribute("addr", addr);
				session.setAttribute("gender", gender);
				session.setAttribute("pic", filename);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "member/memUpdatePro.jsp";
	}

}
