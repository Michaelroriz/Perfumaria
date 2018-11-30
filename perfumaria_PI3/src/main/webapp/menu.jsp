
<!DOCTYPE html>
<html>
    <head>

        <link href="formatacao.css" type="text/css" rel="stylesheet" />
        <title>Menu Principal</title>
        <meta charset="UTF-8">

    </head>
    <body>

        <nav >
            <ul class="menu">
                <li><a href="#">Cadastros</a>
                    <ul>
                        <li><a href="./CadastrarCliente">Clientes</a></li>                       
                        <li><a href="./IncluirFuncionario">Funcion�rios</a></li>
                        <li><a href="./IncluirProduto">Produtos</a></li>                  
                        <li><a href="./IncluirUsuario">Usu�rios</a></li> 
                    </ul>
                </li>
                <li><a href="#">Pesquisar</a>
                    <ul>
                        <li><a href="./ConsultarCliente">Clientes</a></li>
                        <li><a href="./ConsultaProduto">Produto</a></li>
                        <li><a href="./ConsultaFuncionario">Funcion�rio</a></li>
                        <li><a href="./ConsultaUsuario">Usu�rio</a></li>
                    </ul>
                </li>
                <li><a href="./Venda">Venda</a></li>
                <li><a href="#">Relatorios</a>
                    <ul>
                        <li><a href="#">Relatorio1</a></li>
                        <li><a href="#">Relatorio2</a></li>
                        <li><a href="#">Relatorio3</a></li>                    
                    </ul>
                </li>
                <li><a href="#">Sobre</a>
                </li>
                <li><a href="#">Usu�rio: ${nome}</a>
                    <ul>
                        <li><a href="index.html">Sair</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <%@ include file="/rodape.jsp"%> 
    </body>
</html>
