package com.controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.AdministradorDAO;
import com.dao.LocalidadDAO;
import com.dao.PacienteDAO;
import com.dao.SintomasDAO;
import com.entidad.Administrador;
import com.entidad.Localidad;
import com.entidad.Paciente;
import com.entidad.Sintomas;

/**
 * Servlet implementation class ControladorPrinc
 */
@WebServlet("/ControladorCondicion")
public class ControladorCondicion extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	Administrador adm = new Administrador();
	AdministradorDAO adao = new AdministradorDAO();
	Paciente pac = new Paciente();
	PacienteDAO pdao = new PacienteDAO();
	Sintomas sin = new Sintomas();
	SintomasDAO sdao = new SintomasDAO();
	

	
	int idSin;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorCondicion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String menu = request.getParameter("menu");
		String accion = request.getParameter("accion");
		
		if(menu.equals("Condicion")) {
			
			switch (accion) {
			case "Listar":
				List lista = sdao.listar();
				request.setAttribute("condiciones", lista);
				break;
				
	
			case "Editar":
				idSin = Integer.parseInt(request.getParameter("id"));
				Sintomas condi = sdao.listarId(idSin);
				request.setAttribute("condicion", condi);
				request.getRequestDispatcher("ControladorCondicion?menu=Condicion&accion=Listar").forward(request, response);
				break;	
				
			case "Actualizar":
				String condicionCon1 = request.getParameter("txtcondicion");
				String resultadoCon1 = request.getParameter("txtresultado");

				sin.setCondicion(condicionCon1);
				sin.setResultado(resultadoCon1);
				sin.setIdSintom(idSin);
				sdao.actualizar(sin);
				request.getRequestDispatcher("ControladorCondicion?menu=Condicion&accion=Listar").forward(request, response);
				break;
	

			default:
				throw new AssertionError();
			}
			
			request.getRequestDispatcher("CondicionSalud.jsp").forward(request, response);
		}
		
		
		
		
		
		
		
		
		
	}

}
