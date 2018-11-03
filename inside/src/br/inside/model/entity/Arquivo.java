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
	private String nome;
	
	@NotNull
	private String type;

	@NotNull
	@ManyToOne
	@JoinColumn(name="id_demanda")
	private Demanda demanda;

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
	
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public Demanda getDemanda() {
		return demanda;
	}

	public void setDemanda(Demanda demanda) {
		this.demanda = demanda;
	}

	@Override
	public String toString() {
		return "Arquivo [id=" + id + ", diretorio=" + diretorio + ", nome=" + nome + ", type=" + type + ", demanda="
				+ demanda + "]";
	}
	
}
