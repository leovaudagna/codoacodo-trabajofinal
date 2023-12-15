package com.proyectofinaloradores.controller;

import com.proyectofinaloradores.dao.OradorDAO;
import com.proyectofinaloradores.dto.Orador;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/api/EditarOradorController")
public class EditarOradorController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		
		//Crear ProductoDAO
		OradorDAO dao = new OradorDAO();
		
		//invocar el metodo obtenerPorId(id)
		Orador oradorDB = dao.selectOrador(Integer.parseInt(id));
		
		//guardar en el request el producto
		req.setAttribute("orador", oradorDB);
		
		//ir a la siguiente pagina
		getServletContext().getRequestDispatcher("/listado_edicion.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

                String id = req.getParameter("id");
		String nombre = req.getParameter("nombre");
		String apellido = req.getParameter("apellido");
		String mail = req.getParameter("mail");
		String tema = req.getParameter("tema");
		
		//Crear ProductoDAO
		OradorDAO dao = new OradorDAO();
		
		//invocar actualizarProducto(params)
		dao.updateOradores2(nombre, apellido, mail, tema, Integer.parseInt(id));

		//ir a la siguiente pagina
		resp.sendRedirect(req.getContextPath()+"/api/ListadoOradorControllerEdicion");
	}
}
