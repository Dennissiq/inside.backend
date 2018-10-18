package br.inside.model.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.sun.istack.internal.NotNull;

@Entity(name="tb_recurso")
public class Recurso {

	@Id
	@NotNull
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_recurso")
	private int id; 
	
	@NotNull
	@ManyToOne
	@JoinColumn(name="id_demanda")
	private Demanda demanda;
	
	@NotNull
	@ManyToOne
	@JoinColumn(name="login")
	private User usuario;
	
	@OneToMany(fetch = FetchType.EAGER)
	private List<Comentario> comentario;
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Demanda getDemanda() {
		return demanda;
	}

	public void setDemanda(Demanda demanda) {
		this.demanda = demanda;
	}

	public User getUsuario() {
		return usuario;
	}

	public void setUsuario(User usuario) {
		this.usuario = usuario;
	}
	
	@Override
	public String toString() {
		return "Recurso [id=" + id + ", demanda=" + demanda + ", usuario=" + usuario + ", comentario=" + comentario
				+ "]";
	}
	
}
