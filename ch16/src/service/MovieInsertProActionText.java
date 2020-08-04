package service;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.MemberDto;
public class MovieInsertProActionText implements CommandProcess {
	public String requestPro(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		try { 
				String name[]=request.getParameterValues("c_idx");
				for(int i=0; i< name.length; i++) {
					System.out.println(name[i]);	
				}
				
			
		} catch(Exception e) { System.out.println(e.getMessage()); }
		return "mng/memMng.jsp";
	}
}