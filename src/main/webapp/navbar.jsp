<div id="navbar">
  <div class="container-fluid" role="navigation">
    <div class="text-center py-2">
        <span></span>
    </div>
    <div class="row text-center align-items-center g-0">
      <div class="col-lg-5 col-md-5 d-none d-lg-block d-md-block d-xs-none ms-auto">
        <div class="d-flex justify-content-around border-top border-bottom border-dark">
          <div class="customLink"><a class="d-inline-block p-3" href="<%=request.getContextPath()%>">Inicio</a></div>
          <div class="customLink"><a class="d-inline-block p-3" href="<%=request.getContextPath()%>/api/ListadoOradorController">Listado de Oradores</a></div>
        </div>
      </div>
      <div class="col-lg-2 col-md-2 mx-auto" style="max-width:120px;">
        <i class="fa-solid fa-microphone" id="circleIcon"></i>
      </div>
          <div class="col-lg-5 col-md-5 d-none d-lg-block d-md-block d-xs-none me-auto">
              <div class="d-flex justify-content-around border-top border-bottom border-dark">
                  <div class="customLink"><a class="d-inline-block p-3 nav-link" aria-disabled="true" id="boton-editar" href="<%=request.getContextPath()%>/api/ListadoOradorControllerEdicion">ABM</a></div>
                  <div class="customLink mis-sitios">
                      <li class="nav-item dropdown customLink" style="list-style-type:none">
                          <a class="nav-link dropdown-toggle d-inline-block p-3" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                              Mis Sitios
                          </a>
                          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                              <li><a class="dropdown-item" href="https://leovaudagna.github.io/c-a-codo-fundacion-arteviva/" target="_blank">TP Bootstrap + JS</a></li>
                              <li><hr class="dropdown-divider"></li>
                              <li><a class="dropdown-item" href="https://www.linkedin.com/in/leonardo-vaudagna-a15194123/" target="_blank"><i class="fa-brands fa-linkedin"></i>LinekedIn</a></li>
                              <li><a class="dropdown-item" href="https://github.com/leovaudagna" target="_blank"><i class="fa-brands fa-github"></i>GitHub</a></li>
                              <li><a class="dropdown-item" href="https://www.facebook.com/leonardo.vaudagna.1/" target="_blank"><i class="fa-brands fa-facebook"></i>Facebook</a></li>
                          </ul>
                      </li>
                  </div>
              </div>
          </div>
       </div>
    </div>
  </div>
</div>
