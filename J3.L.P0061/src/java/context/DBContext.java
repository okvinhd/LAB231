/*
 * Copyright(C) 2021,  VinhNMHE140137
 * J3.L.P0061
 * OrderList
 *
 * Record of change:
 * DATE           Version    AUTHOR                   DESCRIPTION
 * 22/10/2021      1.0       VinhNM    Get data from context.xml and connect database or close connect
 */
package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 * Connect with the database Close all of connection
 * <p>
 * Bugs: None
 *
 * @author VinhNM
 */
public class DBContext {

    private InitialContext initial;
    private Context connection;
    private String databaseName;
    private String serverName;
    private String portNumber;
    private String userName;
    private String passWord;

    /**
     * To get value from context file
     */
    public DBContext() {
        try {
            initial = new InitialContext();
            Object obj = initial.lookup("java:comp/env");
            connection = (Context) obj;
            serverName = connection.lookup("serverName").toString();
            databaseName = connection.lookup("dbName").toString();
            portNumber = connection.lookup("portNumber").toString();
            userName = connection.lookup("username").toString();
            passWord = connection.lookup("password").toString();
        } catch (NamingException e) {
             Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    /**
     * To connect with the database
     *
     * @return a connection to given database URL
     * @throws Exception
     */
    public Connection getConnection() throws Exception {
        String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + databaseName;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userName, passWord);
    }

    /**
     * Close ResultSet
     *
     * @param rs is the ResultSet. It is a <code>java.sql.ResultSet</code>
     * object object
     * @throws SQLException
     */
    public void closeResultSet(ResultSet rs) throws SQLException {
        if (rs != null && !rs.isClosed()) {
            rs.close();
        }
    }

    /**
     * Close Prepared Statement
     *
     * @param ps is the PreparedStatement. It is a
     * <code>java.sql.PreparedStatement</code> object
     * @throws SQLException
     */
    public void closePreparedStatement(PreparedStatement ps) throws SQLException {
        if (ps != null && !ps.isClosed()) {
            ps.close();
        }
    }

    /**
     * Close Connection
     *
     * @param con the Connection. It is a <code>java.sql.Connection</code>
     * object
     * @throws SQLException
     */
    public void closeConnection(Connection con) throws SQLException {
        if (con != null && !con.isClosed()) {
            con.close();
        }
    }
}
