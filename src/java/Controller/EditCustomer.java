/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.HHPlazaDAO;
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
public class EditCustomer extends HttpServlet {

    ArrayList<Customer> manageCus = new ArrayList<Customer>();
    private final String allCountryRegex = "^(\\+\\d{1,3}( )?)?((\\(\\d{1,3}\\))|\\d{1,3})[- .]?\\d{3,4}[- .]?\\d{4}$";

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            Customer account = (Customer) session.getAttribute("account");
            request.setAttribute("account", account);
            request.getRequestDispatcher("EditCustomer.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        Customer account = (Customer) session.getAttribute("account");
        request.setAttribute("account", account);
        int id = Integer.parseInt(request.getParameter("cid"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("cname");
        String phone = request.getParameter("cphone");
        String address = request.getParameter("cAddress");
        String status = request.getParameter("status");
        if (CheckNull(username, password, name, phone, address, status)) {
            String notnull = "You must fill out the form";
            request.setAttribute("notnull", notnull);
            request.getRequestDispatcher("EditCustomer.jsp").forward(request, response);
        } else if (!phone.matches(allCountryRegex)) {
            String cfphone = "Phone number is not available";
            request.setAttribute("cfphone", cfphone);
            request.getRequestDispatcher("EditCustomer.jsp").forward(request, response);
        } else {
            try {
                HHPlazaDAO.UpdateUser(id, username, password, name, phone, address, status);
                manageCus = HHPlazaDAO.getAllCustomer();
                request.setAttribute("manageCus", manageCus);
                request.getRequestDispatcher("CustomerManagement.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(EditCustomer.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
    private boolean CheckNull(String username, String password, String cfpassword, String name, String phone, String address) {
        if (username == null || username.equals("") && password == null || password.equals("") && cfpassword == null || cfpassword.equals("")
                && name == null || name.equals("") && phone == null || phone.equals("") && address == null || address.equals("")) {
            return true;
        } else {
            return false;
        }
    }
    private Boolean CheckUsername(String username) {
        try {
            return HHPlazaDAO.CheckUsername(username);
        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
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
