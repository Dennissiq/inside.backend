package br.inside.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.sun.istack.internal.NotNull;

@Entity(name="tb_arquivo")
public class Arquivo {
	
	@Id
	@NotNull
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_arquivo")
	private int id;
	
	@Column(name="diretorio_arq")
	private String diretorio;
	
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

	public String getDiretorio() {
		return diretorio;
	}

	public void setDiretorio(String diretorio) {
		this.diretorio = diretorio;
	}

	public Recurso getRecurso() {
		return recurso;
	}

	public void setRecurso(Recurso recurso) {
		this.recurso = recurso;
	}

	@Override
	public String toString() {
		return "Arquivo [id=" + id + ", diretorio=" + diretorio + ", recurso=" + recurso + ", getId()=" + getId()
				+ ", getDiretorio()=" + getDiretorio() + ", getRecurso()=" + getRecurso() + "]";
	}
	
}
