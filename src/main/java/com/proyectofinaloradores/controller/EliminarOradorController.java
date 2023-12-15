package com.proyectofinaloradores.controller;

import com.proyectofinaloradores.dao.OradorDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/api/EliminarOradorController")
public class EliminarOradorController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		String id = req.getParameter("id");
                
                OradorDAO dao = new OradorDAO();
                
                dao.deleteOradores(Integer.parseInt(id));
		
                resp.sendRedirect(req.getContextPath()+"/api/ListadoOradorControllerEdicion");

	}
}
