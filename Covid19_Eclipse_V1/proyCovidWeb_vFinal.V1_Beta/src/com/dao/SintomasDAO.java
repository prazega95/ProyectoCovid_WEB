	package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entidad.Administrador;
import com.entidad.Paciente;
import com.entidad.Sintomas;
import com.util.Conexion;

public class SintomasDAO {
	Conexion cn = new Conexion();
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	int r;
	
	public List listar() {
		String sql = "select s.*,u.nom_usuario,u.ape_usuario, u.TipoDoc_usuario from tb_sintomas s inner join tb_usuario u on s.cod_usuario=u.cod_usuario";
		List<Sintomas> lista = new ArrayList<>();
		try {
			con = cn.getConexion();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				Sintomas sint = new Sintomas();
				sint.setIdSintom(rs.getInt(1));
				sint.setDepartamento(rs.getString(2));
				sint.setProvincia(rs.getString(3));
				sint.setDistrito(rs.getString(4));
				sint.setDireccion(rs.getString(5));
				sint.setLatitud(rs.getString(6));
				sint.setLongitud(rs.getString(7));
				sint.setNumFamiliar(rs.getString(8));
				sint.setProfesion(rs.getString(9));
				sint.setPriSintoma(rs.getString(10));
				sint.setSegSintoma(rs.getString(11));
				sint.setTerSintoma(rs.getString(12));
				sint.setCuartSintoma(rs.getString(13));
				sint.setQuintSintoma(rs.getString(14));
				sint.setSextSintoma(rs.getString(15));
				sint.setNinguna(rs.getString(16));
				sint.setEmail(rs.getString(17));
				sint.setCondicion(rs.getString(18));
				sint.setResultado(rs.getString(19));
				Paciente pa = new Paciente();
				pa.setIdPac(rs.getInt(20));
				pa.setNomPac(rs.getString(21));
				pa.setApePac(rs.getString(22));
				pa.setTipodoc(rs.getString(23));
				sint.setPaciente(pa);
				
				lista.add(sint);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return lista;
	}
	
	public int insertarSin(Sintomas obj) throws Exception {
		int salida = -1;
		String sql = "insert into tb_sintomas values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			con = cn.getConexion();
			ps = con.prepareStatement(sql);
			ps.setString(1, obj.getDepartamento());
			ps.setString(2, obj.getProvincia());
			ps.setString(3, obj.getDistrito());
			ps.setString(4, obj.getDireccion());
			ps.setString(5, obj.getLatitud());
			ps.setString(6, obj.getLongitud());
			ps.setString(7, obj.getNumFamiliar());
			ps.setString(8, obj.getProfesion());
			ps.setString(9, obj.getPriSintoma());
			ps.setString(10, obj.getSegSintoma());
			ps.setString(11, obj.getTerSintoma());
			ps.setString(12, obj.getCuartSintoma());
			ps.setString(13, obj.getQuintSintoma());
			ps.setString(14, obj.getSextSintoma());
			ps.setString(15, obj.getNinguna());
			ps.setString(16, obj.getEmail());
			ps.setString(17, obj.getCondicion());
			ps.setString(18, obj.getResultado());
			ps.setInt(19, obj.getPaciente().getIdPac());
			ps.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return salida;
	}
	
	public int actualizarSint(Sintomas obj) throws Exception {
		int salida = -1;
		String sql = "update tb_sintomas set Departamento=?,Provincia=?,Distrito=?,Direccion=?,Latitud=?,Longitud=?,NumeroFamiliar=?,Profesion=?,PrimerSintoma=?,SegundoSintoma=?,TercerSintoma=?,CuartoSintoma=?,QuintoSintoma=?,SextoSintoma=?,Ninguna=?,Email=?,Condicion=?,Resultado=?,cod_usuario=? where cod_sintomas=?";
		try {
			con = cn.getConexion();
			ps = con.prepareStatement(sql);
			ps.setString(1, obj.getDepartamento());
			ps.setString(2, obj.getProvincia());
			ps.setString(3, obj.getDistrito());
			ps.setString(4, obj.getDireccion());
			ps.setString(5, obj.getLatitud());
			ps.setString(6, obj.getLongitud());
			ps.setString(7, obj.getNumFamiliar());
			ps.setString(8, obj.getProfesion());
			ps.setString(9, obj.getPriSintoma());
			ps.setString(10, obj.getSegSintoma());
			ps.setString(11, obj.getTerSintoma());
			ps.setString(12, obj.getCuartSintoma());
			ps.setString(13, obj.getQuintSintoma());
			ps.setString(14, obj.getSextSintoma());
			ps.setString(15, obj.getNinguna());
			ps.setString(16, obj.getEmail());
			ps.setString(17, obj.getCondicion());
			ps.setString(18, obj.getResultado());
			ps.setInt(19, obj.getPaciente().getIdPac());
			ps.setInt(20, obj.getIdSintom());
			ps.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return salida;
	}
	
	
	/*-----------------------Operaciones Extras Es lo que ya estaba programado------------------------------------------*/
	/*----------------------------------------------------------------------------------------------------------------------------*/
	
	public Sintomas listarId(int id) {
		Sintomas sin = new Sintomas();
		String sql = "Select * from tb_sintomas where cod_sintomas=" + id;
		try {
			con = cn.getConexion();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				
		         
				//rs.getString("mantener la misma posicion y numero del metodo listar")
				//seteo de la condicion y resultado
				
				
				sin.setCondicion(rs.getString(18));
				sin.setResultado(rs.getString(19));
				
				
			
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return sin;
	}

	
	
	public int actualizar(Sintomas sin) {
		String sql="update tb_sintomas set Condicion=?,Resultado=? where cod_sintomas=?";
		try {
			con = cn.getConexion();
			ps = con.prepareStatement(sql);

			
			//Respetar la posicion setString con la posicion del String sql ="update tb_sintomas set (1),(2) where cod_sintomas(3);
			ps.setString(1, sin.getCondicion());
			ps.setString(2, sin.getResultado());

			
			ps.setInt(3, sin.getIdSintom());
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
