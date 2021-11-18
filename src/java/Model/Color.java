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
public class Color {
    public String colorID;
    public String image;

    public Color() {
    }

    public Color(String colorID, String image) {
        this.colorID = colorID;
        this.image = image;
    }

    public String getColorID() {
        return colorID;
    }

    public void setColorID(String colorID) {
        this.colorID = colorID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Color{" + "colorID=" + colorID + ", image=" + image + '}';
    }
    
}
