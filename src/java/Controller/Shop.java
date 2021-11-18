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
public class Shop extends HttpServlet {

    ArrayList<Customer> manageCus = new ArrayList<Customer>();
    ArrayList<Product> product = new ArrayList<Product>();
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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            Customer account = (Customer) session.getAttribute("account");
            request.setAttribute("account", account);
            String Add = request.getParameter("Add");
            String edit = request.getParameter("edit");
            String delete = request.getParameter("delete");
            if (account == null) {
                product = HHPlazaDAO.getAllProduct();
                request.setAttribute("product", product);
                request.getRequestDispatcher("shop.jsp").forward(request, response);
            } else {
                if (Add == null || Add.equals("")) {
                    product = HHPlazaDAO.getAllProduct();
                    request.setAttribute("product", product);
                    request.getRequestDispatcher("ProductManagement.jsp").forward(request, response);
                }
                if (Add != null) {
                    int id = HHPlazaDAO.CountCustomer();
                    String pid = String.valueOf(id);
                    String pname = request.getParameter("pname");
                    int stock = Integer.parseInt(request.getParameter("stock"));
                    double price = Double.parseDouble(request.getParameter("price"));
                    String image = request.getParameter("image");
                    String description = request.getParameter("description");
                    int cateID = Integer.parseInt(request.getParameter("cateID"));
                    String colorID = request.getParameter("colorID");

                }
                if (edit != null) {
                    product = HHPlazaDAO.getProductbyID(edit);
                    request.setAttribute("product", product);
                    request.getRequestDispatcher("EditProduct.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("Shop.jsp").forward(request, response);
                }
                if (delete != null) {
                    HHPlazaDAO.deleteProduct(delete);
                }
            }
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
            Logger.getLogger(Shop.class.getName()).log(Level.SEVERE, null, ex);
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
            if (account == null || account.isStatus() == false) {
                product = HHPlazaDAO.getAllProduct();
                request.setAttribute("product", product);
                request.getRequestDispatcher("shop.jsp").forward(request, response);
            } else {
                if (Add == null && edit == null && delete == null) {
                    product = HHPlazaDAO.getAllProduct();
                    request.setAttribute("product", product);
                    request.getRequestDispatcher("ProductManagement.jsp").forward(request, response);
                }
                if (Add != null) {
                    int id = HHPlazaDAO.CountCustomer();
                    String pid = request.getParameter("pname");
                    String pname = request.getParameter("pname");
                    int stock = Integer.parseInt(request.getParameter("stock"));
                    double price = Double.parseDouble(request.getParameter("price"));
                    String image = request.getParameter("image");
                    String description = request.getParameter("description");
                    int cateID = Integer.parseInt(request.getParameter("cateID"));
                    String colorID = request.getParameter("colorID");

                }
                if (edit != null) {
                    product = HHPlazaDAO.getProductbyID(edit);
                    request.setAttribute("product", product);
                    request.getRequestDispatcher("EditProduct.jsp").forward(request, response);
                }
                if (delete != null) {
                    HHPlazaDAO.deleteProduct(delete);
                    product = HHPlazaDAO.getAllProduct();
                    request.setAttribute("product", product);
                    request.getRequestDispatcher("ProductManagement.jsp").forward(request, response);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Shop.class.getName()).log(Level.SEVERE, null, ex);
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
