/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author ADMIN
 */
public class CartUser {
    int cid;
    int oID;
    String productID;
    String productName;
    String productColor;
    String productPath;
    double productPrice;
    int productQuantity;
    int itemQuantity;   
    String sess;

    public CartUser() {
    }

    public CartUser(String productID, String productName, String productColor, String productPath, double productPrice, int productQuantity, int itemQuantity) {
        this.productID = productID;
        this.productName = productName;
        this.productColor = productColor;
        this.productPath = productPath;
        this.productPrice = productPrice;
        this.productQuantity = productQuantity;
        this.itemQuantity = itemQuantity;
    }
    public CartUser(int cid, int oID, String productID, String productName, String productColor, String productPath, double productPrice, int productQuantity, int itemQuantity, String sess) {
        this.cid = cid;
        this.oID = oID;
        this.productID = productID;
        this.productName = productName;
        this.productColor = productColor;
        this.productPath = productPath;
        this.productPrice = productPrice;
        this.productQuantity = productQuantity;
        this.itemQuantity = itemQuantity;
        this.sess = sess;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getoID() {
        return oID;
    }

    public void setoID(int oID) {
        this.oID = oID;
    }

    public String getSess() {
        return sess;
    }

    public void setSess(String sess) {
        this.sess = sess;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductColor() {
        return productColor;
    }

    public void setProductColor(String productColor) {
        this.productColor = productColor;
    }

    public String getProductPath() {
        return productPath;
    }

    public void setProductPath(String productPath) {
        this.productPath = productPath;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public int getItemQuantity() {
        return itemQuantity;
    }

    public void setItemQuantity(int itemQuantity) {
        this.itemQuantity = itemQuantity;
    }

    
}
