package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entidad.Paciente;
import com.entidad.Sintomas;
import com.util.Conexion;

public class PacienteDAO {
	
	Conexion cn = new Conexion();
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	int r;	
	
	//Operaciones CRUD
	
	//Listar
	public List listar() {
		String sql = "select * from tb_usuario";
		List<Paciente> lista = new ArrayList<>();
		try {
			con = cn.getConexion();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				Paciente pac = new Paciente();
				pac.setIdPac(rs.getInt(1));
				pac.setNomPac(rs.getString(2));
				pac.setApePac(rs.getString(3));
				pac.setTipodoc(rs.getString(4));
				pac.setDniPac(rs.getString(5));
				pac.setFonoPac(rs.getString(6));
				pac.setUserPac(rs.getString(7));
				pac.setPassPac(rs.getString(8));
				lista.add(pac);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return lista;
	}
	
	public int insertarP(Paciente obj) throws Exception {
		int salida = -1;
		String sql = "insert into tb_usuario values(null,?,?,?,?,?,?,?)";
		try {
			con = cn.getConexion();
			ps = con.prepareStatement(sql);
			ps.setString(1, obj.getNomPac());
			ps.setString(2, obj.getApePac());
			ps.setString(3, obj.getTipodoc());
			ps.setString(4, obj.getDniPac());
			ps.setString(5, obj.getFonoPac());
			ps.setString(6, obj.getUserPac());
			ps.setString(7, obj.getPassPac());
			ps.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return salida;
	}
	
	public int actualizarP(Paciente obj) throws Exception {
		int salida = -1;
		String sql = "update tb_usuario set nom_usuario=?,ape_usuario=?,TipoDoc_usuario=?,doc_usuario=?,tel_usuario=?,login_usuario=?,pass_usuario=? where cod_usuario=?";
		try {
			con = cn.getConexion();
			ps = con.prepareStatement(sql);
			ps.setString(1, obj.getNomPac());
			ps.setString(2, obj.getApePac());
			ps.setString(3, obj.getTipodoc());
			ps.setString(4, obj.getDniPac());
			ps.setString(5, obj.getFonoPac());
			ps.setString(6, obj.getUserPac());
			ps.setString(7, obj.getPassPac());
			ps.setInt(8, obj.getIdPac());
			ps.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return salida;
	}
	
	
	
	
	
	//Eliminar
	/*public void Eliminar(int id) {
		String sql = "delete from tb_usuario where cod_usuario="+ id;
			try {
				con = cn.getConexion();
				ps = con.prepareStatement(sql);
				ps.executeUpdate();
					
			} catch (Exception e) {
				e.printStackTrace();
			}
	}*/

}
