/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejb;

import Entity.Marque;
import Entity.Produit;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author HP
 */
@Local
public interface ProduitFacadeLocal {

    void create(Produit produit);

    void edit(Produit produit);

    void remove(Produit produit);

    Produit find(Object id);

    List<Produit> findAll();

    List<Produit> findRange(int[] range);

    int count();

    Boolean creerProduit(String refProduit, Marque marqueProduit, String denomination, float prix, float poids, float volume);

    Boolean supprimerProduit(String refProduit);

    List<Produit> findAllByMarque(String marque);

    Boolean modifierProduit(String refProduit, String marqueProduit, String denomination, float prix, float poids, float volume);
    
}
