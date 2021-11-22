/*
 * Copyright(C) 2021,  VinhNMHE140137
 * J3.L.P0061
 * OrderList
 *
 * Record of change:
 * DATE           Version    AUTHOR                   DESCRIPTION
 * 22/10/2021      1.0       VinhNM    
 */
package dao;

import java.util.ArrayList;
import entity.Service;

/**
 * This interface defines method used to retrieve information from database 
 * relating to <code>Order</code> object, <code>Service</code> object
 * <br>
 * Bugs: None
 *
 * @author VinhNM
 */
public interface ServiceDAO {
    
    /**
     * Get list Service from serviceOrderd table in database. The result contains 
     * a list of <code>Service</code> objects with id, name, price, quantity
     *
     * @param id is id of order. It is an int number
     * @return a list of <code>Service</code> objects. It is a
     * <code>java.util.ArrayList</code> object
     * @throws java.lang.Exception
     */
    public ArrayList<Service> getService(int id) throws Exception;
    
    /**
     * Get the total amount to pay for service. The result is an int number
     *
     * @param id is id of order. It is an int number
     * @return an int number
     * @throws java.lang.Exception
     */
    public int getTotalMoneyService(int id) throws Exception;
}
