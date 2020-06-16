package com.entidad;

public class Noticias {
	int idNoti;
	String tituloNoti;
	String descripNoti;

	
	public Noticias() {
		
	}

	public Noticias(int idNoti, String tituloNoti, String descripNoti) {
		this.idNoti = idNoti;
		this.tituloNoti = tituloNoti;
		this.descripNoti = descripNoti;
	}

	public int getIdNoti() {
		return idNoti;
	}

	public void setIdNoti(int idNoti) {
		this.idNoti = idNoti;
	}

	public String getTituloNoti() {
		return tituloNoti;
	}

	public void setTituloNoti(String tituloNoti) {
		this.tituloNoti = tituloNoti;
	}

	public String getDescripNoti() {
		return descripNoti;
	}

	public void setDescripNoti(String descripNoti) {
		this.descripNoti = descripNoti;
	}

	
	
	
	
	
	
	
	
	
}
