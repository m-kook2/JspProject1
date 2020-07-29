package service;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MovieDto;
public class MainAction implements CommandProcess {
	public String requestPro(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		/*MovieDao dao=MovieDao.getInstance();
		try {
			List<MovieDto> list=dao.selectMovie();
			request.setAttribute("list", list);
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
		return "main/main.jsp";
	}
}