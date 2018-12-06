<%-- 
    Document   : Carrinho
    Created on : 05/12/2018, 23:55:09
    Author     : rbezerra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="formatacao.css"/>
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
        <title>Carrinho</title>

    </head>
    <body>
        <nav>            
            <h2 style="color: white">Carrinho - Resumo</h2>        
            <main class="container">
                <div class="row">
                    <div class="col-12">                                        
                        <div>
                            <form method="POST" action="${pageContext.request.contextPath}/Carrinho">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="cliente">Cliente</label>
                                    <c:forEach items="${cliente}" var="cliente">
                                        <input  type="text" value="${cliente.id} - ${cliente.nome}" id="${cliente.id}" name="cliente" disabled/>
                                    </c:forEach>
                                </div>
                                <table border= 1>
                                    <tr>
                                        <td align=middle width=100>Produto</td>
                                        <td align=middle width=100>Quantidade</td>
                                    </tr>
                                    <tr>
                                        <c:forEach items="${produto}" var="prod">
                                            <td align=middle><c:out value="${prod}"/></td>
                                        </c:forEach>

                                        <td align=middle><c:out value="${quantidade}"/></td>
                                    </tr>
                                </table>


                            </form>
                        </div>
                    </div>
                </div>
                <br>
                <br>
                <br>
                <button type="submit">Realizar Venda</button>
            </main>
        </nav>
        <%@ include file="/rodape.jsp"%>    
    </body>
</html>
