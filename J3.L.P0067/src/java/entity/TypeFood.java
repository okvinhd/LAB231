/*
 * Copyright(C) 2021,  VinhNMHE140137
 * J3.L.P0067
 * Dishes Management
 *
 * Record of change:
 * DATE           Version    AUTHOR                   DESCRIPTION
 * 21/10/2021      1.0       VinhNM   
 */
package entity;

/**
 * This class contain entities of <code>TypeFood</code> object. Contain methods which use to get
 * and set all of attributes.
 * <p>
 * Bugs: None   
 *
 * @author VinhNM
 */
public class TypeFood {
    private int id;
    private String name;

    /**
     * Get value from id attribute of <code>TypeFood</code> object
     *
     * @return id of object
     */
    public int getId() {
        return id;
    }

    /**
     * Set value from id attribute of <code>TypeFood</code> object
     *
     * @param id the id order of Service. It is an integer number
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Get value from name attribute of <code>TypeFood</code> object
     *
     * @return name of object
     */
    public String getName() {
        return name;
    }

    /**
     * Set value from name attribute of <code>TypeFood</code> object
     *
     * @param name the name order of Service. It is an integer number
     */
    public void setName(String name) {
        this.name = name;
    }
    
    
}
