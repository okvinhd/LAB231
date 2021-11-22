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

import java.util.ArrayList;

/**
 * This class contain entities of <code>Order</code> object. Contain methods
 * which use to get and set all of attributes.
 * <p>
 * Bugs: None
 *
 * @author VinhNM
 */
public class Order {

    private int id;
    private int typeTable;
    private int numberGuest;
    private String dateOrder;
    private String beginDate;
    private String time;
    private String note;
    private String status;
    private int totalMoneyFood;
    private int totalMoneyComboFood;
    private int totalMoneyService;
    private int totalMoneyAll;
    private ArrayList<Food> food;
    private ArrayList<ComboFood> comboFood;
    private ArrayList<Service> service;

    /**
     * Get value from id attribute of <code>Order</code> object
     *
     * @return id of object
     */
    public int getId() {
        return id;
    }

    /**
     * Set value from id attribute of <code>Order</code> object
     *
     * @param id is the price of order. It is an int number
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Get value from typeTable attribute of <code>Order</code> object
     *
     * @return type table of object
     */
    public int getTypeTable() {
        return typeTable;
    }

    /**
     * Set value from typeTable attribute of <code>Order</code> object
     *
     * @param typeTable is the type table of order. It is an int number
     */
    public void setTypeTable(int typeTable) {
        this.typeTable = typeTable;
    }

    /**
     * Get value from numberGuest attribute of <code>Order</code> object
     *
     * @return number guest of object
     */
    public int getNumberGuest() {
        return numberGuest;
    }

    /**
     * Set value from numberGuest attribute of <code>Order</code> object
     *
     * @param numberGuest is the number guest of order. It is an int number
     */
    public void setNumberGuest(int numberGuest) {
        this.numberGuest = numberGuest;
    }

    /**
     * Get value from dateOrder attribute of <code>Order</code> object
     *
     * @return date order of object
     */
    public String getDateOrder() {
        return dateOrder;
    }

    /**
     * Set value from dateOrder attribute of <code>Order</code> object
     *
     * @param dateOrder is the date order of order. It is an string
     */
    public void setDateOrder(String dateOrder) {
        this.dateOrder = dateOrder;
    }

    /**
     * Get value from beginDate attribute of <code>Order</code> object
     *
     * @return begin date of object
     */
    public String getBeginDate() {
        return beginDate;
    }

    /**
     * Set value from beginDate attribute of <code>Order</code> object
     *
     * @param beginDate is the begin date of order. It is an string
     */
    public void setBeginDate(String beginDate) {
        this.beginDate = beginDate;
    }

    /**
     * Get value from time attribute of <code>Order</code> object
     *
     * @return time of object
     */
    public String getTime() {
        return time;
    }

    /**
     * Set value from time attribute of <code>Order</code> object
     *
     * @param time is the time of order. It is an string
     */
    public void setTime(String time) {
        this.time = time;
    }

    /**
     * Get value from note attribute of <code>Order</code> object
     *
     * @return note of object
     */
    public String getNote() {
        return note;
    }

    /**
     * Set value from note attribute of <code>Order</code> object
     *
     * @param note is the note of order. It is an string
     */
    public void setNote(String note) {
        this.note = note;
    }

    /**
     * Get value from status attribute of <code>Order</code> object
     *
     * @return status of object
     */
    public String getStatus() {
        return status;
    }

    /**
     * Set value from status attribute of <code>Order</code> object
     *
     * @param status is the status of order. It is an string
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * Get value from totalMoneyFood attribute of <code>Order</code> object
     *
     * @return total money food of object
     */
    public int getTotalMoneyFood() {
        return totalMoneyFood;
    }

    /**
     * Set value from totalMoneyFood attribute of <code>Order</code> object
     *
     * @param totalMoneyFood is the total money food of order. It is an int number
     */
    public void setTotalMoneyFood(int totalMoneyFood) {
        this.totalMoneyFood = totalMoneyFood;
    }

    /**
     * Get value from totalMoneyComboFood attribute of <code>Order</code> object
     *
     * @return total money combo food of object
     */
    public int getTotalMoneyComboFood() {
        return totalMoneyComboFood;
    }

    /**
     * Set value from totalMoneyComboFood attribute of <code>Order</code> object
     *
     * @param totalMoneyComboFood is the total money combo food of order. It is an int number
     */
    public void setTotalMoneyComboFood(int totalMoneyComboFood) {
        this.totalMoneyComboFood = totalMoneyComboFood;
    }

    /**
     * Get value from totalMoneyService attribute of <code>Order</code> object
     *
     * @return total money service of object
     */
    public int getTotalMoneyService() {
        return totalMoneyService;
    }

    /**
     * Set value from totalMoneyService attribute of <code>Order</code> object
     *
     * @param totalMoneyService is the total money service of order. It is an int number
     */
    public void setTotalMoneyService(int totalMoneyService) {
        this.totalMoneyService = totalMoneyService;
    }

    /**
     * Get value from totalMoneyAll attribute of <code>Order</code> object
     *
     * @return total money all of object
     */
    public int getTotalMoneyAll() {
        return totalMoneyAll;
    }

    /**
     * Set value from totalMoneyAll attribute of <code>Order</code> object
     *
     * @param totalMoneyAll is the total money all of order. It is an int number
     */
    public void setTotalMoneyAll(int totalMoneyAll) {
        this.totalMoneyAll = totalMoneyAll;
    }

    /**
     * Get value from food attribute of <code>Order</code> object
     *
     * @return list food of object
     */
    public ArrayList<Food> getFood() {
        return food;
    }

    /**
     * Set value from food attribute of <code>Order</code> object
     *
     * @param food is the list food of order. It is an <code>java.util.ArrayList</code>
     */
    public void setFood(ArrayList<Food> food) {
        this.food = food;
    }

    /**
     * Get value from comboFood attribute of <code>Order</code> object
     *
     * @return list combo food of object
     */
    public ArrayList<ComboFood> getComboFood() {
        return comboFood;
    }

    /**
     * Set value from comboFood attribute of <code>Order</code> object
     *
     * @param comboFood is the list combo food of order. It is an <code>java.util.ArrayList</code>
     */
    public void setComboFood(ArrayList<ComboFood> comboFood) {
        this.comboFood = comboFood;
    }

    /**
     * Get value from service attribute of <code>Order</code> object
     *
     * @return list service of object
     */
    public ArrayList<Service> getService() {
        return service;
    }

    /**
     * Set value from service attribute of <code>Order</code> object
     *
     * @param service is the list service of order. It is an <code>java.util.ArrayList</code>
     */
    public void setService(ArrayList<Service> service) {
        this.service = service;
    }
}
