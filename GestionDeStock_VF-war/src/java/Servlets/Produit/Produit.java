package Servlets.Produit;

import Ejb.MarqueFacadeLocal;
import Ejb.ProduitFacadeLocal;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Produit extends HttpServlet {

    @EJB
    private MarqueFacadeLocal marqueFacade;

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
                request.setAttribute("marques", marqueFacade.findAll());
                if(request.getParameter("marque")!=null && !request.getParameter("marque").equals("tous")){
                    request.setAttribute("produits", produitFacade.findAllByMarque(request.getParameter("marque")));
                }else{
                    request.setAttribute("produits", produitFacade.findAll());
                }
                
                RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/produit.jsp");
                disp.forward(request, response);
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
