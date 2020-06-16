package com.entidad;

public class Sintomas {
	int idSintom;
	String departamento;
	String provincia;
	String distrito;
	String direccion;
	String latitud;
	String longitud;
	String numFamiliar;
	String profesion;
	String priSintoma;
	String segSintoma;
	String terSintoma;
	String cuartSintoma;
	String quintSintoma;
	String sextSintoma;
	String ninguna;
	String email;
	String condicion;
	String resultado;
	
	Paciente paciente;
	
	public Sintomas() {
	}

	public Sintomas(int idSintom, String departamento, String provincia, String distrito, String direccion,
			String latitud, String longitud,String numFamiliar, String profesion, String priSintoma, String segSintoma, String terSintoma,
			String cuartSintoma, String quintSintoma, String sextSintoma, String ninguna, String email,String condicion, String resultado,
			Paciente paciente) {
		
		super();
		this.idSintom = idSintom;
		this.departamento = departamento;
		this.provincia = provincia;
		this.distrito = distrito;
		this.direccion = direccion;
		this.latitud = latitud;
		this.longitud = longitud;
		this.numFamiliar = numFamiliar;
		this.profesion = profesion;
		this.priSintoma = priSintoma;
		this.segSintoma = segSintoma;
		this.terSintoma = terSintoma;
		this.cuartSintoma = cuartSintoma;
		this.quintSintoma = quintSintoma;
		this.sextSintoma = sextSintoma;
		this.ninguna = ninguna;
		this.email = email;
		this.condicion = condicion;
		this.resultado = resultado;
		this.paciente = paciente;
	}

	public int getIdSintom() {
		return idSintom;
	}

	public void setIdSintom(int idSintom) {
		this.idSintom = idSintom;
	}

	public String getDepartamento() {
		return departamento;
	}

	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public String getDistrito() {
		return distrito;
	}

	public void setDistrito(String distrito) {
		this.distrito = distrito;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getLatitud() {
		return latitud;
	}

	public void setLatitud(String latitud) {
		this.latitud = latitud;
	}

	public String getLongitud() {
		return longitud;
	}

	public void setLongitud(String longitud) {
		this.longitud = longitud;
	}

	public String getNumFamiliar() {
		return numFamiliar;
	}

	public void setNumFamiliar(String numFamiliar) {
		this.numFamiliar = numFamiliar;
	}

	public String getProfesion() {
		return profesion;
	}

	public void setProfesion(String profesion) {
		this.profesion = profesion;
	}

	public String getPriSintoma() {
		return priSintoma;
	}

	public void setPriSintoma(String priSintoma) {
		this.priSintoma = priSintoma;
	}

	public String getSegSintoma() {
		return segSintoma;
	}

	public void setSegSintoma(String segSintoma) {
		this.segSintoma = segSintoma;
	}

	public String getTerSintoma() {
		return terSintoma;
	}

	public void setTerSintoma(String terSintoma) {
		this.terSintoma = terSintoma;
	}

	public String getCuartSintoma() {
		return cuartSintoma;
	}

	public void setCuartSintoma(String cuartSintoma) {
		this.cuartSintoma = cuartSintoma;
	}

	public String getQuintSintoma() {
		return quintSintoma;
	}

	public void setQuintSintoma(String quintSintoma) {
		this.quintSintoma = quintSintoma;
	}

	public String getSextSintoma() {
		return sextSintoma;
	}

	public void setSextSintoma(String sextSintoma) {
		this.sextSintoma = sextSintoma;
	}

	public String getNinguna() {
		return ninguna;
	}

	public void setNinguna(String ninguna) {
		this.ninguna = ninguna;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCondicion() {
		return condicion;
	}

	public void setCondicion(String condicion) {
		this.condicion = condicion;
	}

	public String getResultado() {
		return resultado;
	}

	public void setResultado(String resultado) {
		this.resultado = resultado;
	}

	public Paciente getPaciente() {
		return paciente;
	}

	public void setPaciente(Paciente paciente) {
		this.paciente = paciente;
	}
	
	
	
	
	
	
	
	
}
