package service;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.Board;
import dao.BoardDao;
public class LoginFormAction implements CommandProcess {
	public String requestPro(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {	
		return "/login/loginForm.jsp";
	}
}