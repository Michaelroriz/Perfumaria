<%-- 
    Document   : venda1
    Created on : 29/11/2018, 20:16:16
    Author     : michael.aroriz
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="formatacao.css"/>
        <title>Realizar Venda</title>
        <meta charset="UTF-8">       
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
              crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
        <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
        <script src="js/functionsVenda.js" type="text/javascript"></script>
    </head>
    <body>
        <nav>            
            <h2 style="color: white">Venda</h2>        
            <main class="container">
                <div class="row">
                    <div class="col-12">                                        
                        <div>
                            <form method="post" action="${pageContext.request.contextPath}/Venda">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="cliente">Cliente</label>
                                    <select style="width: 300px;" name="cliente" >                                          
                                        <c:forEach items="${cliente}" var="cliente">
                                            <option  type="search" value="${cliente.nome}" id="${cliente.id}" name="cliente"/>${cliente.id} | ${cliente.nome}
                                        </c:forEach>
                                    </select>                                    
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="prod">Produto</label>
                                    <div class="table-wrapper">
                                        <table border= 1>
                                            <tr>
                                                <td align=middle width=100>Id</td>
                                                <td align=middle width=100>Nome</td>
                                                <td align=middle width=100>Marca</td>
                                                <td align=middle width=100>Descrição</td>
                                                <td align=middle width=120>Preço Compra</td>
                                                <td align=middle width=100>Preço Venda</td>
                                                <td align=middle width=100>Quantidade(Stk)</td>
                                                <td align=middle width=100>Quantidade</td>
                                                <td align=middle width=100></td> 
                                            </tr>
                                            <c:forEach items="${prod}" var="prod">
                                                <tr>
                                                    <td align=middle><c:out value="${prod.id}"/></td>
                                                    <td align=middle><c:out value="${prod.nome}"/></td>
                                                    <td align=middle><c:out value="${prod.marca}" /></td>
                                                    <td align=middle><c:out value="${prod.descricao}" /></td>
                                                    <td align=middle><fmt:formatNumber value="${prod.precoCompra}" type="currency" /></td>
                                                    <td align=middle><fmt:formatNumber value="${prod.precoVenda}" type="currency" /></td>
                                                    <td align=middle><c:out value="${prod.quantidade}" /></td>    
                                                    <td align=middle> <input style="width: 100px;" type="number" name="quant" max="${prod.quantidade}" min="0"/></td> 
                                                    <td align=middle> <button type="button" class="btn btn-primary btn-md" id="${prod.id}" onchange="criarTabela(${prod.quantidade})"/> Adicionar ao carrinho</td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                    </div>
                                </div>
                                <div id="carrinhodeCompras">
                                    <label for="carrinho">Carrinho: </label>
                                    <div id="tabela"></div>
                                </div>
                                <br>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="total">Total:</label>
                                    <input  type="text" name="total"/>
                                </div>

                                <button type="submit">Salvar</button>
                                <button type="reset">Limpar</button>
                                <button type="reset" onclick="window.location.href = 'menu.jsp';">Voltar</button>
                            </form>
                        </div>
                    </div>
                </div>
            </main>
        </nav>
        <%@ include file="/rodape.jsp"%> 
    </body>
</html>
