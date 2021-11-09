/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejb;

import Entity.Marque;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author HP
 */
@Local
public interface MarqueFacadeLocal {

    void create(Marque marque);

    void edit(Marque marque);

    void remove(Marque marque);

    Marque find(Object id);

    List<Marque> findAll();

    List<Marque> findRange(int[] range);

    int count();

    Boolean creerMarque(String nomMarque, String origine);

    Boolean SupprimerMarque(String nomMarque);

    Boolean modifierMarque(String nomMarque, String origine);
    
    
    
}
