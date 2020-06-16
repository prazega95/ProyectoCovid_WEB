package com.entidad;

public class Cifras {
	int codCifras;
	String departamento;
	int infectados;
	int recuperados;
	int muertos;
	int hospitalizados;
	Sintomas sintomas;
	
	public Cifras(){
		
	}

	public Cifras(int codCifras, String departamento, int infectados, int recuperados, int muertos, int hospitalizados, Sintomas sintomas) {
		
		this.codCifras = codCifras;
		this.departamento = departamento;
		this.infectados = infectados;
		this.recuperados = recuperados;
		this.muertos = muertos;
		this.hospitalizados = hospitalizados;
		this.sintomas = sintomas;
	}

	public int getCodCifras() {
		return codCifras;
	}

	public void setCodCifras(int codCifras) {
		this.codCifras = codCifras;
	}

	public String getDepartamento() {
		return departamento;
	}

	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}

	public int getInfectados() {
		return infectados;
	}

	public void setInfectados(int infectados) {
		this.infectados = infectados;
	}

	public int getRecuperados() {
		return recuperados;
	}

	public void setRecuperados(int recuperados) {
		this.recuperados = recuperados;
	}

	public int getMuertos() {
		return muertos;
	}

	public void setMuertos(int muertos) {
		this.muertos = muertos;
	}
	
	

	public int getHospitalizados() {
		return hospitalizados;
	}

	public void setHospitalizados(int hospitalizados) {
		this.hospitalizados = hospitalizados;
	}

	public Sintomas getSintomas() {
		return sintomas;
	}

	public void setSintomas(Sintomas sintomas) {
		this.sintomas = sintomas;
	}
	
	
	
	
}
