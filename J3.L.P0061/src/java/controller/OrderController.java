/*
 * Copyright(C) 2021,  VinhNMHE140137
 * J3.L.P0061
 * OrderList
 *
 * Record of change:
 * DATE           Version    AUTHOR                   DESCRIPTION
 * 22/10/2021      1.0       VinhNM                Order controler
 */
package controller;

import dao.OrderDAO;
import dao.impl.OrderDAOImpl;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entity.Order;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * This class contains a method that gets parameter idOrder, index, listSize
 * from the HTTP request; calls <code>OrderDAOImpl</code>, to get list record
 * <code>Order</code> by id.<br>
 *
 * - HTTP GET method call getOrder in <code>OrderDAOImpl</code> with id,
 * listSize, index from query param to get list record <code>Order</code> from
 * SQL Server and forward to the <code>ListOrder.jsp</code>.
 *
 * Bugs: None
 *
 * @author VinhNM
 */
public class OrderController extends HttpServlet {

    /**
     * - Get parameter idOrder, index from request, declare check as boolean and
     * listSize as int number:<br>
     * + idOrder is the key word entered by the user, it is used for searching
     * and is an int number.<br>
     * + index is the page index clicked by the user, it is used to display the
     * corresponding result and is an int number.<br>
     * + check is used to check if there is any invalid input, check will show
     * the web an error, it is a boolean.<br>
     * + listSize is used to check if there are any results returned through the
     * search, it is int number.<br>
     *
     * - If idOrder is null, change to "" to ensure that no errors occur during
     * the interaction with the database.<br>
     * - If index is null, change to "1" to ensure that no errors occur during
     * the interaction with the database..<br>
     *
     * - Use the getTotalPage method in <code>orderDAOImpl</code> object to get
     * the total number of pages by idOrder and listSize.<br>
     * - Use the checkInput method in <code>OrderController</code> object to
     * check the return values of the parameter to ensure that the inputs are
     * valid.<br>
     * - Use the checkID method in <code>OrderController</code> to check
     * idOrders to ensure that the inputs are int numbers and valid.<br>
     * - Use the getOrder method in <code>orderDAOImpl</code> to get a list of
     * orders by idOrder and index.<br>
     *
     * - Set attribute orders, totalPage to return search results to the client
     * side.<br>
     * - Set attribute id, index to return search input to the client side.<br>
     * - Set attribute check, size to check and display error if any input is
     * invalid.<br>
     * - Finally forward to the <code>ListOrder.jsp</code> page.<br>
     * - Servlet will directly respond to "Error.jsp" when any error occurs
     *
     * @param request stores attribute: id, index, check, listSize, totalPage
     * and orders. It is a <code>javax.servlet.http.HttpServletRequest</code>
     * object.<br>
     * - id is <code>String</code> type. It is contain id of order want to
     * search.<br>
     * - index is <code>String</code> type. It is the page index.<br>
     * - check is <code>boolean</code> type. It is used to check the validity of
     * the input.<br>
     * - listSize is int number. It is total item can display in each page.<br>
     * - totalPage is int number. It is total number of pages that contain the
     * corresponding results.<br>
     * - orders is a list of <code>Order</code> object. It is the list of items
     * found through the input.
     *
     * @param response response respond to an HTTP Request to the browser. It is
     * answer <code>javax.servlet.http.HttpServletResponse</code> object
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("idOrder");
        String index = request.getParameter("index");
        boolean check = true;
        int listSize = 5;

        /*if id is null, it means that the user has not performed a search, 
        automatically id = ""*/
        if (id == null) {
            id = "";
        }

        /*if rawIndex is null, it means that the user has not performed a search, 
        automatically returned to page 1*/
        if (index == null) {
            index = "1";
        }

        OrderDAO orderDAO = new OrderDAOImpl();

        try {
            int totalPage = orderDAO.getTotalPage(id, listSize);

            //check input id and index page
            if (!checkInput(id, index, totalPage)) {
                //if input is invalid, report an error
                check = false;
                request.setAttribute("check", check);
                request.setAttribute("error", "Vui lòng không nhập vào thanh URL");
                request.getRequestDispatcher("ListOrder.jsp").forward(request, response);
            } else if (!checkID(id)) {
                //if input id is is a negative number, report an error
                check = false;
                request.setAttribute("check", check);
                request.setAttribute("error", "ID phải là số lớn hơn 0");
                request.getRequestDispatcher("ListOrder.jsp").forward(request, response);
            } else {
                //if input is valid, get list order and forward to ListOrder.jsp
                ArrayList<Order> orders = orderDAO.getOrder(id, listSize, Integer.parseInt(index));
                request.setAttribute("check", check);
                request.setAttribute("size", orders.size());
                request.setAttribute("orders", orders);
                request.setAttribute("index", Integer.parseInt(index));
                request.setAttribute("totalPage", totalPage);
                request.setAttribute("id", id);
                request.getRequestDispatcher("ListOrder.jsp").forward(request, response);
            }
        } catch (Exception e) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, e);
            request.setAttribute("error", "lỗi hệ thống");
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * The method is used to check the input, to detect invalid cases:<br>
     * - If idOrder is "", that means the user hasn't entered anything in
     * idOrder, cast index to int number and check to make sure index is greater
     * than 0 and less than total<br>
     * - if user input something to id order, cast index to int number and check
     * to make sure index is greater than 0 and less than total, then cast
     * idOrder to int number to make sure input is an int number.<br>
     * - If an exception occurs, it means the input is invalid, return false
     *
     * @param idOrder is the id of order want to search. It is an string
     * @param index is the page index. It is an string
     * @param total is the total page index with id search. It is an int number
     * @return true or false
     */
    private boolean checkInput(String idOrder, String index, int total) {
        try {
            if (idOrder.equals("") && Integer.parseInt(index) > 0
                    && Integer.parseInt(index) <= total) {
                return true;
            } else if (Integer.parseInt(index) > 0 && Integer.parseInt(index) <= total) {
                Integer.parseInt(idOrder);
                return true;
            } else {
                return false;
            }
        } catch (NumberFormatException e) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
    }

    /**
     * The method is used to check the input idOrder, to detect invalid
     * cases:<br>
     * - If idOrder is "", that means the user hasn't entered anything in
     * idOrder, then return true<br>
     * - If idOrder is not "", that means the user has entered something in
     * idOrder, cast idOrder to int number, then check idOrder is greater than 0
     * or not.<br>
     * - If an exception occurs, it means the input is invalid, return false
     *
     * @param idOrder is the id of order want to search. It is an string
     * @return true or false
     */
    private boolean checkID(String idOrder) {
        try {
            if (idOrder.equals("")) {
                return true;
            }
            return Integer.parseInt(idOrder) >= 0;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
