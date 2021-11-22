/*
 * Copyright(C) 2021,  VinhNMHE140137
 * J3.L.P0067
 * Dishes Management
 *
 * Record of change:
 * DATE           Version    AUTHOR                   DESCRIPTION
 * 21/10/2021      1.0       VinhNM   
 */
package dao.impl;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import entity.TypeFood;
import dao.TypeFoodDAO;

/**
 *
 * @author VinhNM
 */
public class TypeFoodDAOImpl extends DBContext implements TypeFoodDAO{
    /**
     * Get list type service from typeService table in database. The result
     * contains a list of <code>TypeFood</code> objects with id, name
     *
     * @return a list of <code>TypeFood</code> objects. It is a
     * <code>java.util.ArrayList</code> object
     * @throws java.lang.Exception
     */
    @Override
    public ArrayList<TypeFood> getAllTypeService() throws Exception {
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "select * from typeService";
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            ArrayList<TypeFood> allType = new ArrayList<>();
            while (rs.next()) {
                TypeFood ts = new TypeFood();
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
