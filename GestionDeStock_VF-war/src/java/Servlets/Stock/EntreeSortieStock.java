
package Servlets.Stock;

import Ejb.MarqueFacadeLocal;
import Ejb.ProduitFacadeLocal;
import Ejb.StockFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class EntreeSortieStock extends HttpServlet {

    @EJB
    private StockFacadeLocal stockFacade;

    @EJB
    private ProduitFacadeLocal produitFacade;

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
                request.setAttribute("stocks", stockFacade.findAll());
                request.setAttribute("produits", produitFacade.findAll());
                RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/entreeSortieStock.jsp");
                disp.forward(request, response);
            }
        }catch(Exception e){
            response.sendRedirect("Login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("listByStock",stockFacade.allProductByStock(request.getParameter("stock")));
        request.setAttribute("monStock", request.getParameter("stock"));
        RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/entreeSortieStock.jsp");
        disp.forward(request, response);
    }


}
