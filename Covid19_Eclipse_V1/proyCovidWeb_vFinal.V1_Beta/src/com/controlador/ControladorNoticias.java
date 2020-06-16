package com.controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.AdministradorDAO;
import com.dao.NoticiasDAO;
import com.dao.PacienteDAO;
import com.dao.SintomasDAO;
import com.entidad.Administrador;
import com.entidad.Noticias;
import com.entidad.Paciente;
import com.entidad.Sintomas;


@WebServlet("/ControladorNoticias")
public class ControladorNoticias extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	Administrador adm = new Administrador();
	AdministradorDAO adao = new AdministradorDAO();
	Paciente pac = new Paciente();
	PacienteDAO pdao = new PacienteDAO();
	Sintomas sin = new Sintomas();
	SintomasDAO sdao = new SintomasDAO();
    Noticias not = new Noticias();
	NoticiasDAO snot = new NoticiasDAO();

	
	int idNot;
	

	
    public ControladorNoticias() {
        super();
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String menu = request.getParameter("menu");
		String accion = request.getParameter("accion");
		
		if(menu.equals("Noticia")) {
			
			switch (accion) {
			case "Listar":
				List lista = snot.listar();
				request.setAttribute("noticias", lista);
				break;
			case "Agregar":
				String tituloNoti = request.getParameter("txtTitulo");
				String descNoti = request.getParameter("txtDescripcion");				
				not.setTituloNoti(tituloNoti);
				not.setDescripNoti(descNoti);
				snot.agregar(not);
				
				request.getRequestDispatcher("ControladorNoticias?menu=Noticia&accion=Listar").forward(request, response);
				break;
			
			case "Editar":
				idNot = Integer.parseInt(request.getParameter("id"));
				Noticias noti = snot.listarId(idNot);
				request.setAttribute("noticia", noti);
				request.getRequestDispatcher("ControladorNoticias?menu=Noticia&accion=Listar").forward(request, response);
				break;	
				
			case "Actualizar":
				String tituloNoti1 = request.getParameter("txtTitulo");
				String descNoti1 = request.getParameter("txtDescripcion");
				not.setTituloNoti(tituloNoti1);
				not.setDescripNoti(descNoti1);
				not.setIdNoti(idNot);
				snot.actualizar(not);
				request.getRequestDispatcher("ControladorNoticias?menu=Noticia&accion=Listar").forward(request, response);
				break;
				
			case "Eliminar":
				idNot = Integer.parseInt(request.getParameter("id"));
				snot.eliminar(idNot);
				request.getRequestDispatcher("ControladorNoticias?menu=Noticia&accion=Listar").forward(request, response);	
				break;

			default:
				throw new AssertionError();
			}
			
			request.getRequestDispatcher("NoticiasYAlertas.jsp").forward(request, response);
		}
		
		
		
		
	}

}
