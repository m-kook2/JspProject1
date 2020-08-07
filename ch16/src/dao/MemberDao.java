package dao;

import java.nio.Buffer;
import java.sql.CallableStatement;
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

import oracle.jdbc.internal.OracleTypes;
import oracle.jdbc.oracore.OracleType;

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
		String sql = "insert into member values(?,?,?,?,?,?,sysdate,'N','1',?,?,?)";
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
				pstmt.setString(7, memberVO.getPic());
				pstmt.setString(8, memberVO.getZip());
				pstmt.setString(9, memberVO.getAddr());
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
		String sql = "select count(id) as cnt from member where id=?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
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
		String sql = "SELECT * FROM MEMBER WHERE ID=? AND PASSWORD=? AND DEL_YN='N'";
		// ?로 표기해서 값받기.
		System.out.println(sql);
		try {
			conn = getConnection();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, id);
			pstm.setString(2, passwd);
			rs = pstm.executeQuery();
			if (rs.next()) {
				MemberDto vo = new MemberDto();

				vo.setId(rs.getString("ID"));
				vo.setIdx(rs.getInt("IDX"));
				vo.setPassword(rs.getString("PASSWORD"));
				vo.setZip(rs.getString("ZIP"));
				vo.setAddr(rs.getString("ADDR"));
				vo.setEmail(rs.getString("EMAIL"));
				vo.setNickname(rs.getString("NICKNAME"));
				vo.setGender(rs.getString("GENDER"));
				vo.setReg_date(rs.getString("REG_DATE"));
				vo.setDel_yn(rs.getString("DEL_YN"));
				vo.setStatus(rs.getString("STATUS"));
				vo.setPic(rs.getString("PIC"));
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
	
	public int memUpdatePic(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update member set pic='' where id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
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
	
	public int memUpdateForm(MemberDto memberDto) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update member set email=?, nickname=?, pic=?, zip=?, addr=? where id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDto.getEmail());
			pstmt.setString(2, memberDto.getNickname());
			pstmt.setString(3, memberDto.getPic());
			pstmt.setString(4, memberDto.getZip());
			pstmt.setString(5, memberDto.getAddr());
			pstmt.setString(6, memberDto.getId());
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

	public int getTotalCnt() throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from member";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next())
				tot = rs.getInt(1);
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

	public List<MemberDto> memMng(int startRow, int endRow) throws SQLException {
		List<MemberDto> list = new ArrayList<MemberDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		CallableStatement cstmt = null;
		String sqlId="";
		ResultSet rs = null;
		
		// String sql = "select * from board order by num desc";
		// mysql select * from board order by num desc limit startPage-1,10;
		String sql = "select * from (select rownum rn ,a.* from " + " (select * from member ) a ) where 1=1 "
				+ " and rn between ? and ?  ";
		StringBuffer bur=new StringBuffer();
		
		bur.append(sql);
		bur.append(sqlId);
		System.out.println(bur.toString());
		try {
			String pro="{call mem_order_by(?,?)}";
			conn = getConnection();
			cstmt = conn.prepareCall(pro);
			cstmt.setString(1, "id");//정렬할 컬럼명
			cstmt.registerOutParameter(2, OracleTypes.VARCHAR);//프로시저 OUT으로 값을 받는다.
			cstmt.execute();
			sqlId=cstmt.getString(2);
			cstmt.close();
			pstmt = conn.prepareStatement(bur.toString());
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberDto dto = new MemberDto();
				dto.setId(rs.getString("ID"));
				dto.setIdx(rs.getInt("IDX"));
				dto.setPassword(rs.getString("PASSWORD"));
				dto.setEmail(rs.getString("EMAIL"));
				dto.setNickname(rs.getString("NICKNAME"));
				dto.setZip(rs.getString("ZIP"));
				dto.setAddr(rs.getString("ADDR"));
				dto.setGender(rs.getString("GENDER"));
				dto.setReg_date(rs.getString("REG_DATE"));
				dto.setDel_yn(rs.getString("DEL_YN"));
				dto.setStatus(rs.getString("STATUS"));
				list.add(dto);
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

	public MemberDto memMngView(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MemberDto dto = new MemberDto();
		String sql = "select * from member where id=? ";
		try {
			conn = getConnection();
			if (id != null)
				pstm = conn.prepareStatement(sql);
			pstm.setString(1, id);
			rs = pstm.executeQuery();
			while (rs.next()) {
				dto.setId(rs.getString("ID"));
				dto.setIdx(rs.getInt("IDX"));
				dto.setPassword(rs.getString("PASSWORD"));
				dto.setEmail(rs.getString("EMAIL"));
				dto.setNickname(rs.getString("NICKNAME"));
				dto.setZip(rs.getString("ZIP"));
				dto.setAddr(rs.getString("ADDR"));
				dto.setGender(rs.getString("GENDER"));
				dto.setReg_date(rs.getString("REG_DATE"));
				dto.setDel_yn(rs.getString("DEL_YN"));
				dto.setStatus(rs.getString("STATUS"));
				dto.setPic(rs.getString("PIC")); 
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
		return dto;
	}

	public int memMngUpdate(MemberDto memberDto) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update member set email=?, nickname=?, gender=?, status=?, del_yn=?, pic=?, zip=?, addr=? where id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDto.getEmail());
			pstmt.setString(2, memberDto.getNickname());
			pstmt.setString(3, memberDto.getGender());
			pstmt.setString(4, memberDto.getStatus());
			pstmt.setString(5, memberDto.getDel_yn());
			pstmt.setString(6, memberDto.getPic());
			pstmt.setString(7, memberDto.getZip());
			pstmt.setString(8, memberDto.getAddr());
			pstmt.setString(9, memberDto.getId());
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

	public int delete(String id, String password) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update member set del_yn = 'Y'  where id = ? and password=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			result = pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	public List<MemberDto> memMngExcelDown() throws SQLException {
		List<MemberDto> list = new ArrayList<MemberDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberDto dto = new MemberDto();
				dto.setId(rs.getString("ID"));
				dto.setIdx(rs.getInt("IDX"));
				dto.setPassword(rs.getString("PASSWORD"));
				dto.setEmail(rs.getString("EMAIL"));
				dto.setNickname(rs.getString("NICKNAME"));
				dto.setGender(rs.getString("GENDER"));
				dto.setReg_date(rs.getString("REG_DATE"));
				dto.setDel_yn(rs.getString("DEL_YN"));
				dto.setStatus(rs.getString("STATUS"));
				list.add(dto);
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
	public String findId(String email) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String id = "";
		String sql = "select id from member where email = ?";
		System.out.println(email);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()){
				id=rs.getString("id");
			}
			System.out.println("id-----"+id);
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
		return id;
	}
	public String findPw(String id, String email) throws SQLException{
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String DBpw = "";
		/*select password from member where id = 'hongil2' and email ='email2@gmail.com';*/
		String sql = "select password from member where id = ? and email = ? ";
		System.out.println("MemberDao findPw sql->"+ sql);
		System.out.println("MemberDao findPw id->"+ id);
		System.out.println("MemberDao findPw email->"+ email);
		try {
				conn = getConnection();
				System.out.println(sql);
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, id);
				pstm.setString(2, email);
				rs = pstm.executeQuery();
				while(rs.next()) {
					DBpw=rs.getString("password");
					System.out.println("MemberDao findPw DBpw->"+ DBpw);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(rs != null) rs.close();
			if(pstm  != null)rs.close();
			if(conn != null)rs.close();
		}
		return DBpw;
	}
	
}