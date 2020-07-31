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
	
	public int insert(CommDto comm) throws SQLException {
		int c_idx = comm.getC_idx();
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		String sql1 = "select nvl(max(c_idx),0) from comm";
	
		String sql = "Insert into comm values (?,?,?,0,0,0,sysdate,'n',?,0,0)";
		System.out.println("test insert" + sql);
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			// key인 num 1씩 증가, mysql auto_increment 또는 oracle sequence
			// sequence를 사용 : values(시퀀스명(board_seq).nextval,?,?...)
			int number = rs.getInt(1) + 1;
			rs.close();
			pstmt.close();
			System.out.println("number" + number);

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, comm.getId());
			pstmt.setString(3, comm.getC_content());
			pstmt.setInt(4, comm.getM_idx());
			result = pstmt.executeUpdate();
			System.out.println("result=" + result);
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
		return result;
	}
	
	public List<CommDto> list(int startRow, int endRow,String m_idx) throws SQLException {
		List<CommDto> list = new ArrayList<CommDto>();

		Connection conn = null;	PreparedStatement pstmt= null;
		ResultSet rs = null;
		// String sql = "select * from board order by num desc";
	// mysql select * from board order by num desc limit startPage-1,10;
		 String sql = "select * from (select rownum rn ,a.* from " + 
			" (select * from comm where m_idx = ? order by step desc,dep) a ) "+
			" where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_idx);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CommDto comm = new CommDto();
				comm.setC_idx(rs.getInt("c_idx"));
				comm.setId(rs.getString("id"));
				comm.setC_content(rs.getString("c_content"));
				comm.setC_sympathy(rs.getInt("c_sympathy"));
				comm.setC_unsympathy(rs.getInt("c_unsympathy"));
				comm.setC_grade(rs.getInt("c_grade"));
				comm.setDate(rs.getString("c_date"));
				comm.setDel_yn(rs.getString("del_yn"));
				comm.setM_idx(rs.getInt("m_idx"));
				comm.setStep(rs.getInt("step"));
				comm.setDep(rs.getInt("dep"));
				list.add(comm);				
				
			}
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return list;
	}
	

	public int delete(int c_idx) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "delete from comm where c_idx=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c_idx);
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}
	
	
	
	
	
	
	
}
