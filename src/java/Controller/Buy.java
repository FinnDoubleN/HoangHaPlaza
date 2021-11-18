/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.HHPlazaDAO;
import Model.CartUser;
import Model.Customer;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
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
public class Buy extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Buy</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Buy at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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

       try {
            HttpSession session = request.getSession();
            Customer account = (Customer) session.getAttribute("account");
            request.setAttribute("account", account);
            int buy = Integer.parseInt(request.getParameter("buy"));
            if (account == null || account.equals("")) {
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else {
                int userID = HHPlazaDAO.getProfileByUsername(account.getUsername()).getCid();
                int cartID = HHPlazaDAO.checkUserOrder(userID);
                if (buy != 0) {
                    double total = 0, tax = 0.1;
                    DecimalFormat format = new DecimalFormat("###,### VND");
                    ArrayList<CartUser> bill = HHPlazaDAO.getUserCart(cartID);
                    for (int i = 0; i < bill.size(); i++) {
                        int qty = bill.get(i).getItemQuantity();
                        int stock = HHPlazaDAO.getStock(bill.get(i).getProductID());
                        HHPlazaDAO.UpdateStock(stock - qty, bill.get(i).getProductID());
                    }
                    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    LocalDateTime localDate = LocalDateTime.now();
                    String date = dtf.format(localDate);
                    try (PrintWriter pw = new PrintWriter(new FileOutputStream("E:\\Code&make\\PRJ301BANTQ\\HoangHa_Plaza\\bill.txt"))) {
                        pw.write("           CASH RECEIPT           \n");
                        pw.write(HHPlazaDAO.getProfileByUsername(account.getUsername()).getCname()+ " - " + HHPlazaDAO.getProfileByUsername(account.getUsername()).getCphone()+ "\n");
                        pw.write(HHPlazaDAO.getProfileByUsername(account.getUsername()).getcAddress()+ "\n");
                        pw.write("----------------------------------\n");
                        for (CartUser c : bill) {
                            pw.write(c.getProductName() + " * " + c.getItemQuantity() + "   " + format.format(c.getProductPrice() * c.getItemQuantity()) + "\n");
                            total = total + c.getProductPrice() * c.getItemQuantity();
                        }
                        total = total + total * tax;
                        pw.write("----------------------------------\n");
                        pw.write("TOTAL: " + format.format(total) + "\n");
                        pw.write("----------------------------------\n");
                        pw.write("Tax                          10%\n");
                        pw.write("                          Hoang Ha Plaza\n");
                        pw.write(date + "               \n");
                        pw.write("             THANK YOU             ");
                        pw.close();
                    }
                }
                if (buy != 0) {
                    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                    LocalDate localDate = LocalDate.now();
                    String date = dtf.format(localDate);
                    HHPlazaDAO.createOrder(userID, date);
                    int cartNo = HHPlazaDAO.checkUserOrder(userID);
                    cart = HHPlazaDAO.getUserCart(cartNo);
                    request.setAttribute("cart", cart);
                    request.getRequestDispatcher("Cart.jsp").forward(request, response);
                } else {
                    cart = HHPlazaDAO.getUserCart(cartID);
                    request.setAttribute("cart", cart);
                    request.getRequestDispatcher("Cart.jsp").forward(request, response);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Buy.class.getName()).log(Level.SEVERE, null, ex);
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
