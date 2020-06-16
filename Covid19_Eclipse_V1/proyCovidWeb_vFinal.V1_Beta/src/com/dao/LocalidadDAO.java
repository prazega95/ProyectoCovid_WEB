package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.entidad.Localidad;
import com.entidad.Paciente;
import com.entidad.Sintomas;
import com.util.Conexion;

public class LocalidadDAO {
	
	Conexion cn = new Conexion();
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	int r;
	
	
	public List listar() {
		String sql="Select u.nom_usuario, u.ape_usuario,s.Departamento, s.Provincia, s.Distrito, s.Direccion, s.Latitud, s.Longitud, s.NumeroFamiliar, s.Profesion,s.Email, s.PrimerSintoma, s.SegundoSintoma, s.TercerSintoma, s.CuartoSintoma, s.QuintoSintoma, s.SextoSintoma,s.Condicion, s.Resultado,s.cod_sintomas,u.TipoDoc_usuario from tb_sintomas s inner join tb_usuario u on s.cod_usuario = u.cod_usuario";
		List<Localidad> lista = new ArrayList<>();
		try {
			con = cn.getConexion();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				
				Paciente paci = new Paciente();
				paci.setNomPac(rs.getString(1));
				paci.setApePac(rs.getString(2));
				paci.setTipodoc(rs.getString(21));
				
				Localidad sin = new Localidad();
				sin.setIdSintom(rs.getInt(20));
				sin.setDepartamento(rs.getString(3));
				sin.setProvincia(rs.getString(4));
				sin.setDistrito(rs.getString(5));
				sin.setDireccion(rs.getString(6));
				sin.setLatitud(rs.getString(7));
				sin.setLongitud(rs.getString(8));
				sin.setNumFamiliar(rs.getString(9));
				sin.setProfesion(rs.getString(10));
				sin.setEmail(rs.getString(11));

				/*--------------------------------*/
				//seteo para mostrar en el modal sintomas
				sin.setPriSintoma(rs.getString(12));
				sin.setSegSintoma(rs.getString(13));
				sin.setTerSintoma(rs.getString(14));
				sin.setCuartSintoma(rs.getString(15));
				sin.setQuintSintoma(rs.getString(16));
				sin.setSextSintoma(rs.getString(17));
				
				//seteo de la condicion y resultado
				sin.setCondicion(rs.getString(18));
				sin.setResultado(rs.getString(19));
				
				sin.setPaciente(paci);
				
				lista.add(sin);
						
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return lista;
	}
	



	
	
	
	public Localidad listarId(int id) {
		Localidad sin = new Localidad();
		String sql = "Select * from tb_sintomas where cod_sintomas=" + id;
		try {
			con = cn.getConexion();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				
		         
				//rs.getString("mantener la misma posicion y numero del metodo listar")
				//seteo de la condicion y resultado
				
				sin.setDepartamento(rs.getString(2));
				sin.setProvincia(rs.getString(3));
				sin.setDistrito(rs.getString(4));
				sin.setDireccion(rs.getString(5));
				sin.setLatitud(rs.getString(6));
				sin.setLongitud(rs.getString(7));
				
	
				
				
			
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return sin;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public int actualizar(Localidad sin) {
		String sql="update tb_sintomas set Departamento=?,Provincia=?,Distrito=?,Direccion=?,Latitud=?,Longitud=? where cod_sintomas=?";
		try {
			con = cn.getConexion();
			ps = con.prepareStatement(sql);

			
			//Respetar la posicion setString con la posicion del String sql ="update tb_sintomas set (1),(2) where cod_sintomas(3);
		
			ps.setString(1, sin.getDepartamento());
			ps.setString(2, sin.getProvincia());
			ps.setString(3, sin.getDistrito());
			ps.setString(4, sin.getDireccion());
			ps.setString(5, sin.getLatitud());
			ps.setString(6, sin.getLongitud());
			
			ps.setInt(7, sin.getIdSintom());
			ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return r;
	}
	
	
	
	
	
	
	//Eliminar
		public void Eliminar(int id) {
			String sql = "delete from tb_sintomas where cod_sintomas="+ id;
				try {
					con = cn.getConexion();
					ps = con.prepareStatement(sql);
					ps.executeUpdate();
						
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
	
	
	
	
	
	
	
	
	
}
