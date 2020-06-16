package com.controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.CifrasDAO;
import com.dao.DepartamentoDAO;
import com.entidad.Cifras;
import com.entidad.Departamento;
import com.google.gson.Gson;


@WebServlet("/ControladorCifras")
public class ControladorCifras extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public ControladorCifras(){
		super();
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String accion = request.getParameter("accion");
		
		switch(accion){
		case "listar":
			DepartamentoDAO ddao = new DepartamentoDAO();
			List<Departamento> lista = ddao.listar();
			request.setAttribute("listaDepartamentos", lista);
			request.getRequestDispatcher("CifrasGenerales.jsp").forward(request, response);
		
			break;
		case "listarCifras":
			String departamento = request.getParameter("departamento");
			CifrasDAO cdDao = new CifrasDAO();
			List<Cifras> listaCifras = cdDao.listar(departamento);
			Gson gson = new Gson();
			String data = gson.toJson(listaCifras);
			response.setHeader("Content-Type", "application/json; charset=UTF-8");
			response.getWriter().write(data);
			break;
		
		
		
		}
		
	}
}
