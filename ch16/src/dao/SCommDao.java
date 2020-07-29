package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SCommDao {
  private static SCommDao instance;

  private SCommDao() {}

  public static SCommDao getInstance() {
    if (instance == null) {
      instance = new SCommDao();
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

  public int getSurCnt(int s_idx) throws SQLException {
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    int sCnt = 0;
    String sql = "select count(*) from sur where s_idx = " + s_idx;
    try {
      conn = getConnection();
      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);
      if (rs.next())
        sCnt = rs.getInt(1);
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

    return sCnt;
  }
}


