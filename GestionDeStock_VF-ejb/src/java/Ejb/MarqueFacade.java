/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejb;

import Entity.Marque;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author HP
 */
@Stateless
public class MarqueFacade extends AbstractFacade<Marque> implements MarqueFacadeLocal {

    @PersistenceContext(unitName = "GestionDeStock_VF-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MarqueFacade() {
        super(Marque.class);
    }

    @Override
    public Boolean creerMarque(String nomMarque, String origine) {
        Marque marque = (Marque) em.find(Marque.class, nomMarque);
        
        if(marque == null){
            marque = new Marque(nomMarque,origine);
            em.persist(marque);
            return true;
        }
        else{
            return false;
        }
    }

    @Override
    public Boolean SupprimerMarque(String nomMarque) {
        Marque marque = (Marque) em.find(Marque.class, nomMarque);
        if(marque == null){
            return false;
        }
        else{
            remove(marque);
            return true;
        }
    }

    @Override
    public Boolean modifierMarque(String nomMarque, String origine) {
        Marque marque = (Marque) em.find(Marque.class, nomMarque);
        if(marque == null){
            return false;
        }
        else{
            em.createQuery("update Marque m set m.origine =:origine where m.marque =:nomMarque").setParameter("origine", origine).setParameter("nomMarque", nomMarque).executeUpdate();
            return true;
        }
    }
    
    
    
}
