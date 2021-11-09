/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import java.io.Serializable;

/**
 *
 * @author HP
 */
public class ElementDeStock implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    private String refProduit;
    private int quantite;

    public ElementDeStock(String refProduit, int quantite) {
        this.refProduit = refProduit;
        this.quantite = quantite;
    }

    public ElementDeStock() {
    }

    
    
    
    public String getRefProduit() {
        return refProduit;
    }

    public void setRefProduit(String refProduit) {
        this.refProduit = refProduit;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }
    
    
}
