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
import dao.impl.TypeFoodDAOImpl;
import entity.Food;
import entity.TypeFood;
import java.io.IOException;
import java.io.PrintWriter;
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
public class HomeController extends HttpServlet {

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
        String name = request.getParameter("nameService");
        String rawIdType = request.getParameter("idTypeService");
        String rawIndex = request.getParameter("index");
        String update = request.getParameter("update");

        int listSize = 5;
        int startItem = 0;
        int lastItem = 0;   
        boolean check = true;

        if (update == null) {
            update = "true";
        }

        /*if rawIdType is null, it means that the user has not performed a 
        search, automatically returned to all type*/
        if (rawIdType == null) {
            rawIdType = "0";
        }

        /*if rawIndex is null, it means that the user has not performed a search, 
        automatically returned to page 1*/
        if (rawIndex == null) {
            rawIndex = "1";
        }

        /*if name is null, it means that the user has not performed a search, 
        automatically name = ""*/
        if (name == null) {
            name = "";
        } //if user entered, remove leading and trailing spaces
        else {
            name = name.trim();
        }

        FoodDAO serviceDAO = new FoodDAOImpl();

        try {
            // Get all the types in the database to display and check
            ArrayList<TypeFood> typeService
                    = new TypeFoodDAOImpl().getAllTypeService();
            request.setAttribute("typeService", typeService);

            // Get total number of pages to display and check
            int totalPage = serviceDAO.getTotalPage(listSize, name,
                    rawIdType);
            request.setAttribute("totalPage", totalPage);

            //Check index page and id type if user perform search with specific type
            if (checkIndex(totalPage, rawIndex) && checkIdType(typeService, rawIdType)) {
                //Calculate whether the first and last item will appear in the list
                startItem = (Integer.parseInt(rawIndex) - 1) * listSize + 1;
                lastItem = startItem + listSize - 1;
            } //if index page and id type is invalid, report an error
            else {
                check = false;
                request.setAttribute("error", "Vui lòng không chỉnh sửa thanh URL");
                request.setAttribute("check", check);
                request.getRequestDispatcher("Menu.jsp").forward(request, response);
            }

            //if all test is passed, get data to display
            if (check) {
                ArrayList<Food> listService = serviceDAO.getService(name,
                        Integer.parseInt(rawIdType), startItem, lastItem);
                request.setAttribute("listService", listService);
                request.setAttribute("totalItem", listService.size());
                request.setAttribute("index", rawIndex);
                request.setAttribute("nameService", name);
                request.setAttribute("idService", rawIdType);
                request.setAttribute("check", check);
                request.setAttribute("update", update);
                request.getRequestDispatcher("Menu.jsp").forward(request, response);
            }
        } catch (NumberFormatException ef) {
            check = false;
            request.setAttribute("error", "Vui lòng không chỉnh sửa thanh URL");
            request.setAttribute("check", check);
            request.getRequestDispatcher("Menu.jsp").forward(request, response);
        } catch (Exception ex) {
            request.setAttribute("error", ex.getMessage());
            request.getRequestDispatcher("Error.jsp").forward(request, response);
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
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    /**
     * Check if there are any services in the database that have the same name
     * and type as the new name and type of the service being edited.
     *
     * @param typeService is a list containing all the Services in the database.
 It is an ArrayList containing the Food object
     * @param idType is the id type of the service user want to search. It is an
     * string
     * @return true or false
     */
    private boolean checkIdType(ArrayList<TypeFood> typeService, String idType) {
        //Check id type if user perform search with specific type
        if (!idType.equals("0")) {
            for (int i = 0; i < typeService.size(); i++) {
                try {
                    //Check id type exists in database or not
                    if (Integer.parseInt(idType) == typeService.get(i).getId()) {
                        return true;
                    }
                } catch (NumberFormatException e) {
                    //If idType is not an integer number, return false
                    return false;
                }
            }
            /*If all checked but id type does not exist in the database, return 
            false*/
            return false;
        }
        return true;
    }

    /**
     * Check if the landing page index is valid or not.
     *
     * @param totalPage is the total number of indexes the page will have. It is
     * an integer number
     * @param index is the index of the landing page that the user selects. It
     * is an string
     * @return true or false
     */
    private boolean checkIndex(int totalPage, String index) {
        try {
            /*Check to make sure index is an integer and valid
            if index is valid, return true
            if index is invalid, return false*/
            return Integer.parseInt(index) <= totalPage && Integer.parseInt(index) > 0;
        } catch (NumberFormatException e) {
            //if index is not an integer number, return false
            return false;
        }
    }
}
