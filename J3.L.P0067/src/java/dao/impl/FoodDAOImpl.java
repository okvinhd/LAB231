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
import entity.Food;
import dao.FoodDAO;

/**
 * This class has methods for retrieving data from Food tables and
 typeService in database. The method will return an object of the class
 * <code> java.lang.Exception</code> when there is any error querying the data.
 * <p>
 *
 * @author VinhNM
 */
public class FoodDAOImpl extends DBContext implements FoodDAO {

    /**
     * Get list service from Food table in database. The result
     * contains a list of <code>mode.Food</code> objects
     *
     * @param name the name of <code>Food</code> object. It is an string
     * @param type the type of <code>Food</code> object. It is an int number
     * @param startItem is the serial number of the first <code>Food</code>
     * object. It is an int number
     * @param lastItem is the serial number of the last <code>Food</code>
     * object. It is an int number
     * @return a list of <code>Food</code> objects. It is a
     * <code>java.util.ArrayList</code> object
     * @throws java.lang.Exception
     */
    @Override
    public ArrayList<Food> getService(String name, int type, int startItem, int lastItem) throws Exception {
        String sql = "select * from (select ROW_NUMBER() OVER (ORDER BY s.status desc) as stt, s.id, s.[name], s.price, s.[status], "
                + "t.[name] as 'type', s.[description], s.[image], s.[type] as typeCode from [service] s \n"
                + "join typeservice t on s.[type] = t.id\n"
                + "where s.[name] like ? ";
        if (type != 0) {
            sql += "and t.[id] = ?";
        }
        sql += ") as tbl\n"
                + "where stt >= ? and stt <= ?\n"
                + "order by [id] asc";
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name.trim() + "%");
            if (type != 0) {
                ps.setInt(2, type);
                ps.setInt(3, startItem);
                ps.setInt(4, lastItem);
            } else {
                ps.setInt(2, startItem);
                ps.setInt(3, lastItem);
            }
            rs = ps.executeQuery();
            ArrayList<Food> searchService = new ArrayList<>();
            while (rs.next()) {
                Food s = new Food();
                s.setNumericalOrder(rs.getInt("stt"));
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setPrice(rs.getInt("price"));
                s.setType(rs.getString("type"));
                s.setTypeCode(rs.getInt("typeCode"));
                if (rs.getBoolean("status") == true) {
                    s.setStatus("Đang kinh doanh");
                } else {
                    s.setStatus("Không kinh doanh");
                }
                s.setImage(rs.getString("image"));
                s.setDecription(rs.getString("description"));
                searchService.add(s);
            }
            return searchService;
        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(connection);
        }
    }

    /**
     * Get list service from Food table in database. Total page
     * will be return. The result contain an int number
     * number
     *
     * @param listSize the max number of service in each page. It is an int
     * number
     * @param name the char in name of service. It is an string
     * @param type the id type of service. It is an int number
     * @return an int number
     * @throws java.lang.Exception
     */
    @Override
    public int getTotalPage(int listSize, String name, String type) throws NumberFormatException, Exception {
        String sql = "select count(id) as 'total' from [service] where name like ? ";
        if (Integer.parseInt(type) != 0) {
            sql += " and [type] = ?";
        }
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            if (Integer.parseInt(type) != 0) {
                ps.setInt(2, Integer.parseInt(type));
            }
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
        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(connection);
        }
        return 0;
    }

    /**
     * Insert data of service object into Food table.
     *
     * @param image the image of service. It is a String
     * @param name the name of service. It is a String
     * @param type the id type of service. It is an int number
     * @param status the status of service. It is an boolean
     * @param price the price of service. It is an int number
     * @param description the description of service. It is a String
     * @throws java.lang.Exception
     */
    @Override
    public void addFood(String image, String name, int type, boolean status, int price, String description) throws Exception {
        String sql = "INSeRT INTO [dbo].[service]([name],[price],[status],[type],[description],[image])\n"
                + "VALUES(?,?,?,?,?,?)";
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, price);
            ps.setBoolean(3, status);
            ps.setInt(4, type);
            ps.setString(5, description);
            ps.setString(6, image);
            ps.execute();
        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(connection);
        }
    }

    /**
     * Update data of service object into Food table and.
     *
     * @param id the id of service. It is an int number
     * @param image the image of service. It is a String
     * @param name the name of service. It is a String
     * @param type the id type of service. It is an int number
     * @param status the status of service. It is an boolean
     * @param price the price of service. It is an int number
     * @param description the description of service. It is a String
     * @throws java.lang.Exception
     */
    @Override   
    public void editFood(int id, String image, String name, int type, boolean status, int price, String description) throws Exception {
        String sql = "UPDATE [dbo].[service]SET [name] = ?,\n"
                + "[price] = ?,\n"
                + "[status] = ?,\n"
                + "[type] = ?,\n"
                + "[description] = ?,\n"
                + "[image] = ?\n"
                + " WHERE id = ?";
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, price);
            ps.setBoolean(3, status);
            ps.setInt(4, type);
            ps.setString(5, description);
            ps.setString(6, image);
            ps.setInt(7, id);
            ps.execute();
        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(connection);
        }
    }

    /**
     * Get list service from Food table in database. The result contains a
     * list of <code>mode.Food</code> objects with id, name, price, status,
     * type, description, image
     *
     * @return a list of <code>Food</code> objects. It is a
     * <code>java.util.ArrayList</code> object
     * @throws java.lang.Exception
     */
    @Override
    public ArrayList<Food> getAllService() throws Exception {
        String sql = "select * from Service";
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            ArrayList<Food> allService = new ArrayList<>();
            while (rs.next()) {
                Food s = new Food();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setPrice(rs.getInt("price"));
                s.setStatusCode(rs.getBoolean("status"));
                s.setTypeCode(rs.getInt("type"));
                s.setDecription(rs.getString("description"));
                s.setImage(rs.getString("image"));
                allService.add(s);
            }
            return allService;
        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(connection);
        }
    }

    /**
     * Get list service from Food table in database excluding data with an id
 equal to @param id. The result contains a list of
     * <code>mode.Food</code> objects with id, name, price, status, type,
     * description, image
     *
     * @param id the id of service. It is an int number
     * @return a list of <code>Food</code> objects. It is a
     * <code>java.util.ArrayList</code> object
     * @throws java.lang.Exception
     */
    @Override
    public ArrayList<Food> getAllServiceWithoutUpdateData(int id) throws Exception {
        String sql = "select * from [service]\n"
                + "where id != ?";
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            ArrayList<Food> allService = new ArrayList<>();
            while (rs.next()) {
                Food s = new Food();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setPrice(rs.getInt("price"));
                s.setStatusCode(rs.getBoolean("status"));
                s.setTypeCode(rs.getInt("type"));
                s.setDecription(rs.getString("description"));
                s.setImage(rs.getString("image"));
                allService.add(s);
            }
            return allService;
        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(connection);
        }
    }
}
