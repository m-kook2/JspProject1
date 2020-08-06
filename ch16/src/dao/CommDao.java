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

	// 댓글관리 전체카운트
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
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return tot;
	}

	// 댓글관리 목록조회
	public List<CommDto> commMngList(int startRow, int endRow) throws SQLException {
		List<CommDto> list = new ArrayList<CommDto>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "select * from (select rownum rn ,a.* from " + " (select * from comm) a ) "
				+ " where rn between ? and ?";
		System.out.println("sql : " + sql);
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
			if (rs != null)
				rs.close();
			if (pstm != null)
				pstm.close();
			if (conn != null)
				conn.close();
		}
		return list;
	}

	// 댓글 업데이트
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

		String sql = "Insert into comm values (?,?,?,0,0,?,sysdate,'N',?,0,0,null)";
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
			pstmt.setInt(4, comm.getC_grade());
			pstmt.setInt(5, comm.getM_idx());
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
	
	public int insert2(CommDto comm) throws SQLException {
		int c_idx = comm.getC_idx();
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		String sql1 = "select nvl(max(c_idx),0) from comm";

		String sql = "Insert into comm values (?,?,?,0,0,null,sysdate,'N',?,?,1,null)";
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
			pstmt.setInt(5, comm.getStep());
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
	
	public List<CommDto> list(int startRow, int endRow, String m_idx, String str) throws SQLException {
		List<CommDto> list = new ArrayList<CommDto>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		/*PreparedStatement pstmt2 = null;*/
		ResultSet rs = null;
		/*ResultSet rs2 = null;*/
		// String sql = "select * from board order by num desc";
		// mysql select * from board order by num desc limit startPage-1,10;
		String sql = "select * from (select * from (select rownum rn ,a.* from "
				+ " (select * from comm where m_idx = ? order by c_date desc) a )"
				+ " where rn between ? and ?) where 1=1 and dep=0";
		
		/*String sql2="select m_idx ,avg(c_grade) m_grade "
				+ "from comm  "
				+ "where m_idx = ? "
				+ "group by m_idx";*/
		
		StringBuffer buf=new StringBuffer();
		 System.out.println("sql : "+sql);
		 buf.append(sql);
		 if(str!=null && !str.equals("")) {
			 if(str.equals("1")) {
				 buf.append("	order by c_date desc");	 
			 }else if(str.equals("2")) {
				 buf.append("	order by c_sympathy desc");
			 }
			 else if(str.equals("3")) {
				 buf.append("	order by c_unsympathy desc");
			 }
			 
		 }
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(buf.toString());
			/*pstmt2 = conn.prepareStatement(sql2);*/
			pstmt.setString(1, m_idx);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			/*pstmt2.setString(1, m_idx);*/
			rs = pstmt.executeQuery();
			/*rs2= pstmt.executeQuery();*/
			while (rs.next()) {
				CommDto comm = new CommDto();
				comm.setC_idx(rs.getInt("c_idx"));
				comm.setId(rs.getString("id"));
				comm.setC_content(rs.getString("c_content"));
				comm.setC_sympathy(rs.getInt("c_sympathy"));
				comm.setC_unsympathy(rs.getInt("c_unsympathy"));
				comm.setC_grade(rs.getInt("c_grade"));
				comm.setC_date(rs.getDate("c_date"));
				comm.setDel_yn(rs.getString("del_yn"));
				comm.setM_idx(rs.getInt("m_idx"));
				comm.setStep(rs.getInt("step"));
				comm.setDep(rs.getInt("dep"));
				/*comm.setM_grade(rs2.getInt("m_grade"));*/
				list.add(comm);

			}
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
	
	public List<CommDto> list2(int startRow, int endRow, String m_idx, String str) throws SQLException {
		List<CommDto> list = new ArrayList<CommDto>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		/*PreparedStatement pstmt2 = null;*/
		ResultSet rs = null;
		/*ResultSet rs2 = null;*/
		// String sql = "select * from board order by num desc";
		// mysql select * from board order by num desc limit startPage-1,10;
		String sql = "select * from (select * from (select rownum rn ,a.* from "
				+ " (select * from comm where m_idx = ? order by c_idx desc) a )"
				+ " ) where 1=1 and dep=1";
		
		/*String sql2="select m_idx ,avg(c_grade) m_grade "
				+ "from comm  "
				+ "where m_idx = ? "
				+ "group by m_idx";*/
		
		StringBuffer buf=new StringBuffer();
		 System.out.println("sql : "+sql);
		 buf.append(sql);
		 if(str!=null && !str.equals("")) {
			 if(str.equals("1")) {
				 buf.append("	order by c_date desc");	 
			 }else if(str.equals("2")) {
				 buf.append("	order by c_sympathy desc");
			 }
			 else if(str.equals("3")) {
				 buf.append("	order by c_unsympathy desc");
			 }
			 
		 }
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(buf.toString());
			/*pstmt2 = conn.prepareStatement(sql2);*/
			pstmt.setString(1, m_idx);
			//pstmt.setInt(2, startRow);
			//pstmt.setInt(3, endRow);
			/*pstmt2.setString(1, m_idx);*/
			rs = pstmt.executeQuery();
			/*rs2= pstmt.executeQuery();*/
			while (rs.next()) {
				CommDto comm = new CommDto();
				comm.setC_idx(rs.getInt("c_idx"));
				comm.setId(rs.getString("id"));
				comm.setC_content(rs.getString("c_content"));
				comm.setC_sympathy(rs.getInt("c_sympathy"));
				comm.setC_unsympathy(rs.getInt("c_unsympathy"));
				comm.setC_grade(rs.getInt("c_grade"));
				comm.setC_date(rs.getDate("c_date"));
				comm.setDel_yn(rs.getString("del_yn"));
				comm.setM_idx(rs.getInt("m_idx"));
				comm.setStep(rs.getInt("step"));
				comm.setDep(rs.getInt("dep"));
				/*comm.setM_grade(rs2.getInt("m_grade"));*/
				list.add(comm);

			}
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

	public int delete(int c_idx) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "delete from comm where c_idx=? or step=? ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c_idx);
			pstmt.setInt(2, c_idx);
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

	public int supdate(int c_idx,String id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update comm set c_sympathy=c_sympathy+1, overlap = concat(overlap,?) where c_idx=?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, c_idx);
			result = pstmt.executeUpdate();
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public int uupdate(int c_idx, String id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update comm set c_unsympathy=c_unsympathy+1, overlap = concat(overlap,?,' ') where c_idx=?";
		System.out.println(sql);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id+"t");
			pstmt.setInt(2, c_idx);
			result = pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	public CommDto select(String m_idx) throws SQLException {
		CommDto cd = new CommDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		String sql = "select m_idx ,avg(c_grade) m_grade "
				+ "from comm  "
				+ "where m_idx = ? "
				+ "group by m_idx";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_idx);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cd.setM_idx(rs.getInt(1));
				cd.setM_grade(rs.getInt(2));
			}
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return cd;
	}

	public List<CommDto> commMngExcelDown() throws SQLException {
		List<CommDto> list = new ArrayList<CommDto>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "select * from comm";
		try {
			conn = getConnection();
			pstm = conn.prepareStatement(sql);
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
			if (rs != null)
				rs.close();
			if (pstm != null)
				pstm.close();
			if (conn != null)
				conn.close();
		}
		return list;
	}
	
	// 영화댓글 전체카운트
		public int getTotalCnt2(String m_idx) throws SQLException {
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			int tot = 0;
			String sql = "select count(*) from comm where m_idx="+m_idx+ "and dep = 0";
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
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			}
			return tot;
		}
		// 영화답글 전체카운트
		public int getTotalCnt3(String m_idx) throws SQLException {
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			int tot = 0;
			String sql = "select count(*) from comm where m_idx="+m_idx+ "and dep = 1";
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
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			}
			return tot;
		}
		public int sdelete(int c_idx) throws SQLException {
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
		
		public int chek(String id, int c_idx) throws SQLException {
			System.out.println("test 왔나?");
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs=null;
			int result=0;
			String sql = "select count(c_idx) as count from comm where c_idx = ? and overlap like ?";
			System.out.println(sql);
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, c_idx);
				pstmt.setString(2,"%"+id+"%");
				rs=pstmt.executeQuery();
				if(rs.next()) {
					result=rs.getInt(1);
					System.out.println(result);
				}
			
				System.out.println(result);
				pstmt.close();
				conn.close();
				rs.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return result;
		}
}
