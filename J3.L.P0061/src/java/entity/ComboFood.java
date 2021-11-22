/*
 * Copyright(C) 2021,  VinhNMHE140137
 * J3.L.P0061
 * OrderList
 *
 * Record of change:
 * DATE           Version    AUTHOR                   DESCRIPTION
 * 22/10/2021      1.0       VinhNM    
 */
package entity;

/**
 * This class contain entities of <code>ComboFood</code> object. Contain methods which use to get
 * and set all of attributes.
 * <p>
 * Bugs: None   
 *
 * @author VinhNM
 */
public class ComboFood {

    private int id;
    private String name;
    private int quantity;
    private int numberOrder;
    private int price;

    /**
     * Get value from price attribute of <code>ComboFood</code> object
     *
     * @return price of object
     */
    public int getPrice() {
        return price;
    }

    /**
     * Set value from price attribute of <code>ComboFood</code> object
     *
     * @param price the price of combo food. It is an int number
     */
    public void setPrice(int price) {
        this.price = price;
    }

    /**
     * Get value from numberOrder attribute of <code>ComboFood</code> object
     *
     * @return numberOrder of object
     */
    public int getNumberOrder() {
        return numberOrder;
    }

    /**
     * Set value from numberOrder attribute of <code>ComboFood</code> object
     *
     * @param numberOrder the number order of combo food. It is an int number
     */
    public void setNumberOrder(int numberOrder) {
        this.numberOrder = numberOrder;
    }

    /**
     * Get value from id attribute of <code>ComboFood</code> object
     *
     * @return id of object
     */
    public int getId() {
        return id;
    }

    /**
     * Set value from id attribute of <code>ComboFood</code> object
     *
     * @param id the id of combo food. It is an int number
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Get value from name attribute of <code>ComboFood</code> object
     *
     * @return name of object
     */
    public String getName() {
        return name;
    }

    /**
     * Set value from name attribute of <code>ComboFood</code> object
     *
     * @param name the name of combo food. It is an string
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Get value from quantity attribute of <code>ComboFood</code> object
     *
     * @return quantity of object
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * Set value from quantity attribute of <code>ComboFood</code> object
     *
     * @param quantity the price of combo food. It is an int number
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
