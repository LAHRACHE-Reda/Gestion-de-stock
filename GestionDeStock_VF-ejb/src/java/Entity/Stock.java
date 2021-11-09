/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import Classes.ListeDeStock;
import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author HP
 */
@Entity
public class Stock implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    private String nomStock;
    private ListeDeStock listeDeStock;

    
    public Stock(String nomStock, ListeDeStock listeDeStock) {
        this.nomStock = nomStock;
        this.listeDeStock = listeDeStock;
    }

    public Stock() {
    }

    public String getNomStock() {
        return nomStock;
    }

    public void setNomStock(String nomStock) {
        this.nomStock = nomStock;
    }

    public ListeDeStock getListeDeStock() {
        return listeDeStock;
    }

    public void setListeDeStock(ListeDeStock listeDeStock) {
        this.listeDeStock = listeDeStock;
    }
    
    
    
}
