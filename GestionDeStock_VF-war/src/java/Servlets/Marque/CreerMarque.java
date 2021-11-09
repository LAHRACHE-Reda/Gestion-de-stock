/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets.Marque;

import Ejb.MarqueFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class CreerMarque extends HttpServlet {

    @EJB
    private MarqueFacadeLocal marqueFacade;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        try{
            String state = (String) session.getAttribute("state");
            if(!state.equals("login")){  // il n'est pas connecté 
                response.sendRedirect("Login");
            }
            else{  // il est déja connecté
                RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/creerMarque.jsp");
                disp.forward(request, response);
            }
        }catch(Exception e){
            response.sendRedirect("Login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String marque = (String) request.getParameter("marque");
        String origine = (String) request.getParameter("origine");
        
        if(!( (marque.isEmpty() || marque.equals(" ") ) || (origine.isEmpty() || origine.equals(" ") ) )){
            Boolean created = marqueFacade.creerMarque(marque, origine);
            if(created){
                response.sendRedirect("Marque");
            }else{
                request.setAttribute("erreur", "Cette marque existe déja !");
                RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/creerMarque.jsp");
                disp.forward(request, response);
            }
        }
        else{
            request.setAttribute("erreur", "Vous devez remplir tous les champs !");
            RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/creerMarque.jsp");
            disp.forward(request, response);
        }
    }


}
