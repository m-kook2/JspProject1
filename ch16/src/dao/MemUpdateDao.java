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

public class MemUpdateDao {
	private static MemUpdateDao instance;
	
	private void MemberDao() {
		
	}
	public static MemUpdateDao getInstance() {
		if(instance == null) {
			instance = new MemUpdateDao();
		}
		return instance;
	}
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
			int result = 0;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	public int memUpdateForm(String id, String password, String email, String nickname) throws SQLException{
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int result = 0;
		List<MemberDto> list = new ArrayList<MemberDto>();
		String sql = "update member set id != '"+id+"',set password !='"+password+"', set email'"+email+"',set nickname'"+nickname+"' ";
		try {
			conn = getConnection();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, id);
			pstm.setString(2, password);
			pstm.setString(3, email);
			pstm.setString(4, nickname);
			
			result  = pstm.executeUpdate();
		} catch (Exception e){
			System.out.println();
		}finally {
			if (pstm != null) pstm.close();
			if (conn !=null) conn.close();
		}
		return 0;
	}
}
