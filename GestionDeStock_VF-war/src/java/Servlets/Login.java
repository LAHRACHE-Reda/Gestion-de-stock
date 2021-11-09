package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Login extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        try{
            String state = (String) session.getAttribute("state");
            if(!state.equals("login")){  // il n'est pas connecté 
                RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/login.jsp");
                disp.forward(request, response);
            }
            else{  // il est déja connecté
                response.sendRedirect("Accueil");
            }
        }catch(Exception e){
            RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/login.jsp");
            disp.forward(request, response);
        }
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        if(username.equals("admin") && password.equals("admin")){
            HttpSession session = request.getSession();
            session.setAttribute("state", "login");
            response.sendRedirect("Accueil");
        }
        else{
            request.setAttribute("login", "Erreur, verifier votre nom d'utilisateur et mot de passe");
            RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/login.jsp");
            disp.forward(request, response);
        }
    }


}
