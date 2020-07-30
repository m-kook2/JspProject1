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

public class CommDao {
	private static CommDao instance;

	private CommDao() {
	}

	public static CommDao getInstance() {
		if (instance == null) {
			instance = new CommDao();
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
	//댓글관리 전체카운트
	public int getTotalCnt() throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from comm";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				tot = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(rs !=null) rs.close();
			if(stmt !=null) stmt.close();
			if(conn !=null) conn.close();
		}
		 return tot;
	}
	
	//댓글관리 목록조회
	public List<CommDto> commMngList(int startRow, int endRow) throws SQLException {
		List<CommDto> list = new ArrayList<CommDto>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "select * from (select rownum rn ,a.* from " + 
				" (select * from comm) a ) "+
				" where rn between ? and ?";
		System.out.println("sql : "+sql);
		try {
			conn = getConnection();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, startRow);
			pstm.setInt(2, endRow);
			rs = pstm.executeQuery();
			while (rs.next()) {
				CommDto dto = new CommDto();
				dto.setC_idx(rs.getInt("c_idx"));
				dto.setId(rs.getString("id"));
				dto.setC_content(rs.getString("c_content"));
				dto.setC_sympathy(rs.getInt("c_sympathy"));
				dto.setC_unsympathy(rs.getInt("c_unsympathy"));
				dto.setC_grade(rs.getInt("c_grade"));
				dto.setDate(rs.getString("c_date"));
				dto.setDel_yn(rs.getString("del_yn"));
				dto.setM_idx(rs.getInt("m_idx"));
				dto.setStep(rs.getInt("step"));
				dto.setDep(rs.getInt("dep"));
				list.add(dto);				
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(rs!=null) rs.close();
			if(pstm!=null) pstm.close();
			if(conn!=null) conn.close();
		}
		return list;
	}
	//댓글 업데이트
	public int update(String del_yn, int idx) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update comm set del_yn=? where c_idx=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, del_yn);
			pstmt.setInt(2, idx);
			result = pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
}
