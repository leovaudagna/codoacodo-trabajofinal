<%@page import="java.util.List"%>
<%@page import="com.proyectofinaloradores.dto.Orador"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



<html lang="es-ar" data-bs-theme="dark">
    <head>
        <jsp:include page="/head.jsp" />
        <title>
            Listado
        </title>	
    </head>
    <body>
        
        
        
        <!-- ACA VA EL NAVBAR  -->
        <%@include file="navbar.jsp" %>
        <main>
            <div class="container">
                <section class="bg-secondary-subtle rounded-5 m-4 px-2 pt-2 pb-3 col-12 mx-auto text-center">
                    <h2 class="my-4">Listado de Oradores 2023</h2>
                    <table class="table table-sm" style="margin-bottom: 100px">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">NOMBRE</th>
                                <th scope="col">APELLIDO</th>
                                <th scope="col">CORREO</th>
                                <th scope="col">TEMA</th>
                                <th scope="col">FECHA DE ALTA</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <%
                            //codigo java
                            //obtener el listado desde el request
                            //se guardo bajo el nombre de "listado"
                            List<Orador> listado = (List<Orador>) request.getAttribute("listado");
                        %>
                        <tbody>
                            <%
                                for (Orador unOrador : listado) {
                            %>
                            <tr>
                                <th scope="row"> <%=unOrador.getId()%> </th>
                                <td><%=unOrador.getNombre()%></td>
                                <td><%=unOrador.getApellido()%></td>
                                <td><%=unOrador.getMail()%></td>
                                <td><%=unOrador.getTema()%></td>
                                <td><%=unOrador.getFechaAlta()%></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </section>
            </div>
        </main>
                        
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
