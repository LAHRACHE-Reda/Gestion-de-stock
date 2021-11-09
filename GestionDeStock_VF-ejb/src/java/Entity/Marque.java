/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.util.ArrayList;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author HP
 */
@Entity
public class Marque implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    private String marque;
    private String origine;
    @OneToMany 
    private ArrayList<Produit> listeProduits = new ArrayList<Produit>();

    public Marque() {
    }

    public Marque(String marque, String origine) {
        this.marque = marque;
        this.origine = origine;
    }

    public String getMarque() {
        return marque;
    }

    public void setMarque(String marque) {
        this.marque = marque;
    }

    public String getOrigine() {
        return origine;
    }

    public void setOrigine(String origine) {
        this.origine = origine;
    }

    public ArrayList<Produit> getListeProduits() {
        return listeProduits;
    }

    public void setListeProduits(ArrayList<Produit> listeProduits) {
        this.listeProduits = listeProduits;
    }
    
    
}
