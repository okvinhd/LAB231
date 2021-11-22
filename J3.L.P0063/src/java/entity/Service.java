/*
 * Copyright(C) 2021,  VinhNMHE140137
 * J3.L.P0063
 * ServiceList
 *
 * Record of change:
 * DATE           Version    AUTHOR                   DESCRIPTION
 * 21/10/2021      1.0       VinhNM   
 */
package entity;
/**
 * This class contain entities of <code>Service</code> object. Contain methods which use to get
 * and set all of attributes.
 * <p>
 * Bugs: None   
 *
 * @author VinhNM
 */
public class Service {
    private int numericalOrder;
    private int id;
    private String name;
    private int price;
    private String type;
    private int typeCode;
    private String status;
    private Boolean statusCode;
    private String image;
    private String decription;

    /**
     * Get value from numericalOrder attribute of <code>Service</code> object
     *
     * @return numericalOrder of object
     */
    public int getNumericalOrder() {
        return numericalOrder;
    }

    /**
     * Set value from numericalOrder attribute of <code>Service</code> object
     *
     * @param numericalOrder the numerical order of Service. It is an integer number
     */
    public void setNumericalOrder(int numericalOrder) {
        this.numericalOrder = numericalOrder;
    }

    /**
     * Get value from image attribute of <code>Service</code> object
     *
     * @return image of object
     */
    public String getImage() {
        return image;
    }

    /**
     * Set value from image attribute of <code>Service</code> object
     *
     * @param image the image of Service. It is an string
     */
    public void setImage(String image) {
        this.image = image;
    }

    /**
     * Get value from description attribute of <code>Service</code> object
     *
     * @return description of object
     */
    public String getDecription() {
        return decription;
    }

    /**
     * Set value from description attribute of <code>Service</code> object
     *
     * @param decription the description of Service. It is an string
     */
    public void setDecription(String decription) {
        this.decription = decription;
    }
    
    /**
     * Get value from status attribute of <code>Service</code> object
     *
     * @return status of object
     */
    public Boolean getStatusCode() {
        return statusCode;
    }

    /**
     * Set value from statusCode attribute of <code>Service</code> object
     *
     * @param statusCode the statusCode of Service. It is an integer number
     */
    public void setStatusCode(Boolean statusCode) {
        this.statusCode = statusCode;
    }
    
    /**
     * Get value from typeCode attribute of <code>Service</code> object
     *
     * @return typeCode of object
     */
    public int getTypeCode() {
        return typeCode;
    }

    /**
     * Set value from typeCode attribute of <code>Service</code> object
     *
     * @param typeCode the typeCode of Service. It is an integer number
     */
    public void setTypeCode(int typeCode) {
        this.typeCode = typeCode;
    }
    
    /**
     * Get value from id attribute of <code>Service</code> object
     *
     * @return id of object
     */
    public int getId() {
        return id;
    }

    /**
     * Set value from id attribute of <code>Service</code> object
     *
     * @param id the id of Service. It is an integer number
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Get value from name attribute of <code>Service</code> object
     *
     * @return name of object
     */
    public String getName() {
        return name;
    }

    /**
     * Set value from name attribute of <code>Service</code> object
     *
     * @param name the name of Service. It is an string
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Get value from price attribute of <code>Service</code> object
     *
     * @return price of object
     */
    public int getPrice() {
        return price;
    }

    /**
     * Set value from price attribute of <code>Service</code> object
     *
     * @param price the price of Service. It is an integer number
     */
    public void setPrice(int price) {
        this.price = price;
    }

    /**
     * Get value from type attribute of <code>Service</code> object
     *
     * @return type of object
     */
    public String getType() {
        return type;
    }

    /**
     * Set value from type attribute of <code>Service</code> object
     *
     * @param type the type of Service. It is an string
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * Get value from status attribute of <code>Service</code> object
     *
     * @return status of object
     */
    public String getStatus() {
        return status;
    }

    /**
     * Set value from status attribute of <code>Service</code> object
     *
     * @param status the status of Service. It is an string
     */
    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
