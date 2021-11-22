/*
 * Copyright(C) 2021,  VinhNMHE140137
 * J3.L.P0061
 * OrderList
 *
 * Record of change:
 * DATE           Version    AUTHOR                   DESCRIPTION
 * 22/10/2021      1.0       VinhNM    
 */
package dao.impl;

import context.DBContext;
import dao.ServiceDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import entity.Service;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * This class has methods for retrieving data from serviceOrderd tables and
 * service in database. The method will return an object of the class
 * <code>java.lang.Exception</code> when there is any error querying the data.
 * <br>
 * Bugs: None
 *
 * @author VinhNM
 */
public class ServiceDAOImpl extends DBContext implements ServiceDAO {

    /**
     * Get list Service from serviceOrderd table in database. The result contains 
     * a list of <code>Service</code> objects with id, name, price, quantity
     *
     * @param id is id of order. It is an int number
     * @return a list of <code>Service</code> objects. It is a
     * <code>java.util.ArrayList</code> object
     * @throws java.lang.Exception
     */
    @Override
    public ArrayList<Service> getService(int id) throws Exception {
        String sql = "select ROW_NUMBER() OVER (ORDER BY s.id) as stt, s.[name],s.price, so.quantity from [service] s\n"
                + "join serviceOrderd so on s.id = so.idService\n"
                + "where so.idOrder = ?";
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            ArrayList<Service> service = new ArrayList<>();
            while (rs.next()) {
                Service s = new Service();
                s.setNumberOrder(rs.getInt("stt"));
                s.setName(rs.getString("name"));
                s.setPrice(rs.getInt("price"));
                s.setQuantity(rs.getInt("quantity"));
                service.add(s);
            }
            return service;
        } catch (Exception e) {
            Logger.getLogger(ServiceDAOImpl.class.getName()).log(Level.SEVERE, null, e);
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(connection);
        }
    }

    /**
     * Get the total amount to pay for service. The result is an int number
     *
     * @param id is id of order. It is an int number
     * @return an int number
     * @throws java.lang.Exception
     */
    @Override
    public int getTotalMoneyService(int id) throws Exception {
        String sql = "select SUM(f.price * fo.quantity) as totalMoneyService from [Service] f\n"
                + "join serviceOrderd fo on f.id = fo.idService\n"
                + "where fo.idOrder = ?";
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                int totalMoneyService = rs.getInt("totalMoneyService");
                return totalMoneyService;
            }
            return 0;
        } catch (Exception e) {
            Logger.getLogger(ServiceDAOImpl.class.getName()).log(Level.SEVERE, null, e);
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(connection);
        }
    }

}
