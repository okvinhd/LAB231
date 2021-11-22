/*
 * Copyright(C) 2021,  VinhNMHE140137
 * J3.L.P0061
 * OrderList
 *
 * Record of change:
 * DATE           Version    AUTHOR                   DESCRIPTION
 * 11/10/2021      1.0       VinhNM    
 */
package dao;

import java.util.ArrayList;
import entity.Order;

/**
 * This interface defines method used to retrieve information from database 
 * relating to <code>Order</code> object
 * <p>
 * Bugs: None
 *
 * @author VinhNM
 */
public interface OrderDAO {
    
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
    public ArrayList<Order> getOrder(String id, int listSize, int index) throws Exception;
    
    /**
     * Get total page index. The result contains a int number
     *
     * @param id the id of order. It is an int number
     * @param listSize the total item can display on page. It is an int number
     * @return an int number
     * @throws java.lang.Exception
     */
    public int getTotalPage(String id, int listSize) throws Exception;
    
    /**
     * Update data of order object into listOrder table.
     *
     * @param id the id of order. It is an int number
     * @param status the new status of order. It is a String
     * @throws java.lang.Exception
     */
    public void editOrder(int id, int status) throws Exception;
    
    /**
     * Get detail of an order. The result is a <code>Order</code> object
     *
     * @param id the id of order. It is an int number
     * @return is a <code>Order</code> object
     * @throws java.lang.Exception
     */
    public Order getOrderDetail(int id) throws Exception;
}
