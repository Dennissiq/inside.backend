package br.inside.model.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.sun.istack.internal.NotNull;

@Entity(name="tb_comentario")
public class Comentario {
	
	@Id
	@NotNull
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_comentario")
	private int id;
	
	@Column(name="comentario")
	private String comentario;
	
	@Column(name="dt_comentario")
	private Date dtComentario;
	
	@NotNull
	@ManyToOne
	@JoinColumn(name="id_recurso")
	private Recurso recurso;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	public Date getDtComentario() {
		return dtComentario;
	}

	public void setDtComentario(Date dtComentario) {
		this.dtComentario = dtComentario;
	}

	public Recurso getRecurso() {
		return recurso;
	}

	public void setRecurso(Recurso recurso) {
		this.recurso = recurso;
	}

	@Override
	public String toString() {
		return "Comentarios [id=" + id + ", comentario=" + comentario + ", dtComentario=" + dtComentario
				+ ", recurso=" + recurso + "]";
	}

}
