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
import dao.FoodDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import entity.Food;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * This class has methods for retrieving data from foodOrderd tables and
 * Food in database. The method will return an object of the class
 * <code> java.lang.Exception</code> when there is any error querying the data.
 * <br>
 * Bugs: None
 *
 * @author VinhNM
 */
public class FoodDAOImpl extends DBContext implements FoodDAO {

    /**
     * Get list Food from foodOrderd table in database. The result contains 
     * a list of <code>Food</code> objects with id, name, price, quantity
     *
     * @param id is id of order. It is an int number
     * @return a list of <code>Food</code> objects. It is a
     * <code>java.util.ArrayList</code> object
     * @throws java.lang.Exception
     */
    @Override
    public ArrayList<Food> getFood(int id) throws Exception {
        String sql = "select ROW_NUMBER() OVER (ORDER BY f.id) as stt, f.nameFood, f.price, fo.quantity from Food f\n"
                + "join foodOrderd fo on f.id = fo.idFood\n"
                + "where fo.idOrder = ?";
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            ArrayList<Food> food = new ArrayList<>();
            while (rs.next()) {
                Food f = new Food();
                f.setNumberOrder(rs.getInt("stt"));
                f.setName(rs.getString("nameFood"));
                f.setPrice(rs.getInt("price"));
                f.setQuantity(rs.getInt("quantity"));
                food.add(f);
            }
            return food;
        } catch (Exception e) {
            Logger.getLogger(FoodDAOImpl.class.getName()).log(Level.SEVERE, null, e);
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(connection);
        }
    }

    /**
     * Get the total amount to pay for food. The result is an int number
     *
     * @param id is id of order. It is an int number
     * @return an int number
     * @throws java.lang.Exception
     */
    @Override
    public int getTotalMoneyFood(int id) throws Exception {
        String sql = "select SUM(f.price * fo.quantity) as totalMoneyFood from Food f\n"
                + "join foodOrderd fo on f.id = fo.idFood\n"
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
                int totalMoneyFood = rs.getInt("totalMoneyFood");
                return totalMoneyFood;
            }
            return 0;
        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(connection);
        }
    }
}
