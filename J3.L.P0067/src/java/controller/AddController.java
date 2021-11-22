/*
 * Copyright(C) 2021,  VinhNMHE140137
 * J3.L.P0067
 * Dishes Management
 *
 * Record of change:
 * DATE           Version    AUTHOR                   DESCRIPTION
 * 21/10/2021      1.0       VinhNM   
 */
package controller;

import dao.impl.FoodDAOImpl;
import entity.Food;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.FoodDAO;

/**
 *
 * @author VinhNM
 */
public class AddController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        String nameSearch = request.getParameter("nameService");
        String idTypeSearch = request.getParameter("idTypeService");
        String index = request.getParameter("index");

        /*if nameSearch is null, it means that the user has not performed a search, 
        automatically nameSearch = ""*/
        if (nameSearch == null) {
            nameSearch = "";
        }

        /*if idTypeSearch is null, it means that the user has not performed a 
        search, automatically returned to all type*/
        if (idTypeSearch == null || idTypeSearch.equals("")) {
            idTypeSearch = "0";
        }

        /*if index is null, it means that the user has not performed a search, 
        automatically returned to page 1*/
        if (index == null || index.equals("")) {
            index = "1";
        }

        String image = request.getParameter("add-imageService");
        String name = request.getParameter("add-nameService").trim();
        String type = request.getParameter("add-idTypeService");
        String status = request.getParameter("add-statusService");
        String price = request.getParameter("add-priceService");
        String description = request.getParameter("add-descriptionService").trim();

        FoodDAO serviceDAO = new FoodDAOImpl();

        try {
            ArrayList<Food> allService = serviceDAO.getAllService();
            //Check if the input just entered is duplicated.
            if (checkDataDuplication(name, type, allService)) {
                //if there is duplicate data, return Food page to show alert
                response.sendRedirect("Service?nameService=" + nameSearch + "&idTypeService=" + idTypeSearch + "&index=" + index + "&update=false");
            } else {
                //if there is no duplicate data, insert into database
                serviceDAO.addFood(image, name, Integer.parseInt(type),
                        Boolean.parseBoolean(status), Integer.parseInt(price),
                        description);
                response.sendRedirect("Service?nameService=" + nameSearch + "&idTypeService=" + idTypeSearch + "&index=" + index+"&message=1");
//                request.getRequestDispatcher("Food?nameService=" + nameSearch + "&idTypeService=" + idTypeSearch + "&index=" + index).forward(request, response);
//                response.sendRedirect("Food?nameService=" + nameSearch + "&idTypeService=" + idTypeSearch + "&index=" + index);
            }
        } catch (Exception e) {
            response.sendRedirect("Service?nameService=" + nameSearch + "&idTypeService=" + idTypeSearch + "&index=" + index+"&message=0");
//            request.setAttribute("message", 0);
//            request.getRequestDispatcher("Food?nameService=" + nameSearch + "&idTypeService=" + idTypeSearch + "&index=" + index).forward(request, response);
//            request.setAttribute("error", "Lỗi hệ thống");
//            response.sendRedirect("Food?nameService=" + nameSearch + "&idTypeService=" + idTypeSearch + "&index=" + index);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Check if any input is empty
     *
     * @param image is the image of the service user want to add. It is an
     * string
     * @param name is the name of the service user want to add. It is an string
     * @param price the price of service user want to add. It is an integer
     * number
     * @param description the description of service user want to add. It is a
     * String
     * @return true or false
     */
    protected boolean checkInputParameter(String image, String name, String price,
            String description) {
        return image.equals("") || name.equals("") || price.equals("")
                || description.equals("");
    }

    /**
     * Check if there are any services in the database that have the same name
     * and type as the name and type of the added service.
     *
     * @param name is the new name of the service user want to change. It is an
     * string
     * @param type the new price of service user want to change. It is an
     * integer number
     * @param allService is a list containing all the Services in the database.
 It is an ArrayList containing the Food object
     * @return true or false
     */
    protected boolean checkDataDuplication(String name, String type,
            ArrayList<Food> allService) {
        for (int i = 0; i < allService.size(); i++) {

            //if found duplicate, report an error
            if (name.equals(allService.get(i).getName())
                    && Integer.parseInt(type) == allService.get(i).getTypeCode()) {
                return true;
            }
        }
        return false;
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
