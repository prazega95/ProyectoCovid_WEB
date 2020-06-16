package com.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entidad.Cifras;
import com.entidad.Departamento;
import com.util.Conexion;

public class CifrasDAO {
private Conexion cn=new Conexion();
	
	public List<Cifras> listar(String Departamento) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;
		
		
		String sql ="call sp_cifras(?)";
		List<Cifras> lista = new ArrayList<Cifras>();
		try {
			con = cn.getConexion();
			cs = con.prepareCall(sql);
			cs.setString(1, Departamento);
			rs = cs.executeQuery();
			while(rs.next()) {
				Cifras cif = new Cifras();
				cif.setDepartamento(rs.getString(1));
				cif.setInfectados(rs.getInt(2));
				cif.setRecuperados(rs.getInt(3));
				cif.setMuertos(rs.getInt(4));
				cif.setHospitalizados(rs.getInt(5));
				lista.add(cif);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return lista;
	}
}
