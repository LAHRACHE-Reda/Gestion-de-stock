/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets.Produit;

import Ejb.MarqueFacadeLocal;
import Ejb.ProduitFacadeLocal;
import Entity.Marque;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CreerProduit extends HttpServlet {

    @EJB
    private MarqueFacadeLocal marqueFacade;

    @EJB
    private ProduitFacadeLocal produitFacade;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("marques", marqueFacade.findAll());
        RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/creerProduit.jsp");
        disp.forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String refProduit = (String) request.getParameter("refProduit");
        String marque = (String) request.getParameter("marque");
        String denomination = (String) request.getParameter("denomination");
        float prix = Float.parseFloat(request.getParameter("prix"));
        float poids = Float.parseFloat(request.getParameter("poids"));
        float volume = Float.parseFloat(request.getParameter("volume"));
        
        Marque marqueProduit = marqueFacade.find(marque);
        
            Boolean created = produitFacade.creerProduit(refProduit, marqueProduit, denomination, prix, poids, volume);
            if(created){
                response.sendRedirect("Produit");
            }else{
                request.setAttribute("erreur", "Ce produit existe déja !");
                RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/creerMarque.jsp");
                disp.forward(request, response);
            }

    }


}
