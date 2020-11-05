package service;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

public class IdChkAction{
	public void idChk(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		 String id=request.getParameter("id");
		 MemberDao dao=MemberDao.getInstance();
		 int result;
		try {
			result = dao.idChk(id);
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			if(result!=0){
				out.print("사용불가");
			}else{
				out.print("사용가능");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}