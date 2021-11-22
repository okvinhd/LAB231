/*
 * Copyright(C) 2021,  VinhNMHE140137
 * J3.L.P0063
 * ServiceList
 *
 * Record of change:
 * DATE           Version    AUTHOR                   DESCRIPTION
 * 21/10/2021      1.0       VinhNM   
 */
package dao;

import entity.Service;
import java.util.ArrayList;

/**
 *
 * @author VinhNM
 */
public interface ServiceDAO {
    /**
     * Get list service from Service table in database. The result
     * contains a list of <code>mode.Service</code> objects
     *
     * @param  name the name of <code>Service</code> object. It is an String
     * @param  type the type of <code>Service</code> object. It is an int number
     * @param  startItem is the serial number of the first <code>Service</code> 
     * object. It is an int number
     * @param  lastItem is the serial number of the last <code>Service</code> 
     * object. It is an int number
     * @return a list of <code>Service</code> objects. It is a
     * <code>java.util.ArrayList</code> object
     * @throws java.lang.Exception
     */
    public ArrayList<Service> getService(String name, int type, int startItem, int lastItem) throws Exception;

    /**
     * Get list service from Service table in database. Total page
     * will be return. The result contain an int number
     *
     * @param listSize the max number of service in each page. It is an int
     * number
     * @param name the name of service. It is an string
     * @param type the id of type service. It is an int number
     * @return an int number
     * @throws java.lang.Exception
     */
    public int getTotalPage(int listSize, String name, String type) throws Exception;
    
    /**
     * Insert data of service object into Service table.
     *
     * @param image the image of service. It is a String
     * @param name the name of service. It is a String
     * @param type the id type of service. It is an int number
     * @param status the status of service. It is an boolean
     * @param price the price of service. It is an int number
     * @param description the description of service. It is a String
     * @throws java.lang.Exception
     */
    public void addService(String image, String name, int type, boolean status, int price, String description) throws Exception;
    
    /**
     * Update data of service object into Service table and.
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
    public void editService(int id,String image, String name, int type, boolean status, int price, String description) throws Exception;
    
    /**
     * Get list service from Service table in database. The result contains a
     * list of <code>mode.Service</code> objects with id, name, price, status,
     * type, description, image
     *
     * @return a list of <code>Service</code> objects. It is a
     * <code>java.util.ArrayList</code> object
     * @throws java.lang.Exception
     */
    public ArrayList<Service> getAllService() throws Exception;
    
    /**
     * Get list service from Service table in database excluding data with an id
     * equal to @param id. The result contains a list of
     * <code>mode.Service</code> objects with id, name, price, status, type,
     * description, image
     *
     * @param id the id of service. It is an int number
     * @return a list of <code>Service</code> objects. It is a
     * <code>java.util.ArrayList</code> object
     * @throws java.lang.Exception
     */
    public ArrayList<Service> getAllServiceWithoutUpdateData(int id) throws Exception;
}
