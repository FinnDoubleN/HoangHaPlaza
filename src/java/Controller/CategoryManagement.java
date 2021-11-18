/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.HHPlazaDAO;
import Model.Category;
import Model.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class CategoryManagement extends HttpServlet {

    ArrayList<Category> category = new ArrayList<Category>();

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            Customer account = (Customer) session.getAttribute("account");
            request.setAttribute("account", account);
            String Add = request.getParameter("Add");
            String edit = request.getParameter("edit");
            String delete = request.getParameter("delete");
            if (Add == null || Add.equals("")) {
                category = HHPlazaDAO.getAllCategory();
                request.setAttribute("category", category);
                request.getRequestDispatcher("CategoryManagement.jsp").forward(request, response);
            }
            if (Add != null) {
                request.getRequestDispatcher("AddCategory.jsp").forward(request, response);
            }
            if (edit != null) {
                category = HHPlazaDAO.getCategorybyID(edit);
                request.setAttribute("category", category);
                request.getRequestDispatcher("EditCategory.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("CategoryManagement.jsp").forward(request, response);
            }
            if (delete != null) {
                HHPlazaDAO.deleteProduct(delete);
            }

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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CategoryManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            HttpSession session = request.getSession();
            Customer account = (Customer) session.getAttribute("account");
            request.setAttribute("account", account);
            String Add = request.getParameter("Add");
            String edit = request.getParameter("edit");
            String delete = request.getParameter("delete");
            if (Add == null && edit == null && delete == null) {
                category = HHPlazaDAO.getAllCategory();
                request.setAttribute("category", category);
                request.getRequestDispatcher("CategoryManagement.jsp").forward(request, response);
            }
            if (Add != null) {
                request.getRequestDispatcher("AddCategory.jsp").forward(request, response);
            }
            if (edit != null) {
                category = HHPlazaDAO.getCategorybyID(edit);
                request.setAttribute("category", category);
                request.getRequestDispatcher("EditCategory.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("CategoryManagement.jsp").forward(request, response);
            }
            if (delete != null) {
                HHPlazaDAO.deleteProduct(delete);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryManagement.class.getName()).log(Level.SEVERE, null, ex);
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
