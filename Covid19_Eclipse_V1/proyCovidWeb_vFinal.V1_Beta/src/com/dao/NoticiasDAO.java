package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entidad.Administrador;
import com.entidad.Noticias;
import com.util.Conexion;

public class NoticiasDAO {
	
	Conexion cn = new Conexion();
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	int r;
	
	//Operaciones CRUD
	public List listar() {
		String sql ="Select * from tb_noticias";
		List<Noticias> lista = new ArrayList<>();
		try {
			con = cn.getConexion();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				Noticias not = new Noticias();
				not.setIdNoti(rs.getInt(1));
				not.setTituloNoti(rs.getString(2));
				not.setDescripNoti(rs.getString(3));
				lista.add(not);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return lista;
	}
	
	public int agregar(Noticias not) {
		String sql="insert into tb_noticias(titulo_noticia,contenido_noticia)values(?,?)";
		try {
			con = cn.getConexion();
			ps = con.prepareStatement(sql);
			ps.setString(1, not.getTituloNoti());
			ps.setString(2, not.getDescripNoti());
			ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return r;
	}
	
	
	public Noticias listarId(int id) {
		Noticias not = new Noticias();
		String sql = "Select * from tb_noticias where idnoticia=" + id;
		try {
			con = cn.getConexion();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				not.setTituloNoti(rs.getString(2));
				not.setDescripNoti(rs.getString(3));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return not;
	}
	
	
	
	public int actualizar(Noticias not) {
		String sql="update tb_noticias set titulo_noticia=?,contenido_noticia=? where idnoticia=?";
		try {
			con = cn.getConexion();
			ps = con.prepareStatement(sql);
			ps.setString(1, not.getTituloNoti());
			ps.setString(2, not.getDescripNoti());
			ps.setInt(3, not.getIdNoti());
			ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return r;
	}
	
	public void eliminar(int id) {
		String sql="delete from tb_noticias where idnoticia=" + id;
		try {
			con = cn.getConexion();
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
