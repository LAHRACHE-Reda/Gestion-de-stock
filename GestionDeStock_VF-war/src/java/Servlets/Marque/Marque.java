package Servlets.Marque;

import Ejb.MarqueFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Marque extends HttpServlet {

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
                request.setAttribute("marques", marqueFacade.findAll());
                System.out.println(marqueFacade.findAll());
                RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/marque.jsp");
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
