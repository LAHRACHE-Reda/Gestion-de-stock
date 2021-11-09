/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author HP
 */
public class ListeDeStock implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    private List<ElementDeStock> elementDeStock;

    public ListeDeStock(List<ElementDeStock> elementDeStock) {
        this.elementDeStock = elementDeStock;
    }


    public List<ElementDeStock> getElementDeStock() {
        return elementDeStock;
    }

    public void setElementDeStock(List<ElementDeStock> elementDeStock) {
        this.elementDeStock = elementDeStock;
    }
    
}
