package br.senac.sp.perfumaria_pi3.servlet.venda;

import br.senac.sp.perfumaria.pi3.dao.ClienteDAO;
import br.senac.sp.perfumaria.pi3.dao.UsuarioDAO;
import br.senac.sp.perfumaria.pi3.dao.VendaDAO;
import br.senac.sp.perfumaria.pi3.model.Cliente;
import br.senac.sp.perfumaria.pi3.model.Funcionario;
import br.senac.sp.perfumaria.pi3.model.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author michael.aroriz
 */
@WebServlet(name = "Venda", urlPatterns = {"/Venda"})
public class Venda extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
       
        Long idCliente = 0L;
        List<Cliente> cliente = new ArrayList<Cliente>();
        List<Produto> produto = new ArrayList<Produto>();
        try {
           cliente = VendaDAO.obterCliente(idCliente);
           produto = VendaDAO.obterProduto();
        } catch (Exception e) {
             e.printStackTrace();
        }
          
        request.setAttribute("cliente", cliente);
        request.setAttribute("prod", produto);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/Venda/venda1.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {


        
        
        
        try {
        } catch (Exception e) {
        }

        RequestDispatcher dispatcher
                = request.getRequestDispatcher(
                        "menu.jsp");
        dispatcher.forward(request, response);

    }
}

