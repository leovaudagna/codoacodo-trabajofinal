package com.proyectofinaloradores.controller;

import com.proyectofinaloradores.dao.OradorDAO;
import com.proyectofinaloradores.dto.Orador;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/api/ListadoOradorControllerEdicion")
public class ListadoOradorControllerEdicion extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//crear la instancia de ProductoDAO
		OradorDAO dao = new OradorDAO();
		
		//invocar al metodo listarProductos()
		List<Orador> listado = dao.selectOradores();
		
		//grabar el listado en el request para que lo vea la siguiente pagina
		req.setAttribute("listado", listado);
		
		//ir a la siguiente pagina
                
                //modificacion2.
		getServletContext().getRequestDispatcher("/listado_edicion.jsp").forward(req, resp);
	}
}
