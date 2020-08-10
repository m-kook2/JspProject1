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

public class MemMngUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MemberDao mem = MemberDao.getInstance();
		String saveDirectory = request.getServletContext().getRealPath("/images/member/img/");
		MultipartRequest mp = new MultipartRequest(request, saveDirectory);
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String id = mp.getParameter("id");
		String password = mp.getParameter("password");
		String email = mp.getParameter("email");
		String nickname = mp.getParameter("nickname");
		String pic = mp.getParameter("pic");
		String zip = mp.getParameter("zip");
		String addr = new String(mp.getParameter("addr").getBytes("iso-8859-1"), "utf-8");
		String gender = new String(mp.getParameter("gender").getBytes("iso-8859-1"), "utf-8");
		String status = mp.getParameter("status");
		String del_yn = mp.getParameter("del_yn");
		FileUtil fu = new FileUtil();
		
		String filename = "";
		int result = 0;
		fu.fileDelete(saveDirectory, pic);
		fu.filUpload(request, saveDirectory);
		Enumeration en = mp.getFileNames();
		while(en.hasMoreElements()) {
			String filename1 = (String)en.nextElement(); 
			filename = mp.getFilesystemName(filename1); 
		}
		/*String id = request.getParameter("id");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		String pic = request.getParameter("pic");
		String zip = request.getParameter("zip");
		String addr = request.getParameter("addr");
		String gender = request.getParameter("gender");
		String status = request.getParameter("status");
		String del_yn = request.getParameter("del_yn");*/
		
		System.out.println("id : " + id + ", " + password + ", " + email + ", " + nickname + "," + gender+","+ zip+","+addr+","+pic);
		MemberDto dto = new MemberDto();
		dto.setId(id);
		dto.setPassword(password);
		dto.setEmail(email);
		dto.setNickname(nickname);
		dto.setZip(zip);
		dto.setPic(filename);
		dto.setAddr(addr);
		dto.setGender(gender);
		dto.setStatus(status);
		dto.setDel_yn(del_yn);
		mem = MemberDao.getInstance();
		try {
			result = mem.memMngUpdate(dto);
			if(result==1){
				request.setAttribute("result", id);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "mng/memMngUpdatePro.jsp";
	}

}
