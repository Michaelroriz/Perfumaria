<%-- 
    Document   : logado
    Created on : 29/10/2016, 10:15:57
    Author     : willian.carvalho
--%>

<!DOCTYPE html>
<html>
    <head>
       
        <link href="formatacao.css" type="text/css" rel="stylesheet" />
        <title>Menu Principal</title>
        <meta charset="UTF-8">
                
    </head>
    <body>
        <c:import url="cabecalho.jsp"/>
        <nav >
            <ul class="menu">
                <li><a href="#">Cadastros</a>
                    <ul>
                        <li><a href="cliente.jsp">Clientes</a></li>
                        <li><a href="fornecedor.jsp">Fornecedores</a></li>                         
                        <li><a href="manipularProduto.jsp">Produtos</a></li>                  
                        <li><a href="almoxarifado.jsp">Almoxarifados</a></li> 
                        <li><a href="filial.jsp">Filiais</a></li> 
                        <li><a href="usuario.jsp">Usuários</a></li> 
                    </ul>
                </li>
                <li><a href="#">Atualizações</a>
                    <ul>
                        <li><a href="#">Vendas</a></li>
                        <li><a href="#">Compras</a></li>
                        <li><a href="#">Recebimentos</a></li>                    
                        <li><a href="#">Pagamentos</a></li>
                        <li><a href="#">Transferencias</a></li>	                
                    </ul>
                </li>
                <li><a href="#">Relatorios</a>
                    <ul>
                        <li><a href="#">Relatorio1</a></li>
                        <li><a href="#">Relatorio2</a></li>
                        <li><a href="#">Relatorio3</a></li>                    
                    </ul>
                </li>
                <li><a href="#">Sobre</a>
                </li>
                <li><a href="#">Usuário: ${nome}</a></li>
            </ul>
            <div class="imagem"></div>
        </nav>
        
    </body>
</html>
