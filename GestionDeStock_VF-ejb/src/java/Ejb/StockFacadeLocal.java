/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejb;

import Classes.ElementDeStock;
import Classes.ListeDeStock;
import Entity.Stock;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author HP
 */
@Local
public interface StockFacadeLocal {

    void create(Stock stock);

    void edit(Stock stock);

    void remove(Stock stock);

    Stock find(Object id);

    List<Stock> findAll();

    List<Stock> findRange(int[] range);

    int count();

    Boolean creerStock(String nomStock);

    Boolean entreeStock(String nomStock, String refProduit, int quantite);

    Boolean sortieStock(String nomStock, String refProduit, int quantite);

    List<ElementDeStock> allProductByStock(String nomStock);
    
}
