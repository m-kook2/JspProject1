package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MainDao;
import dao.MemberDao;
import dao.MemberDto;
import dao.MovieDao;
import dao.MovieDto;
import dao.ReviewDao;
import dao.ReviewDto;

public class MovieInsertFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		return "movie/movieInsertForm.jsp";
	}
}