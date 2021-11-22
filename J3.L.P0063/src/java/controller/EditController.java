/*
 * Copyright(C) 2021,  VinhNMHE140137
 * J3.L.P0063
 * ServiceList
 *
 * Record of change:
 * DATE           Version    AUTHOR                   DESCRIPTION
 * 21/10/2021      1.0       VinhNM   
 */
package controller;

import dao.ServiceDAO;
import dao.impl.ServiceDAOImpl;
import entity.Service;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author VinhNM
 */
public class EditController extends HttpServlet {

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

        String id = request.getParameter("edit-idService");
        String name = request.getParameter("edit-nameService").trim();
        String price = request.getParameter("edit-priceService");
        String status = request.getParameter("edit-statusService");
        String type = request.getParameter("edit-idTypeService");
        String description = request.getParameter("edit-descriptionService").trim();
        String image = request.getParameter("edit-imageService");

        ServiceDAO serviceDAO = new ServiceDAOImpl();
        try {
            ArrayList<Service> allServiceWithoutUpdateService
                    = serviceDAO.getAllServiceWithoutUpdateData(Integer.parseInt(id));
            //Check if the input just entered is duplicated.
            if (!checkDataDuplication(name, type, allServiceWithoutUpdateService)) {
                //if there is duplicate data, return Service page to show alert
                response.sendRedirect("Service?nameService=" + nameSearch + "&idTypeService=" + idTypeSearch + "&index=" + index + "&update=false");
            } else {
                //if there is no duplicate data, insert into database
                serviceDAO.editService(Integer.parseInt(id), image, name,
                        Integer.parseInt(type), Boolean.parseBoolean(status),
                        Integer.parseInt(price), description);
                request.setAttribute("message", 3);
                response.sendRedirect("Service?nameService=" + nameSearch + "&idTypeService=" + idTypeSearch + "&index=" + index+"&message=3"+"&id="+id);
            }
        } catch (Exception e) {
            request.setAttribute("message", 4);
           response.sendRedirect("Service?nameService=" + nameSearch + "&idTypeService=" + idTypeSearch + "&index=" + index+"&message=4"+"&id="+id);
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

    protected boolean checkDataDuplication(String name, String type,
            ArrayList<Service> allServiceWithoutUpdateService) {
        for (int i = 0; i < allServiceWithoutUpdateService.size(); i++) {

            //if found duplicate, report an error
            if (name.equals(allServiceWithoutUpdateService.get(i).getName())
                    && Integer.parseInt(type) == allServiceWithoutUpdateService.get(i).getTypeCode()) {
                return false;
            }
        }
        return true;
    }
}
