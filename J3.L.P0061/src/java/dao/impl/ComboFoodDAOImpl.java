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
import dao.ComboFoodDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import entity.ComboFood;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * This class has methods for retrieving data from comboFoodOrderd tables and
 * comboFood in database. The method will return an object of the class
 * <code> java.lang.Exception</code> when there is any error querying the data.
 * <br>
 * Bugs: None
 *
 * @author VinhNM
 */
public class ComboFoodDAOImpl extends DBContext implements ComboFoodDAO {
    
    /**
     * Get list ComboFood from comboFoodOrderd table in database. The result
     * contains a list of <code>ComboFood</code> objects with id, name, price,
     * quantity
     *
     * @param id is id of order. It is an int number
     * @return a list of <code>ComboFood</code> objects. It is a
     * <code>java.util.ArrayList</code> object
     * @throws java.lang.Exception
     */
    @Override
    public ArrayList<ComboFood> getComboFood(int id) throws Exception {
        String sql = "select ROW_NUMBER() OVER (ORDER BY cf.id) as stt, cf.nameComboFood,cf.price, cfo.quantity from comboFood cf\n"
                + "join comboFoodOrderd cfo on cf.id = cfo.idComboFood\n"
                + "where cfo.idOrder = ?";
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            ArrayList<ComboFood> comboFood = new ArrayList<>();
            while (rs.next()) {
                ComboFood cf = new ComboFood();
                cf.setNumberOrder(rs.getInt("stt"));
                cf.setName(rs.getString("nameComboFood"));
                cf.setPrice(rs.getInt("price"));
                cf.setQuantity(rs.getInt("quantity"));
                comboFood.add(cf);
            }
            return comboFood;
        } catch (Exception e) {
            Logger.getLogger(ComboFoodDAOImpl.class.getName()).log(Level.SEVERE, null, e);
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(connection);
        }
    }
    
    /**
     * Get the total amount to pay for combo food. The result is an int number
     *
     * @param id is id of order. It is an int number
     * @return an int number
     * @throws java.lang.Exception
     */
    @Override
    public int getTotalMoneyComboFood(int id) throws Exception {
        String sql = "select SUM(f.price * fo.quantity) as totalMoneyComboFood from comboFood f\n"
                + "join comboFoodOrderd fo on f.id = fo.idComboFood\n"
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
                int totalMoneyComboFood = rs.getInt("totalMoneyComboFood");
                return totalMoneyComboFood;
            }
            return 0;          
        } catch (Exception e) {
            Logger.getLogger(ComboFoodDAOImpl.class.getName()).log(Level.SEVERE, null, e);
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(connection);
        }
    }
}
