package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CSDao {
	private static CSDao instance;
	private CSDao() {}
	public static CSDao getInstance() {
		if(instance == null) { instance = new CSDao(); }
		return instance;
	}
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) 
					ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
}
	public int getTotalCnt() throws SQLException {
		Connection conn = null;
		Statement pstmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from cs";
		try {
			conn = getConnection();
			pstmt = conn.createStatement();
			rs = pstmt.executeQuery(sql);
			if(rs.next()) tot = rs.getInt(1);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}	
		return tot;
	}
	public List<CSDto> list(int startRow, int endRow) throws SQLException {
		List<CSDto> list = new ArrayList<CSDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM ( select rownum rn, a.* "
				+ "from (select * from cs order by num) a ) "
				+ "WHERE rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CSDto cs = new CSDto();
					cs.setNum(rs.getInt("num"));
					cs.setWriter(rs.getString("writer"));
					cs.setSubject(rs.getString("subject"));
					cs.setReg_date(rs.getDate("reg_date"));
					list.add(cs);
			}
	} catch (Exception e) {
		System.out.println(e.getMessage());
	} finally {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
		return list;
	}
	
	public CSDto select(int num) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from cs where num=" + num;
		CSDto cs = new CSDto();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				cs.setNum(rs.getInt("num"));
				cs.setWriter(rs.getString("writer"));
				cs.setSubject(rs.getString("subject"));
				cs.setContent(rs.getString("content"));
				cs.setReg_date(rs.getDate("reg_date"));
			}	
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (conn != null) conn.close();
			if (stmt != null) stmt.close(); 
			if (rs != null) rs.close(); 
		}
		return cs;
	}
	public int insert(CSDto cs) throws SQLException {
		int num = cs.getNum();
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		String sql1 = "select nvl(max(num),0) from board";
		String sql = "insert into board values(?,?,?,?,?,sysdate)";
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			//num값을 setting
			int number = rs.getInt(1)+1;
			rs.close();
			pstmt.close();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, cs.getWriter());
			pstmt.setString(3, cs.getSubject());
			pstmt.setString(4, cs.getContent());
			pstmt.setString(5, cs.getPasswd());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (conn != null) conn.close();
			if (pstmt != null) pstmt.close(); 
			if(rs != null) rs.close();
		}
		return result;
	}
	
	
	
}