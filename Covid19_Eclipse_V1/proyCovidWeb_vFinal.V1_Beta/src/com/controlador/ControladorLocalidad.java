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
@WebServlet("/ControladorLocalidad")
public class ControladorLocalidad extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	Administrador adm = new Administrador();
	AdministradorDAO adao = new AdministradorDAO();
	Paciente pac = new Paciente();
	PacienteDAO pdao = new PacienteDAO();
	Sintomas sin = new Sintomas();
	SintomasDAO sdao = new SintomasDAO();
	
	Localidad loc = new Localidad();
	LocalidadDAO ldao= new LocalidadDAO();
	

	
	int idLoc;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorLocalidad() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String menu = request.getParameter("menu");
		String accion = request.getParameter("accion");
		
		if(menu.equals("Localidad")) {
			
			switch (accion) {
			case "Listar":
				List lista = ldao.listar();
				request.setAttribute("localidades", lista);
				break;
				
	
			case "Editar":
				idLoc = Integer.parseInt(request.getParameter("id"));
				Localidad locali = ldao.listarId(idLoc);
				request.setAttribute("localidad", locali);
				request.getRequestDispatcher("ControladorLocalidad?menu=Localidad&accion=Listar").forward(request, response);
				break;	
				
			case "Actualizar":
				String departamentoCon1 = request.getParameter("txtdepartamento");
				String provinciaCon1 = request.getParameter("txtprovincia");
				String distritoCon1 = request.getParameter("txtdistrito");
				String direccionCon1 = request.getParameter("txtdireccion");
				String latitudCon1 = request.getParameter("txtlatitud");
				String longitudCon1 = request.getParameter("txtlongitud");

				loc.setDepartamento(departamentoCon1);
				loc.setProvincia(provinciaCon1);
				loc.setDistrito(distritoCon1);
				loc.setDireccion(direccionCon1);
				loc.setLatitud(latitudCon1);
				loc.setLongitud(longitudCon1);
				
				loc.setIdSintom(idLoc);
				ldao.actualizar(loc);
				request.getRequestDispatcher("ControladorLocalidad?menu=Localidad&accion=Listar").forward(request, response);
				break;
	

			default:
				throw new AssertionError();
			}
			
			request.getRequestDispatcher("Localidad.jsp").forward(request, response);
		}
		
		
		
		
		
		
		
		
		
	}

}
