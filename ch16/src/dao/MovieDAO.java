package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MovieDAO {
	private static MovieDAO instance;

	private MovieDAO() {
	}

	public static MovieDAO getInstance() {
		if (instance == null) {
			instance = new MovieDAO();
		}
		return instance;
	}

	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	public List<SearchVO> selectMovie(String name) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<SearchVO> list = new ArrayList<SearchVO>();
		String sql = "SELECT M_IDX, M_NAME FROM MOVIE_BOARD WHERE M_NAME LIKE '%"+name+"%'";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				SearchVO vo=new SearchVO();
				vo.setM_idx(rs.getString("M_IDX"));
				vo.setName(rs.getString("M_NAME"));
				list.add(vo);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return list;
	}
}
