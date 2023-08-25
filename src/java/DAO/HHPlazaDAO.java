/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.CartUser;
import Model.Category;
import Model.Color;
import Model.Customer;
import Model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class HHPlazaDAO {
    
    public static Boolean IsMember(String username, String password) throws SQLException {
        try (Connection conn = DBContext.getConnection()) {
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery("select count(*) 'count' \n"
                    + "from Customer\n"
                    + "where username = '" + username + "' and password = '" + password + "'");
            while (rs.next()) {
                int count = rs.getInt("count");
                if (count != 0) {
                    return true;
                }
            }
        }
        return false;
    }
    
    public static int AddCustomer(int cid, String username, String password, String cname, String cphone, String cAddress) throws SQLException {
        Connection conn = DBContext.getConnection();
        String sql = "insert into Customer(cid, username, password, cname, cphone, cAddress) values(?,?,?,?,?,?)";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, cid);
        pst.setString(2, username);
        pst.setString(3, password);
        pst.setString(4, cname);
        pst.setString(5, cphone);
        pst.setString(6, cAddress);
        return pst.executeUpdate();
    }
    
    public static Customer getProfileByUsername(String username) throws SQLException {
        try (Connection conn = DBContext.getConnection()) {
            String sql = "select cid, username, password, cname, cphone, cAddress, status from Customer where username = ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, username);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Customer p = new Customer(
                        rs.getInt("cid"),
                        rs.getString("cname"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("cphone"),
                        rs.getString("cAddress"),
                        rs.getBoolean("status"));
                return p;
            }
        }
        return null;
    }
    
    public static int UpdateProfile(String username, String password, String cname, String cphone, String cAddress) throws SQLException {
        Connection conn = DBContext.getConnection();
        String sql = "update Customer set password = ?, cname = ?, cphone = ?, cAddress = ? where username = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, password);
        pst.setString(2, cname);
        pst.setString(3, cphone);
        pst.setString(4, cAddress);
        pst.setString(5, username);
        return pst.executeUpdate();
    }
    
    public static int CountCustomer() throws SQLException {
        try (Connection conn = DBContext.getConnection()) {
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery("select count(*) 'count' from Customer");
            while (rs.next()) {
                int count = rs.getInt("count");
                if (count != 0) {
                    return count + 1;
                } else {
                    return 0;
                }
            }
        }
        return 0;
    }
    
    public static Boolean CheckUsername(String username) throws SQLException {
        try (Connection conn = DBContext.getConnection()) {
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery("select count(*) 'count' \n"
                    + "from Customer\n"
                    + "where username = '" + username + "'");
            while (rs.next()) {
                int count = rs.getInt("count");
                if (count != 0) {
                    return true;
                }
            }
        }
        return false;
    }
    
    public static int checkOrderItem(int id) throws SQLException {
        try (Connection conn = DBContext.getConnection()) {
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery("select oID as 'orderNo' from item where oID = '" + id + "'");
            while (rs.next()) {
                int count = rs.getInt("orderNo");
                if (count != 0) {
                    return count;
                }
            }
        }
        return 0;
    }
    
    public static ArrayList<Product> getAllProduct() throws SQLException {
        ArrayList<Product> list;
        try (Connection conn = DBContext.getConnection()) {
            Statement statement = conn.createStatement();
            list = new ArrayList<>();
            ResultSet rs = statement.executeQuery("select pid, pname, stock, price, image, description, cateID, colorID from Product");
            while (rs.next()) {
                Product p = new Product(
                        rs.getString("pid"),
                        rs.getString("pname"),
                        rs.getInt("stock"),
                        rs.getDouble("price"),
                        rs.getString("image"),
                        rs.getString("description"),
                        rs.getInt("cateID"),
                        rs.getString("colorID"));
                list.add(p);
            }
            conn.close();
        }
        return list;
    }
    
    public static ArrayList<Category> getAllCategory() throws SQLException {
        ArrayList<Category> list;
        try (Connection conn = DBContext.getConnection()) {
            Statement statement = conn.createStatement();
            list = new ArrayList<>();
            ResultSet rs = statement.executeQuery("select cateID, cateName from Category");
            while (rs.next()) {
                Category c = new Category(
                        rs.getInt("cateID"),
                        rs.getString("cateName"));
                list.add(c);
            }
            conn.close();
        }
        return list;
    }
    
    public static ArrayList<Customer> getAllCustomer() throws SQLException {
        ArrayList<Customer> list;
        try (Connection conn = DBContext.getConnection()) {
            Statement statement = conn.createStatement();
            list = new ArrayList<>();
            ResultSet rs = statement.executeQuery("select cid, cname, username, password, cphone, cAddress, status from Customer");
            while (rs.next()) {
                Customer c = new Customer(
                        rs.getInt("cid"),
                        rs.getString("cname"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("cphone"),
                        rs.getString("cAddress"),
                        rs.getBoolean("status"));
                list.add(c);
            }
            conn.close();
        }
        return list;
    }
    
    public static ArrayList<CartUser> getAllCart() throws SQLException {
        ArrayList<CartUser> list;
        try (Connection conn = DBContext.getConnection()) {
            Statement statement = conn.createStatement();
            list = new ArrayList<>();
            ResultSet rs = statement.executeQuery("select o.cid,o.oID,p.pid, p.pname, p.colorID, p.image, p.price, p.stock, i.quantity, i.sess from Product p join item i on p.pid = i.pid join ordr o on o.oID = i.oID");
            while (rs.next()) {
                CartUser c = new CartUser(
                        rs.getInt("cid"),
                        rs.getInt("oID"),
                        rs.getString("pid"),
                        rs.getString("pname"),
                        rs.getString("colorID"),
                        rs.getString("image"),
                        rs.getDouble("price"),
                        rs.getInt("stock"),
                        rs.getInt("quantity"),
                        rs.getString("sess"));
                list.add(c);
            }
            conn.close();
        }
        return list;
    }
    
    public static ArrayList<Color> getColor() throws SQLException {
        ArrayList<Color> list;
        try (Connection conn = DBContext.getConnection()) {
            Statement statement = conn.createStatement();
            list = new ArrayList<>();
            ResultSet rs = statement.executeQuery("select colorID, image from Color");
            while (rs.next()) {
                Color c = new Color(
                        rs.getString("colorID"),
                        rs.getString("image"));
                list.add(c);
            }
            conn.close();
        }
        return list;
    }
    
    public static int createOrder(int id, String date) throws SQLException {
        Connection conn = DBContext.getConnection();
        String sql = "insert into ordr(cid, odate) values(?,?)";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        pst.setString(2, date);
        return pst.executeUpdate();
    }
    
    public static ArrayList<CartUser> getUserCart(int id) throws SQLException {
        ArrayList<CartUser> list;
        try (Connection conn = DBContext.getConnection()) {
            Statement statement = conn.createStatement();
            list = new ArrayList<>();
            ResultSet rs = statement.executeQuery("select p.pid, p.pname, p.colorID, p.image, p.price, p.stock, i.quantity from Product p join item i on p.pid = i.pid where i.oID = '" + id + "'");
            while (rs.next()) {
                CartUser c = new CartUser(
                        rs.getString("pid"),
                        rs.getString("pname"),
                        rs.getString("colorID"),
                        rs.getString("image"),
                        rs.getDouble("price"),
                        rs.getInt("stock"),
                        rs.getInt("quantity"));
                list.add(c);
            }
            conn.close();
        }
        return list;
    }
    
    public static ArrayList<Product> getProductbyID(String pid) throws SQLException {
        ArrayList<Product> list;
        try (Connection conn = DBContext.getConnection()) {
            Statement statement = conn.createStatement();
            list = new ArrayList<>();
            ResultSet rs = statement.executeQuery("select pid, pname, stock, price, image, description, cateID, colorID from Product where pid = '" + pid + "'");
            while (rs.next()) {
                Product p = new Product(
                        rs.getString("pid"),
                        rs.getString("pname"),
                        rs.getInt("stock"),
                        rs.getDouble("price"),
                        rs.getString("image"),
                        rs.getString("description"),
                        rs.getInt("cateID"),
                        rs.getString("colorID"));
                list.add(p);
            }
            conn.close();
        }
        return list;
    }
    
    public static ArrayList<Category> getCategorybyID(String cateID) throws SQLException {
        ArrayList<Category> list;
        try (Connection conn = DBContext.getConnection()) {
            Statement statement = conn.createStatement();
            list = new ArrayList<>();
            ResultSet rs = statement.executeQuery("select cateID, cateName from Product where cateID = '" + cateID + "'");
            while (rs.next()) {
                Category c = new Category(
                        rs.getInt("cateID"),
                        rs.getString("cateName"));
                list.add(c);
            }
            conn.close();
        }
        return list;
    }
    
    public static int checkUserOrder(int id) throws SQLException {
        try (Connection conn = DBContext.getConnection()) {
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery("select MAX(oID) as 'orderNo' from ordr where cid = '" + id + "'");
            while (rs.next()) {
                int count = rs.getInt("orderNo");
                if (count != 0) {
                    return count;
                }
            }
        }
        return 0;
    }
    
    public static int addItem(int oID, String pid, int quantity) throws SQLException {
        Connection conn = DBContext.getConnection();
        String sql = "insert into item(oID, pid, quantity) values(?,?,?)";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, oID);
        pst.setString(2, pid);
        pst.setInt(3, quantity);
        return pst.executeUpdate();
    }
    
    public static int UpdateCart(int cartID, String prdID, int quantity) throws SQLException {
        Connection conn = DBContext.getConnection();
        String sql = "update item set quantity = ? where oID = ? and pid = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, quantity);
        pst.setInt(2, cartID);
        pst.setString(3, prdID);
        return pst.executeUpdate();
    }
    
    public static int UpdateOrderTime(int orderNo, int id, String date) throws SQLException {
        Connection conn = DBContext.getConnection();
        String sql = "update ordr set odate = ? where oID = ? and cid = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, date);
        pst.setInt(2, orderNo);
        pst.setInt(3, id);
        return pst.executeUpdate();
    }
    
    public static int deleteCart(int cartID, int prdID) throws SQLException {
        Connection conn = DBContext.getConnection();
        String sql = "delete item where oID = ? and pid = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, cartID);
        pst.setInt(2, prdID);
        return pst.executeUpdate();
    }
    
    public static boolean checkDuplicateItem(int orderNo, String itemNo) throws SQLException {
        try (Connection conn = DBContext.getConnection()) {
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery("select pid from item where oID = '" + orderNo + "' and pid = '" + itemNo + "'");
            while (rs.next()) {
                int count = rs.getInt("pid");
                if (count != 0) {
                    return true;
                }
            }
        }
        return false;
    }
    
    public static int getQuantity(int orderNo, String itemNo) throws SQLException {
        try (Connection conn = DBContext.getConnection()) {
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery("select quantity from item where oID = '" + orderNo + "' and pid = '" + itemNo + "'");
            while (rs.next()) {
                int qty = rs.getInt("quantity");
                if (qty != 0) {
                    return qty;
                }
            }
        }
        return 0;
    }
    
    public static int getStock(String itemNo) throws SQLException {
        try (Connection conn = DBContext.getConnection()) {
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery("select stock from Product where pid = '" + itemNo + "'");
            while (rs.next()) {
                int qty = rs.getInt("stock");
                if (qty != 0) {
                    return qty;
                }
            }
        }
        return 0;
    }
    
    public static int addQuantity(int quantity, int orderNo, String itemNo) throws SQLException {
        Connection conn = DBContext.getConnection();
        String sql = "update item set quantity = ? where oID = ? and pid = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, quantity);
        pst.setInt(2, orderNo);
        pst.setString(3, itemNo);
        return pst.executeUpdate();
    }
    
    public static int UpdateStock(int stock, String itemNo) throws SQLException {
        Connection conn = DBContext.getConnection();
        String sql = "update Product set stock = ? where pid = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, stock);
        pst.setString(2, itemNo);
        return pst.executeUpdate();
    }
    
    public static int deleteCus(int id) throws SQLException {
        Connection conn = DBContext.getConnection();
        String sql = "delete Customer where cid = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, id);
        return pst.executeUpdate();
    }

    public static int UpdateUser(int cid, String username, String password, String cname, String cphone, String cAddresss, String status) throws SQLException {
        Connection conn = DBContext.getConnection();
        String sql = "update Customer set username = ?, password = ?, cname = ?, cphone = ?, cAddress = ?, status = ? where cid = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, username);
        pst.setString(2, password);
        pst.setString(3, cname);
        pst.setString(4, cphone);
        pst.setString(5, cAddresss);
        pst.setString(6, status);
        pst.setInt(7, cid);
        return pst.executeUpdate();
    }
    
//    public static int UpdateUser(int cid, String username, String password, String cname, String cphone, String cAddresss, String status) throws SQLException {
//        Connection conn = DBContext.getConnection();
//        String sql = "update Customer set username = ?, password = ?, cname = ?, cphone = ?, cAddress = ?, status = ? where cid = ?";
//        PreparedStatement pst = conn.prepareStatement(sql);
//        pst.setString(1, username);
//        pst.setString(2, password);
//        pst.setString(3, cname);
//        pst.setString(4, cphone);
//        pst.setString(5, cAddresss);
//        pst.setString(6, status);
//        pst.setInt(7, cid);
//        return pst.executeUpdate();
//    }
    
//    public static int UpdateSess(int cid, int oID, String productID, String productName, String productColor, String productPath, double productPrice, int productQuantity, int itemQuantity, String sess) throws SQLException {
//        Connection conn = DBContext.getConnection();
//        String sql = "Select i.sess  from item i where i.oID = 1";
//        PreparedStatement pst = conn.prepareStatement(sql);
//        pst.setString(1, username);
//        pst.setInt(7, cid);
//        return pst.executeUpdate();
//    }
    
    public static int UpdateProduct(String pid, String pname,int stock, double price, String image, String description, int cateID, String colorID) throws SQLException {
        Connection conn = DBContext.getConnection();
        String sql = "update Product set pname = ?, stock = ?, price = ?, image = ?, description = ?, cateID = ?, colorID = ? where pid = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, pname);
        pst.setInt(2, stock);
        pst.setDouble(3, price);
        pst.setString(4, image);
        pst.setString(5, description);
        pst.setInt(6, cateID);
        pst.setString(7, colorID);
        pst.setString(8, pid);
        return pst.executeUpdate();
    }
    public static int deleteProduct(String pid) throws SQLException {
        Connection conn = DBContext.getConnection();
        String sql = "delete Product where pid = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, pid);
        return pst.executeUpdate();
    }
    public static int addProduct(String pid, String pname, int stock, double price, String image, String description, int cateID, String colorID) throws SQLException {
        Connection conn = DBContext.getConnection();
        String sql = "insert into Product(pid, pname, stock, price, image, description, cateID, colorID) values (?,?,?,?,?,?,?,?)";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, pid);
        pst.setString(2, pname);
        pst.setInt(3, stock);
        pst.setDouble(4, price);
        pst.setString(5, image);
        pst.setString(5, description);
        pst.setInt(5, cateID);
        pst.setString(5, colorID);
        return pst.executeUpdate();
    }
}
