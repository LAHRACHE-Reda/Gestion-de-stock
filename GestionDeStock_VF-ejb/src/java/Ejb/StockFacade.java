/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejb;

import Classes.ElementDeStock;
import Classes.ListeDeStock;
import Entity.Stock;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author HP
 */
@Stateless
public class StockFacade extends AbstractFacade<Stock> implements StockFacadeLocal {

    @PersistenceContext(unitName = "GestionDeStock_VF-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public StockFacade() {
        super(Stock.class);
    }

    @Override
    public Boolean creerStock(String nomStock) {
        Stock stock = (Stock) em.find(Stock.class, nomStock);
        if(stock==null){
            List<ElementDeStock> list = new ArrayList<ElementDeStock>();
            stock = new Stock(nomStock,new ListeDeStock(list));
            em.persist(stock);
            return true;
        }
        return false;
    }

    @Override
    public Boolean entreeStock(String nomStock, String refProduit, int quantite) {
        Stock stock = (Stock) em.find(Stock.class, nomStock);
        ElementDeStock element = new ElementDeStock(refProduit,quantite);
        if(stock==null){
            return false;
        }
        else{
            ListeDeStock listeDeStock = stock.getListeDeStock();
            Boolean existe = false;
            if(listeDeStock.getElementDeStock()!=null){
                for(ElementDeStock elt:listeDeStock.getElementDeStock()){
                    if(elt.getRefProduit().equals(refProduit)){
                        existe = true;
                    }
                }
            }


            if(existe){ // update
                System.out.println("test");
                int index = listeDeStock.getElementDeStock().indexOf(element);
                System.out.println(index);
                int oldQuantite = listeDeStock.getElementDeStock().get(index+1).getQuantite();
                System.out.println(oldQuantite);
                listeDeStock.getElementDeStock().remove(index+1);
                element.setQuantite(quantite+oldQuantite);
                listeDeStock.getElementDeStock().add(element);
                em.createQuery("update Stock s set s.listeDeStock=:listeDeStock where s.nomStock=:nomStock").setParameter("listeDeStock", stock.getListeDeStock()).setParameter("nomStock", nomStock).executeUpdate();

            }
            else{
                stock.getListeDeStock().getElementDeStock().add(element);
                em.createQuery("update Stock s set s.listeDeStock=:listeDeStock where s.nomStock=:nomStock").setParameter("listeDeStock", stock.getListeDeStock()).setParameter("nomStock", nomStock).executeUpdate();
            }
            return true;
        }
    }

    @Override
    public Boolean sortieStock(String nomStock, String refProduit, int quantite) {
        Stock stock = (Stock) em.find(Stock.class, nomStock);
        ElementDeStock element = new ElementDeStock(refProduit,quantite);
        if(stock==null){
            return false;
        }
        else{
            ListeDeStock listeDeStock = stock.getListeDeStock();
            Boolean existe = false;
            if(listeDeStock.getElementDeStock()!=null){
                for(ElementDeStock elt:listeDeStock.getElementDeStock()){
                    if(elt.getRefProduit().equals(refProduit)){
                        existe = true;
                    }
                }
            }


            if(existe){ // update
                System.out.println("test");
                int index = listeDeStock.getElementDeStock().indexOf(element);
                System.out.println(index);
                int oldQuantite = listeDeStock.getElementDeStock().get(index+1).getQuantite();
                System.out.println(oldQuantite);
                listeDeStock.getElementDeStock().remove(index+1);
                element.setQuantite(oldQuantite-quantite);
                listeDeStock.getElementDeStock().add(element);
                em.createQuery("update Stock s set s.listeDeStock=:listeDeStock where s.nomStock=:nomStock").setParameter("listeDeStock", stock.getListeDeStock()).setParameter("nomStock", nomStock).executeUpdate();

            }
            else{
                stock.getListeDeStock().getElementDeStock().add(element);
                em.createQuery("update Stock s set s.listeDeStock=:listeDeStock where s.nomStock=:nomStock").setParameter("listeDeStock", stock.getListeDeStock()).setParameter("nomStock", nomStock).executeUpdate();
            }
            return true;
        }
    }

    @Override
    public List<ElementDeStock> allProductByStock(String nomStock) {
        Stock stock = em.find(Stock.class, nomStock);
        return stock.getListeDeStock().getElementDeStock();
    }
    
    
    
}
