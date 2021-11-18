/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.HHPlazaDAO;
import Model.CartUser;
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
public class Cart extends HttpServlet {

    ArrayList<CartUser> cart = new ArrayList<CartUser>();

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
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            Customer account = (Customer) session.getAttribute("account");
            request.setAttribute("account", account);
            if (account == null || account.equals("")) {
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else {
                if (account.isStatus() == true) {
                    cart = HHPlazaDAO.getAllCart();
                    request.setAttribute("cart", cart);
                    request.getRequestDispatcher("CartUserManagement.jsp").forward(request, response);
                } else {
                    int userID = HHPlazaDAO.getProfileByUsername(account.getUsername()).getCid();
                    int cartID = HHPlazaDAO.checkUserOrder(userID);
                    cart = HHPlazaDAO.getUserCart(cartID);
                    request.setAttribute("cart", cart);
                    request.getRequestDispatcher("Cart.jsp").forward(request, response);
                }
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
            Logger.getLogger(Cart.class.getName()).log(Level.SEVERE, null, ex);
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
            String quantity = request.getParameter("quantity");
            String itemNo = request.getParameter("id");
            int userID = HHPlazaDAO.getProfileByUsername(account.getUsername()).getCid();
            int orderNo = HHPlazaDAO.checkUserOrder(userID);
            if (account == null || account.isStatus() == false) {
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else if (account != null || account.isStatus() == true) {
                cart = HHPlazaDAO.getAllCart();
                request.setAttribute("cart", cart);
                request.getRequestDispatcher("ProductManagement.jsp").forward(request, response);
            } else if (quantity == null || quantity.equals("") && itemNo == null || itemNo.equals("")) {
                cart = HHPlazaDAO.getUserCart(orderNo);
                request.setAttribute("cart", cart);
                request.getRequestDispatcher("Cart.jsp").forward(request, response);
            } else if (Integer.parseInt(quantity) == 0) {
                HHPlazaDAO.deleteCart(orderNo, Integer.parseInt(itemNo));
                cart = HHPlazaDAO.getUserCart(orderNo);
                request.setAttribute("cart", cart);
                request.getRequestDispatcher("Cart.jsp").forward(request, response);
            } else if (Integer.parseInt(quantity) >= HHPlazaDAO.getStock(itemNo)) {
                HHPlazaDAO.addQuantity(HHPlazaDAO.getStock(itemNo), orderNo, itemNo);
                cart = HHPlazaDAO.getUserCart(orderNo);
                request.setAttribute("cart", cart);
                request.getRequestDispatcher("Cart.jsp").forward(request, response);
            } else {
                HHPlazaDAO.UpdateCart(orderNo, itemNo, Integer.parseInt(quantity));
                cart = HHPlazaDAO.getUserCart(orderNo);
                request.setAttribute("cart", cart);
                request.getRequestDispatcher("Cart.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Cart.class.getName()).log(Level.SEVERE, null, ex);
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
