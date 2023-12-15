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



        <!-- Navbar  -->
        <%@include file="navbar.jsp" %>
        <main>
            <div class="container">
                <section class="bg-secondary-subtle rounded-5 m-4 px-2 pt-2 pb-3 col-12 mx-auto text-center">
                    <h2 class="my-4" id="titulo-tabla">Listado de Oradores 2023</h2>
                    <table class="table table-sm">
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
                                
                                String modalBorrarId = "modalBorrar" + unOrador.getId();
                                
                                String modalEditarId = "editarBorrar" + unOrador.getId();
                            %>
                            <tr>
                                <th scope="row"> <%=unOrador.getId()%> </th>
                                <td><%=unOrador.getNombre()%></td>
                                <td><%=unOrador.getApellido()%></td>
                                <td><%=unOrador.getMail()%></td>
                                <td><%=unOrador.getTema()%></td>
                                <td><%=unOrador.getFechaAlta()%></td>
                                <td>
                                    <a class="btn btn-outline-secondary btn-sm"  data-bs-toggle="modal" data-bs-target="#<%=modalEditarId%>" id="boton-edicion"><i class="fa-regular fa-pen-to-square"></i></a>
                                    <!-- <a class="btn btn-outline-secondary btn-sm"  href="<%=request.getContextPath()%>/api/EditarOradorController?id=<%=unOrador.getId()%>"" role="button" id="boton-edicion"><i class="fa-regular fa-pen-to-square"></i></a> -->         
                                    <a class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#<%=modalBorrarId%>" id="boton-eliminar"><i class="fa-solid fa-trash"></i></a>    
                                </td>
                            </tr>



                            <!-- MODAL ELIMINAR -->

                        <div class="modal fade" id="<%=modalBorrarId%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Atención</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Estas seguro que desea eliminar a 'ID: <%=unOrador.getId()%> - <%=unOrador.getNombre()%> <%=unOrador.getApellido()%>' de la lista de oradores?</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                                        <a href="<%=request.getContextPath()%>/api/EliminarOradorController?id=<%=unOrador.getId()%>""><button type="button" class="btn btn-primary">Confirmar</button></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- MODAL EDICION -->

                        <div class="modal fade" id="<%=modalEditarId%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Edicion</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <section>
                                            <h1>Editar orador</h1>
                                            <form method="POST"
                                                  action="<%=request.getContextPath()%>/api/EditarOradorController" class="form-inline needs-validation">
                                                <div class="mb-3 row">
                                                    <label name="id" for="exampleFormControlTextarea1" class="col-sm-2 col-form-label">ID</label>
                                                    <div class="col-sm-10">
                                                        <input name="id" readonly="readonly" value="<%=unOrador.getId()%>" type="int" class="form-control" maxlength="7">
                                                    </div>
                                                </div>                                                
                                                <div class="mb-3 row">
                                                    <label for="nombre" class="col-sm-2 col-form-label">Nombre</label>
                                                    <div class="col-sm-10">
                                                        <input name="nombre" type="text" class="form-control" id="inputPassword" value="<%=unOrador.getNombre()%>" required>
                                                    </div>
                                                </div>
                                                <div class="mb-3 row">
                                                    <label for="apellido" class="col-sm-2 col-form-label">Apellido</label>
                                                    <div class="col-sm-10">
                                                        <input name="apellido" type="text" class="form-control" id="inputPassword" value="<%=unOrador.getApellido()%>" required>
                                                    </div>
                                                </div>
                                                <div class="mb-3 row">
                                                    <label for="mail" class="col-sm-2 col-form-label">Correo</label>
                                                    <div class="col-sm-10">
                                                        <input name="mail" type="text" class="form-control" id="inputPassword" value="<%=unOrador.getMail()%>" required>
                                                    </div>
                                                </div>
                                                <div class="mb-3 row">
                                                    <label for="tema" class="col-sm-2 col-form-label">Tema</label>
                                                    <div class="col-sm-10">
                                                        <input name="tema" type="text" class="form-control" id="inputPassword" value="<%=unOrador.getTema()%>" required>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                                                    <button class="btn btn-primary" type="submit">Confirmar</button>  
                                                </div>
                                            </form>
                                        </section>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- MODAL ALTA -->

                        <div class="modal fade" id="agregarModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Agregar ORADOR</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <section>
                                            <form method="POST"
                                                  action="<%=request.getContextPath()%>/AgregarOradorController" class="form-inline needs-validation">
                                                <div class="mb-3 row">
                                                    <label for="nombre" class="col-sm-2 col-form-label">Nombre</label>
                                                    <div class="col-sm-10">
                                                        <input name="nombre" type="text" class="form-control" id="inputPassword" value="" required>
                                                    </div>
                                                </div>
                                                <div class="mb-3 row">
                                                    <label for="apellido" class="col-sm-2 col-form-label">Apellido</label>
                                                    <div class="col-sm-10">
                                                        <input name="apellido" type="text" class="form-control" id="inputPassword" required>
                                                    </div>
                                                </div>
                                                <div class="mb-3 row">
                                                    <label for="mail" class="col-sm-2 col-form-label">Correo</label>
                                                    <div class="col-sm-10">
                                                        <input name="mail" type="text" class="form-control" id="inputPassword" required>
                                                    </div>
                                                </div>
                                                <div class="mb-3 row">
                                                    <label for="tema" class="col-sm-2 col-form-label">Tema</label>
                                                    <div class="col-sm-10">
                                                        <input name="tema" type="text" class="form-control" id="inputPassword" required>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                                                    <button class="btn btn-primary" type="submit">Confirmar</button>  
                                                </div>
                                            </form>
                                        </section>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </section>
            </div>
        </main>

        <div style="text-align: center; margin-bottom: 100px">
            <a data-bs-toggle="modal" data-bs-target="#agregarModal"><button class="btn btn-outline-primary"foo>Agregar ORADOR</button></a>
        </div>

        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
