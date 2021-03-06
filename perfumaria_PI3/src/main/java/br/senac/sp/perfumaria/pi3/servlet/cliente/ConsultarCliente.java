/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.sp.perfumaria.pi3.servlet.cliente;

import br.senac.sp.perfumaria.pi3.dao.ClienteDAO;
import br.senac.sp.perfumaria.pi3.model.Cliente;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bruno
 */
@WebServlet(name = "ConsultarCliente", urlPatterns = {"/ConsultarCliente"})
public class ConsultarCliente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/Cliente/pesquisarCliente.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        //Variavel do id
        long id = Long.parseLong(request.getParameter("id"));

        Cliente cliente = null;
        try {
            if (ClienteDAO.pesquisar(id) != null) {
                cliente = ClienteDAO.pesquisar(id);
                request.setAttribute("cliente", cliente);
                //Request diretorio
                request.getRequestDispatcher("WEB-INF/Cliente/resultadoConsulta.jsp").forward(request, response);
            } else {
                //Request diretorio
                request.getRequestDispatcher("WEB-INF/Cliente/pesquisarCliente.jsp").forward(request, response);
            }
        } catch (Exception e) {
        }
    }
}
