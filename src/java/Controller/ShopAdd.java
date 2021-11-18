/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.HHPlazaDAO;
import Model.Customer;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
public class ShopAdd extends HttpServlet {

    ArrayList<Product> shop = new ArrayList<Product>();

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
        if (account == null || account.equals("")) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            try {
                int id = HHPlazaDAO.getProfileByUsername(account.getUsername()).getCid();
                if (HHPlazaDAO.checkUserOrder(id) == 0) {
                    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                    LocalDate localDate = LocalDate.now();
                    String date = dtf.format(localDate);
                    HHPlazaDAO.createOrder(id, date);
                    int orderNo = HHPlazaDAO.checkUserOrder(id);
                    String itemNo = (String) request.getAttribute("item");
                    HHPlazaDAO.addItem(orderNo, itemNo, 1);
                    shop = HHPlazaDAO.getAllProduct();
                    request.setAttribute("shop", shop);
                    request.getRequestDispatcher("shop.jsp").forward(request, response);
                } else {
                    if (HHPlazaDAO.checkOrderItem(HHPlazaDAO.checkUserOrder(id)) == 0) {
                        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                        LocalDate localDate = LocalDate.now();
                        String date = dtf.format(localDate);
                        int orderNo = HHPlazaDAO.checkUserOrder(id);
                        HHPlazaDAO.UpdateOrderTime(orderNo, id, date);
                    }
                    int orderNo = HHPlazaDAO.checkUserOrder(id);
                    String itemNo = request.getParameter("item");
                    if (HHPlazaDAO.checkDuplicateItem(orderNo, itemNo) == true) {
                        int qty = HHPlazaDAO.getQuantity(orderNo, itemNo);
                        int stock = HHPlazaDAO.getStock(itemNo);
                        if (qty < stock) {
                            HHPlazaDAO.addQuantity(qty + 1, orderNo, itemNo);
                        } else if (qty == stock) {
                        }
                    } else {
                        HHPlazaDAO.addItem(orderNo, itemNo, 1);
                    }
                    shop = HHPlazaDAO.getAllProduct();
                    request.setAttribute("shop", shop);
                    request.getRequestDispatcher("shop.jsp").forward(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(ShopAdd.class.getName()).log(Level.SEVERE, null, ex);
            }
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
