package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.entidad.Departamento;

import com.util.Conexion;


public class DepartamentoDAO {
	private Conexion cn=new Conexion();
	
	public List<Departamento> listar() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql ="Select distinct Departamento from tb_sintomas";
		List<Departamento> lista = new ArrayList<Departamento>();
		try {
			con = cn.getConexion();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				Departamento dis = new Departamento();
				dis.setCodigo(rs.getString(1));
				dis.setNombre(rs.getString(1));
				
				
				lista.add(dis);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return lista;
	}
}
