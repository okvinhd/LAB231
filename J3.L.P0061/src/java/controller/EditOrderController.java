/*
 * Copyright(C) 2021,  VinhNMHE140137
 * J3.L.P0061
 * OrderList
 *
 * Record of change:
 * DATE           Version    AUTHOR                   DESCRIPTION
 * 22/10/2021      1.0       VinhNM                 Order Controler
 */
package controller;

import dao.OrderDAO;
import dao.impl.OrderDAOImpl;
import entity.Order;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * This class contains a method that gets parameter idDetail, idOrder, index,
 * status from the HTTP request; calls getOrderDetail in
 * <code>OrderDAOImpl</code> to get detail order and calls editOrder in
 * <code>OrderDAOImpl</code>, to update order into listOrder table.<br>
 *
 * - HTTP GET method call getOrderDetail in <code>OrderDAOImpl</code> with
 * idDetail from query param to get <code>Order</code> from SQL Server and
 * forward to the <code>OrderDetail.jsp</code>.<br>
 *
 * - HTTP POST metho call editOrder in <code>OrderDAOImpl</code> with idDetail,
 * status from query param to update status order to listOrder table in SQL
 * Server and redirect to detail of order with id is idDetail.<br>
 *
 * Bugs: None
 *
 * @author VinhNM
 */
public class EditOrderController extends HttpServlet {

    /**
     * - Get parameter idOrder, index, status, idDetail from request:<br>
     * + idOrder is the key word entered by the user, it is used for searching
     * and it is an int number.<br>
     * + index is the page index clicked by the user, it is used to display the
     * corresponding result and it is an int number.<br>
     * + status is the state that has just been changed if the user has just
     * made a change to the <code>Order</code> status and it is an int
     * number.<br>
     * + idDetail is id of <code>Order</code> being displayed, it is an int
     * number.<br>
     *
     * - If idOrder is null, change to "" to ensure that no errors occur during
     * the interaction with the database<br>
     * - If index is null, change to 1 to ensure that no errors occur during the
     * interaction with the database.<br>
     *
     * - Use method getOrderDetail in <code>OrderDAOImpl</code> to get an
     * <code>Order</code> object have id is idDetail.<br>
     *
     * - Set attribute detail to return detail order to the client side.<br>
     * - Set attribute id, index to return search input to the client side.<br>
     * - Set attribute update to check and show message if user make order
     * status change.<br>
     *
     *
     * - Servlet will directly respond to "Error.jsp" when any error occurs.
     *
     * @param request stores attribute: id, index, idDetail. It is a
     * <code>javax.servlet.http.HttpServletRequest</code> object. <br>
     * - id is <code>String</code> type. It is id of order want to search.<br>
     * - index is <code>String</code> type. It is the page index.<br>
     * - idDetail is int number. It is id of order want to view detail<br>
     * - orderDetail is <code>Order</code> object. It is order want to view
     * detail.
     *
     * @param response response respond to an HTTP Request to the browser. It is
     * answer <code>javax.servlet.http.HttpServletResponse</code> object
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idSearch = request.getParameter("idOrder");
        String index = request.getParameter("index");
        String status = request.getParameter("status");
        /*if id is null, it means that the user has not performed a search, 
        automatically id = ""*/
        if (idSearch == null) {
            idSearch = "";
        }

        /*if rawIndex is null, it means that the user has not performed a search, 
        automatically returned to page 1*/
        if (index == null || index.equals("")) {
            index = "1";
        }

        OrderDAO orderDAO = new OrderDAOImpl();

        //get detail order and forward to OrderDetail.jsp
        try {
            int idDetail = Integer.parseInt(request.getParameter("idDetail"));
            Order orderDetail = orderDAO.getOrderDetail(idDetail);
            request.setAttribute("detail", orderDetail);
            request.setAttribute("id", idSearch);
            request.setAttribute("index", index);
            request.setAttribute("status", status);
            request.getRequestDispatcher("OrderDetail.jsp").forward(request, response);
        } catch (Exception e) {
            Logger.getLogger(EditOrderController.class.getName()).log(Level.SEVERE, null, e);
            request.setAttribute("errorEdit", "Lỗi hệ thống");

        }
    }

    /**
     * - Get parameter idOrder, index, status, idDetail from request:<br>
     * + idOrder is the key word entered by the user, it is used for searching
     * and it is an int number.<br>
     * + index is the page index clicked by the user, it is used to display the
     * corresponding result and it is an int number.<br>
     * + status is the state that has just been changed if the user has just
     * made a change to the <code>Order</code> status and it is an int
     * number.<br>
     * + idDetail is id of <code>Order</code> being displayed, it is an int
     * number.<br>
     *
     * - Use method editOrder in <code>OrderDAOImpl</code> to update status
     * Order with id is idDetail in database.<br>
     *
     * - Send redirect for back to editOrder to display order detail with id is
     * idDetail.<br>
     * - Servlet will directly respond to "Error.jsp" when any error occurs.
     *
     *
     * @param request stores attribute: id, status, idOrder, index. It is a
     * <code>javax.servlet.http.HttpServletRequest</code> object. <br>
     * - id is the id order to want to edit. <br>
     * - status is the new id status of order want to edit.<br>
     * - idDetail is the id of order want to search.<br>
     * - index is the page index.
     *
     * @param response response respond to an HTTP Request to the browser. It is
     * answer <code>javax.servlet.http.HttpServletResponse</code> object
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idDetail = Integer.parseInt(request.getParameter("idDetail"));
        String idSearch = request.getParameter("idOrder");
        String index = request.getParameter("index");
        int status = Integer.parseInt(request.getParameter("status"));

        try {
            OrderDAO orderDAO = new OrderDAOImpl();
            //edit status order
            orderDAO.editOrder(idDetail, status);
            response.sendRedirect("editOrder?idDetail=" + idDetail + "&idOrder="
                    + idSearch + "&index=" + index + "&status=" + status);
        } catch (Exception e) {
            Logger.getLogger(EditOrderController.class.getName()).log(Level.SEVERE, null, e);
            request.setAttribute("errorEdit", "Lỗi hệ thống");
            doGet(request, response);
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
