/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets.Stock;

import Ejb.StockFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SortieStock extends HttpServlet {

    @EJB
    private StockFacadeLocal stockFacade;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nomStock = (String) request.getParameter("nomStock");
        String refProduit = (String) request.getParameter("refProduit");
        int quantite = Integer.parseInt(request.getParameter("quantite"));

            Boolean entree = stockFacade.sortieStock(nomStock, refProduit, quantite);
            if(entree){
                response.sendRedirect("EntreeSortieStock");
            }else{
                request.setAttribute("erreur", "Erreur !");
                RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/entreeSortieStock.jsp");
                disp.forward(request, response);
            }
    }


}
