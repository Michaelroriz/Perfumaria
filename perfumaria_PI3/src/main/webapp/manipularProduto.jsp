<%-- 
    Document   : cadastroProduto
    Created on : 05/11/2016, 20:36:01
    Author     : Michael Facul
--%>

<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="br.senac.sp.perfumaria.pi3.model.Produto"%>
<%@page import="br.senac.sp.perfumaria.pi3.dao.ProdutoDAO"%>
<%@page import="br.senac.sp.perfumaria_pi3.servlet.ExcluirProduto"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="formatacao.css" type="text/css" rel="stylesheet" />
        <title>Manipular Produto</title>
        <meta charset="UTF-8">
        
    </head>
    <body>
        <nav>
            <ul class="menu">
                <li><a href="pesquisaproduto.jsp">Pesquisar produto</a></li> 
                <li><a href="produto.jsp">Cadastrar novo produto</a></li>                                         
                <li><a href="menu.jsp">Voltar ao menu</a></li>
                <li><a href="#">Usuário: ${nome}</a></li>
            </ul>            
        </nav> 
        <aside>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
            <div>               
                <br><br><br><br><br><br><br><h1>Lista de Produtos</h1>                
                <hr />

                <%
                    
                    
                    Connection conexao = ProdutoDAO.obterConexao();

                    ProdutoDAO dao = new ProdutoDAO(conexao);

                    List<Produto> produto = dao.listarProdutos();

                    

                %>
                <br><br><br><table id="tblProduto" border="1" cellPadding ="5">         
                    <tr>
                        <th>Id</th>
                        <th>Nome</th>
                        <th>Marca</th>
                        <th>Descrição</th>
                        <th>Preço_Compra</th>
                        <th>Preço_Venda</th>
                        <th>Qtd</th>                        
                        <th>Data_Cadastro</th>
                    </tr>

                    <% for (Produto p : produto) {
                    %>
                    <tr>
                        <td><%= p.getId()%></td>
                        <td><%= p.getNome()%></td>
                        <td><%= p.getMarca()%></td>
                        <td><%= p.getDescricao()%></td>
                        <td><%= p.getPrecoCompra()%></td>
                        <td><%= p.getPrecoVenda()%></td>
                        <td><%= p.getQuantidade()%></td>                         
                        <td><%= p.getDataCadastro()%></td>                                                                      
                        </td>
                        <td> <a href="ExcluirProduto?id=<%=p.getId()%>">Excluir</a></td>
                        <td> <a href="AlterarProduto?id=<%=p.getId()%>&nome=<%= p.getNome()%>&marca=<%= p.getMarca()%>
                                &descricao=<%=p.getDescricao()%>
                                &preco_compra=<%= p.getPrecoCompra()%>&preco_venda=<%= p.getPrecoVenda()%>
                                &quantidade=<%= p.getQuantidade()%>">                               
                                Alterar</a></td>
                    </tr>              
                    <%}%>
                </table>                 
            </div>
        </aside> 
    </body>
</html>
