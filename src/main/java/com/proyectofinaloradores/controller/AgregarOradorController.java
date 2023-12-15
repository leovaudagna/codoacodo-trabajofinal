package com.proyectofinaloradores.controller;

import com.proyectofinaloradores.dao.OradorDAO;
import com.proyectofinaloradores.dto.Orador;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AgregarOradorController")
public class AgregarOradorController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String nombre = req.getParameter("nombre");
		String apellido = req.getParameter("apellido");
		String mail = req.getParameter("mail");
		String tema = req.getParameter("tema");
		
		//crear ProductoDAO
		OradorDAO dao = new OradorDAO();
                
                Orador agregarOrador = new Orador(nombre, apellido, mail, tema);
		
		//ejecutar el metodo crearProducto(parametros...)
		dao.insertOradores(agregarOrador);
		
		//ctrl+shit+o
		//ir a la siguiente pagina
		resp.sendRedirect(req.getContextPath()+"/api/ListadoOradorControllerEdicion");
	}
}
