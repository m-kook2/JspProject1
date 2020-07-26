package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemChangeDAO {
	private static MemChangeDAO instance;

	/*
	 * private MemberChangeDAO() { }
	 */
	/*
	 * public static MemberChangeDAO getInstance() { if (instance == null) {
	 * instance = new MemberChangeDAO(); } return instance; }
	 */

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

	/*public List<MemChangeVO> memChange(String id){
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<MemberVO> list = new ArrayList<MemberVO>();
		String sql="update member from where id='\" + id + \"' and password";
		System.out.println(sql);
		try {
			conn = getConnection();
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
		}
		return list;
	}*/
}
