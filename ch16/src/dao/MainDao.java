package dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.sql.*;
import javax.naming.*;

public class MainDao {
	private static MainDao instance;
	private MainDao() {}
	public static MainDao getInstance() {
		if (instance == null) {	instance = new MainDao();		}
		return instance;
	}
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)
				ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch(Exception e) { System.out.println(e.getMessage());	}
		return conn;
	}
	
	
		public List<MovieDto> list() throws SQLException {
		List<MovieDto> list = new ArrayList<MovieDto>();
		Connection conn = null;	PreparedStatement pstmt= null;
		ResultSet rs = null;
		 String sql = "select * from movie_info where del_yn='N'";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MovieDto movieDto = new MovieDto();
				movieDto.setM_idx(rs.getString("m_idx"));
				movieDto.setM_name(rs.getString("m_name"));
				movieDto.setM_genre(rs.getString("m_genre"));
				movieDto.setM_date(rs.getString("m_date"));
				movieDto.setM_nation(rs.getString("m_nation"));
				movieDto.setM_time(rs.getString("m_time"));
				movieDto.setM_rate(rs.getString("m_rate"));
				movieDto.setM_story(rs.getString("m_story"));
				movieDto.setM_cast(rs.getString("m_cast"));
				movieDto.setM_director(rs.getString("m_director"));
				movieDto.setM_photo(rs.getString("m_photo"));
				movieDto.setM_video(rs.getString("m_video"));
				movieDto.setM_poster(rs.getString("m_poster"));
				movieDto.setId(rs.getString("id"));
				list.add(movieDto);
			}
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return list;
	}

}