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
import entity.ComboFood;

/**
 * This interface defines method used to retrieve information from database 
 * relating to <code>Order</code> object, <code>ComboFood</code> object
 * <br>
 * Bugs: None
 *
 * @author VinhNM
 */
public interface ComboFoodDAO {
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
    public ArrayList<ComboFood> getComboFood(int id) throws Exception;
    
    /**
     * Get the total amount to pay for combo food. The result is an int number
     *
     * @param id is id of order. It is an int number
     * @return an int number
     * @throws java.lang.Exception
     */
    public int getTotalMoneyComboFood(int id) throws Exception;
}
