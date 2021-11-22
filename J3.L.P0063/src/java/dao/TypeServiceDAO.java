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

import entity.TypeService;
import java.util.ArrayList;

/**
 *
 * @author VinhNM
 */
public interface TypeServiceDAO {
    /**
     * Get list type service from typeService table in database. The result
     * contains a list of <code>mode.TypeService</code> objects with id, name
     *
     * @return a list of <code>TypeService</code> objects. It is a
     * <code>java.util.ArrayList</code> object
     * @throws java.lang.Exception
     */
    public ArrayList<TypeService> getAllTypeService() throws Exception;
}
