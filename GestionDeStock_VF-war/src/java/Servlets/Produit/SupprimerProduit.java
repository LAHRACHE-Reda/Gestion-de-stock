
package Servlets.Produit;

import Ejb.ProduitFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class SupprimerProduit extends HttpServlet {

    @EJB
    private ProduitFacadeLocal produitFacade;

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
                String refProduit = (String) request.getParameter("refProduit");
                if(produitFacade.supprimerProduit(refProduit)){
                    response.sendRedirect("Produit");
                }else{
                    RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/error404.jsp");
                    disp.forward(request, response);
                }
                
            }
        }catch(Exception e){
            response.sendRedirect("Login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


}
