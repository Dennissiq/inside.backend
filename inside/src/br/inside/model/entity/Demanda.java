package br.inside.model.entity;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.sun.istack.internal.NotNull;

@Entity(name="tb_demanda")
public class Demanda {
	  
	@Id
	@NotNull
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_demanda")
	private int id;
	
	@NotNull
	@Column(name="desc_demanda")
	private String descricao;
	
	@NotNull
	@Temporal(value = TemporalType.DATE)
	@Column(name="dt_inicio")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm a z")
	private Date dtInicio;
	
	@NotNull
	@Temporal(value = TemporalType.DATE)
	@Column(name="dt_fim")
	 @JsonFormat(pattern="yyyy-MM-dd HH:mm a z")
	private Date dtFim;
	
	@NotNull
	private String detalhes;
	
	private Time duracao;
		
	private String status;

	@NotNull
	@ManyToOne
	@JoinColumn(name="id_funcionario")
	private Funcionario funcionario;
	
	@NotNull
	@ManyToOne 
	@JoinColumn(name="id_projeto")
	@JsonIgnore
	private Projeto projeto;
	
	@OneToMany(mappedBy = "demanda", fetch = FetchType.EAGER)
	@JsonIgnore
	private List<Comentario> comentarios;
	
	@OneToMany(mappedBy = "demanda", fetch = FetchType.EAGER)
	@JsonIgnore
	private List<Arquivo> arquivos;
	
	public Date getDtInicio() {
		return dtInicio;
	}

	public void setDtInicio(Date dtInicio) {
		this.dtInicio = dtInicio;
	}

	public Date getDtFim() {
		return dtFim;
	}

	public void setDtFim(Date dtFim) {
		this.dtFim = dtFim;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getDetalhes() {
		return detalhes;
	}

	public void setDetalhes(String detalhes) {
		this.detalhes = detalhes;
	}

	public Time getDuracao() {
		return duracao;
	}

	public void setDuracao(Time duracao) {
		this.duracao = duracao;
	}

	public Funcionario getFuncionario() {
		return funcionario;
	}

	public void setFuncionario(Funcionario funcionario) {
		this.funcionario = funcionario;
	}

	public Projeto getProjeto() {
		return projeto;
	}

	public void setProjeto(Projeto projeto) {
		this.projeto = projeto;
	}

	@Override
	public String toString() {
		return "Demanda [id=" + id + ", descricao=" + descricao + ", dtInicio=" + dtInicio + ", dtFim=" + dtFim
				+ ", detalhes=" + detalhes + ", duracao=" + duracao + ", status=" + status + ", funcionario="
				+ funcionario + ", comentarios=" + comentarios + ", arquivos=" + arquivos
				+ "]";
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<Comentario> getComentarios() {
		return comentarios;
	}

	public void setComentarios(List<Comentario> comentarios) {
		this.comentarios = comentarios;
	}

	public List<Arquivo> getArquivos() {
		return arquivos;
	}

	public void setArquivos(List<Arquivo> arquivos) {
		this.arquivos = arquivos;
	}

	/*public List<Recurso> getRecursos() {
		return recursos;
	}

	public void setRecursos(List<Recurso> recursos) {
		this.recursos = recursos;
	}*/
}
