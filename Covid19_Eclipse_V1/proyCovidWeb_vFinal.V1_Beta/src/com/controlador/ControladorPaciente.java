package com.controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.PacienteDAO;
import com.entidad.Paciente;


/**
 * Servlet implementation class ControladorPaciente
 */
@WebServlet("/ControladorPaciente")
public class ControladorPaciente extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	PacienteDAO pdao = new PacienteDAO();
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String metodo = request.getParameter("metodo");
		if(metodo.equals("lista")) {
			lista(request,response);
		}else if(metodo.equals("registra")){
			registra(request, response);
		}else if(metodo.equals("actualiza")){
			actualiza(request, response);
		}
	}
	private void lista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List lista = null;		
		try {
			lista = pdao.listar();
		} catch (Exception e) {
			// TODO: handle exception
		}
		request.setAttribute("pacientes", lista);
		request.getRequestDispatcher("Pacientes.jsp").forward(request, response);
		
	}
	private void registra(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nombre = request.getParameter("txtNombre");
		String apell = request.getParameter("txtApellido");
		String tip = request.getParameter("txtTipo");
		String dni = request.getParameter("txtDni");
		String fon = request.getParameter("txtFono");
		String user = request.getParameter("txtUser");
		String pass = request.getParameter("txtPass");
		List lista = null;
		try {
			Paciente pac = new Paciente();			
			pac.setNomPac(nombre);
			pac.setApePac(apell);
			pac.setTipodoc(tip);
			pac.setDniPac(dni);
			pac.setFonoPac(fon);
			pac.setUserPac(user);
			pac.setPassPac(pass);
			pdao.insertarP(pac);
			lista = pdao.listar();
		} catch (Exception e) {
			// TODO: handle exception
		}
		request.setAttribute("pacientes", lista);
		request.getRequestDispatcher("Pacientes.jsp").forward(request, response);
		
	}
	private void actualiza(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String nombre = request.getParameter("txtNombre");
		String apell = request.getParameter("txtApellido");
		String tip = request.getParameter("txtTipo");
		String dni = request.getParameter("txtDni");
		String fon = request.getParameter("txtFono");
		String user = request.getParameter("txtUser");
		String pass = request.getParameter("txtPass");
		List lista = null;
		try {
			Paciente pac = new Paciente();	
			pac.setIdPac(Integer.parseInt(id));
			pac.setNomPac(nombre);
			pac.setApePac(apell);
			pac.setTipodoc(tip);
			pac.setDniPac(dni);
			pac.setFonoPac(fon);
			pac.setUserPac(user);
			pac.setPassPac(pass);
			pdao.actualizarP(pac);
			lista = pdao.listar();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("pacientes", lista);
		request.getRequestDispatcher("Pacientes.jsp").forward(request, response);
		
	}

}
