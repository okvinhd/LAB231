/*
 * Copyright(C) 2021,  VinhNMHE140137
 * J3.L.P0063
 * ServiceList
 *
 * Record of change:
 * DATE           Version    AUTHOR                   DESCRIPTION
 * 21/10/2021      1.0       VinhNM   
 */
package dao.impl;

import context.DBContext;
import dao.TypeServiceDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import entity.TypeService;

/**
 *
 * @author VinhNM
 */
public class TypeServiceDAOImpl extends DBContext implements TypeServiceDAO{
    /**
     * Get list type service from typeService table in database. The result
     * contains a list of <code>TypeService</code> objects with id, name
     *
     * @return a list of <code>TypeService</code> objects. It is a
     * <code>java.util.ArrayList</code> object
     * @throws java.lang.Exception
     */
    @Override
    public ArrayList<TypeService> getAllTypeService() throws Exception {
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "select * from typeService";
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            ArrayList<TypeService> allType = new ArrayList<>();
            while (rs.next()) {
                TypeService ts = new TypeService();
                ts.setId(rs.getInt("id"));
                ts.setName(rs.getString("name"));
                allType.add(ts);
            }
            return allType;
        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(connection);
        }
    }
}
