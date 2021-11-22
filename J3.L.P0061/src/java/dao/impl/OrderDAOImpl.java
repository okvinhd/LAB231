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
import dao.FoodDAO;
import dao.OrderDAO;
import dao.ServiceDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import entity.Order;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * This class has methods for retrieving data from listOrder tables in database.
 * The method will return an object of the class
 * <code> java.lang.Exception</code> when there is any error querying the data.
 * <br>
 * Bugs: None
 *
 * @author VinhNM
 */
public class OrderDAOImpl extends DBContext implements OrderDAO {

    /**
     * Get list order from listOrder table in database. The result contains a
     * list of <code>Order</code> objects
     *
     * @param id the id of order. It is an int number
     * @param listSize the total item can display on page. It is an int number
     * @param index the page index. It is an int number
     * @return a list of <code>Order</code> objects. It is a
     * <code>java.util.ArrayList</code> object
     * @throws java.lang.Exception
     */
    @Override
    public ArrayList<Order> getOrder(String id, int listSize, int index) throws Exception {
        String sql = "select * from (select ROW_NUMBER() OVER (Order by l.id asc) as stt\n"
                + "                , l.id, l.beginDate, l.dateOrder, l.note, s.[status], l.typeTable, l.[when] \n"
                + "				from listOrder l \n"
                + "				join statusOrder s on l.[status] = s.id \n"
                + "				where l.id like ?) as tbl\n"
                + "where stt >= ? and stt <= ?";
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            int startItem = (index - 1) * listSize + 1;
            int lastItem = startItem + listSize - 1;
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + id + "%");
            ps.setInt(2, startItem);
            ps.setInt(3, lastItem);
            rs = ps.executeQuery();
            ArrayList<Order> detailOrder = new ArrayList<>();
            while (rs.next()) {
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setDateOrder(sdf.format(rs.getDate("dateOrder")));
                o.setStatus(rs.getString("status"));
                FoodDAO foodDAO = new FoodDAOImpl();
                ComboFoodDAO comboFoodDAO = new ComboFoodDAOImpl();
                ServiceDAO serviceDAO = new ServiceDAOImpl();
                o.setTotalMoneyFood(foodDAO.getTotalMoneyFood(o.getId()));
                o.setTotalMoneyComboFood(comboFoodDAO.getTotalMoneyComboFood(o.getId()));
                o.setTotalMoneyService(serviceDAO.getTotalMoneyService(o.getId()));
                o.setTotalMoneyAll(o.getTotalMoneyFood() + o.getTotalMoneyComboFood() + o.getTotalMoneyService());
                detailOrder.add(o);
            }
            return detailOrder;
        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(connection);
        }
    }

    /**
     * Get total page index. The result contains a int number
     *
     * @param id the id of order. It is an int number
     * @param listSize the total item can display on page. It is an int number
     * @return an int number
     * @throws java.lang.Exception
     */
    @Override
    public int getTotalPage(String id, int listSize) throws Exception {
        String sql = "select count(id) as total from listOrder where id like ?";
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + id + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                if (rs.getInt("total") == 0) {
                    return 1;
                } else {
                    int totalPage = rs.getInt("total") / listSize;
                    if (rs.getInt("total") % listSize != 0) {
                        totalPage++;
                    }
                    return totalPage;
                }
            }
            return 0;
        } catch (Exception e) {
            Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, e);
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(connection);
        }
    }

    /**
     * Update data of order object into listOrder table.
     *
     * @param id the id of order. It is an int number
     * @param status the new status of order. It is a String
     * @throws java.lang.Exception
     */
    @Override
    public void editOrder(int id, int status) throws Exception {
        String sql = "UPDATE [dbo].[listOrder] SET [status] = ? WHERE id = ?";
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, id);
            ps.execute();
        } catch (Exception e) {
            Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, e);
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(connection);
        }
    }

    /**
     * Get detail of an order. The result is a <code>Order</code> object
     *
     * @param id the id of order. It is an int number
     * @return is a <code>Order</code> object
     * @throws java.lang.Exception
     */
    @Override
    public Order getOrderDetail(int id) throws Exception {
        String sql = "select l.id, l.typeTable, l.numberGuest, l.dateOrder, l.beginDate, l.note, l.[when], s.[status] from listOrder l\n"
                + "join statusOrder s on l.[status] = s.id\n"
                + "where l.id = ?";
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            Order orderDetail = new Order();
            if (rs.next()) {
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                orderDetail.setId(id);
                orderDetail.setTypeTable(rs.getInt("typeTable"));
                orderDetail.setNumberGuest(rs.getInt("numberGuest"));
                orderDetail.setDateOrder(sdf.format(rs.getDate("dateOrder")));
                orderDetail.setBeginDate(sdf.format(rs.getDate("beginDate")));
                orderDetail.setTime(rs.getString("when"));
                orderDetail.setNote(rs.getString("note"));
                orderDetail.setStatus(rs.getString("status"));
                FoodDAO foodDAO = new FoodDAOImpl();
                ComboFoodDAO comboFoodDAO = new ComboFoodDAOImpl();
                ServiceDAO serviceDAO = new ServiceDAOImpl();
                orderDetail.setFood(foodDAO.getFood(id));
                orderDetail.setComboFood(comboFoodDAO.getComboFood(id));
                orderDetail.setService(serviceDAO.getService(id));
                orderDetail.setTotalMoneyFood(foodDAO.getTotalMoneyFood(id));
                orderDetail.setTotalMoneyComboFood(comboFoodDAO.getTotalMoneyComboFood(id));
                orderDetail.setTotalMoneyService(serviceDAO.getTotalMoneyService(id));
                orderDetail.setTotalMoneyAll(orderDetail.getTotalMoneyFood() + orderDetail.getTotalMoneyComboFood() + orderDetail.getTotalMoneyService());
            }
            return orderDetail;
        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(connection);
        }
    }
}
