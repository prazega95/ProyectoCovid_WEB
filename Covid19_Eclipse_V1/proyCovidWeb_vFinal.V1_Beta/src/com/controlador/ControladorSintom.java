package com.controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.SintomasDAO;
import com.entidad.Paciente;
import com.entidad.Sintomas;

/**
 * Servlet implementation class ControladorSintom
 */
@WebServlet("/ControladorSintom")
public class ControladorSintom extends HttpServlet {
	private static final long serialVersionUID = 1L;
    SintomasDAO sdao = new SintomasDAO();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorSintom() {
        super();
        // TODO Auto-generated constructor stub
    }

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
			lista = sdao.listar();
		} catch (Exception e) {
			// TODO: handle exception
		}
		request.setAttribute("sintomas", lista);
		request.getRequestDispatcher("SituacionMedica.jsp").forward(request, response);		
	}

	private void registra(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String depa = request.getParameter("txtDepartamento");
		String prov = request.getParameter("txtProvincia");
		String dist = request.getParameter("txtDistrito");
		String dir = request.getParameter("txtDireccion");
		String lat = request.getParameter("txtLatitud");
		String longi = request.getParameter("txtLongitud");
		String numF = request.getParameter("txtNumFam");
		String prof = request.getParameter("txtProfesion");
		String sinto1 = request.getParameter("txtSint1");
		String sinto2 = request.getParameter("txtSint2");
		String sinto3 = request.getParameter("txtSint3");
		String sinto4 = request.getParameter("txtSint4");
		String sinto5 = request.getParameter("txtSint5");
		String sinto6 = request.getParameter("txtSint6");
		String ningu = request.getParameter("txtNinguna");
		String email = request.getParameter("txtEmail");
		String cond = request.getParameter("txtCondicion");
		String resul = request.getParameter("txtResultado");
		String codPa = request.getParameter("txtIdPac");
		List lista = null;
		try {
			Sintomas sint = new Sintomas();			
			sint.setDepartamento(depa);
			sint.setProvincia(prov);
			sint.setDistrito(dist);
			sint.setDireccion(dir);
			sint.setLatitud(lat);
			sint.setLongitud(longi);
			sint.setNumFamiliar(numF);
			sint.setProfesion(prof);
			sint.setPriSintoma(sinto1);
			sint.setSegSintoma(sinto2);
			sint.setTerSintoma(sinto3);
			sint.setCuartSintoma(sinto4);
			sint.setQuintSintoma(sinto5);
			sint.setSextSintoma(sinto6);
			sint.setNinguna(ningu);
			sint.setEmail(email);
			sint.setCondicion(cond);
			sint.setResultado(resul);
			Paciente p = new Paciente();
			p.setIdPac(Integer.parseInt(codPa));
			sint.setPaciente(p);
			sdao.insertarSin(sint);
			lista = sdao.listar();
		} catch (Exception e) {
			// TODO: handle exception
		}
		request.setAttribute("sintomas", lista);
		request.getRequestDispatcher("SituacionMedica.jsp").forward(request, response);
		
	}
	private void actualiza(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String depa = request.getParameter("txtDepartamento");
		String prov = request.getParameter("txtProvincia");
		String dist = request.getParameter("txtDistrito");
		String dir = request.getParameter("txtDireccion");
		String lat = request.getParameter("txtLatitud");
		String longi = request.getParameter("txtLongitud");
		String numF = request.getParameter("txtNumFam");
		String prof = request.getParameter("txtProfesion");
		String sinto1 = request.getParameter("txtSint1");
		String sinto2 = request.getParameter("txtSint2");
		String sinto3 = request.getParameter("txtSint3");
		String sinto4 = request.getParameter("txtSint4");
		String sinto5 = request.getParameter("txtSint5");
		String sinto6 = request.getParameter("txtSint6");
		String ningu = request.getParameter("txtNinguna");
		String email = request.getParameter("txtEmail");
		String cond = request.getParameter("txtCondicion");
		String resul = request.getParameter("txtResultado");
		String codPa = request.getParameter("txtIdPac");
		String idSn = request.getParameter("txtIdSinto");
		List lista = null;
		try {
			Sintomas sint = new Sintomas();	
			sint.setIdSintom(Integer.parseInt(idSn));
			sint.setDepartamento(depa);
			sint.setProvincia(prov);
			sint.setDistrito(dist);
			sint.setDireccion(dir);
			sint.setLatitud(lat);
			sint.setLongitud(longi);
			sint.setNumFamiliar(numF);
			sint.setProfesion(prof);
			sint.setPriSintoma(sinto1);
			sint.setSegSintoma(sinto2);
			sint.setTerSintoma(sinto3);
			sint.setCuartSintoma(sinto4);
			sint.setQuintSintoma(sinto5);
			sint.setSextSintoma(sinto6);
			sint.setNinguna(ningu);
			sint.setEmail(email);
			sint.setCondicion(cond);
			sint.setResultado(resul);
			Paciente p = new Paciente();
			p.setIdPac(Integer.parseInt(codPa));
			sint.setPaciente(p);
			sdao.actualizarSint(sint);
			lista = sdao.listar();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("sintomas", lista);
		request.getRequestDispatcher("SituacionMedica.jsp").forward(request, response);

	}

}
