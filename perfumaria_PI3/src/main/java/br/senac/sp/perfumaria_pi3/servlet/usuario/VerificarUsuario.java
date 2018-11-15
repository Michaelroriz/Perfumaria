package br.senac.sp.perfumaria_pi3.servlet.usuario;

import br.senac.sp.perfumaria.pi3.dao.UsuarioDAO;
import br.senac.sp.perfumaria.pi3.model.Usuario;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

@WebServlet(name = "VerificarUsuario", urlPatterns = {"/VerificarUsuario"})
public class VerificarUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("index.html").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String login = request.getParameter("username");
        String senha = request.getParameter("userPass");
        Usuario u = new Usuario();
        String user = null;
        try {
            u = UsuarioDAO.verificar(login, senha);
            user = u.getLogin();
            if (user.equals(login)) {
                
//                RequestDispatcher dispatcher
//                = request.getRequestDispatcher("menu.jsp");
//        dispatcher.forward(request, response);
                request.getRequestDispatcher("menu.jsp").forward(request, response);

            } else {                
//                RequestDispatcher dispatcher
//                        = request.getRequestDispatcher("index.html");
//                dispatcher.forward(request, response);
                request.getRequestDispatcher("index.html").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
