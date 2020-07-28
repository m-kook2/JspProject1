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

public class MemberDao {
	private static MemberDao instance;

	private MemberDao() {
	}

	public static MemberDao getInstance() {
		if (instance == null) {
			instance = new MemberDao();
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

	public int insert(MemberDto memberVO) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		int number = 0;
		String sql1 = "select nvl(max(idx),0) from member";
		String sql = "insert into member values(?,?,?,?,?,?,sysdate,'N','0')";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				if (number == 0) {
					number = 1;
				}
			}
			rs.close();
			pstmt.close();

			if (number != 0) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberVO.getId());
				pstmt.setInt(2, number);
				pstmt.setString(3, memberVO.getPassword());
				pstmt.setString(4, memberVO.getEmail());
				pstmt.setString(5, memberVO.getNickname());
				pstmt.setString(6, memberVO.getGender());
				result = pstmt.executeUpdate();
				pstmt.close();
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
		return result;
	}

	public int idChk(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		String sql = "select count(id) as cnt from member where id='" + id + "'";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("cnt");
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
		return result;
	}

	public List<MemberDto> loginchk(String id, String passwd) throws SQLException {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<MemberDto> list = new ArrayList<MemberDto>();
		String sql = "SELECT * FROM MEMBER WHERE ID='" + id + "' AND PASSWORD='" + passwd + "' AND DEL_YN='N'";
		System.out.println(sql);
		try {
			conn = getConnection();
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			if (rs.next()) {
				MemberDto vo = new MemberDto();
				
				vo.setId(rs.getString("ID"));
				vo.setIdx(rs.getInt("IDX"));
				vo.setPassword(rs.getString("PASSWORD"));
				vo.setEmail(rs.getString("EMAIL"));
				vo.setNickname(rs.getString("NICKNAME"));
				vo.setGender(rs.getString("GENDER"));
				vo.setReg_date(rs.getString("REG_DATE"));
				vo.setDel_yn(rs.getString("DEL_YN"));
				vo.setStatus(rs.getString("STATUS"));
				list.add(vo);
			}
			rs.close();
			pstm.close();
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
	public int memUpdateForm(MemberDto memberDto) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update member set id=?, password=?," + " email=?, nickname=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDto.getId());
			pstmt.setString(2, memberDto.getPassword());
			pstmt.setString(3, memberDto.getEmail());
			pstmt.setString(4, memberDto.getNickname());
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