package br.inside.model.entity;

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

import com.sun.istack.internal.NotNull;

@Entity(name="tb_projeto")
public class Projeto {

	@Id
	@NotNull
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_projeto")
	private int id;
	
	@NotNull
	@Column(name="desc_projeto")
	private String descricao;
	
	@NotNull
	@ManyToOne
	@JoinColumn(name="id_cliente")
	private Cliente cliente;	
	
	@NotNull
	private String detalhe;
	
	@NotNull
	private String atividade;
	
	@NotNull
	@Temporal(value = TemporalType.DATE)
	@Column(name="dt_inicio")
	private Date dataInicio;
	
	@NotNull
	@Temporal(value = TemporalType.DATE)
	@Column(name="dt_fim")
	private Date dataFim;
	
	@NotNull
	private int horas;
	
	@NotNull
	@ManyToOne
	@JoinColumn(name="login")
	private User user;	
	
	@NotNull
	private String status;
	
	@OneToMany(fetch = FetchType.EAGER)
	private List<Demanda> demandas;
	
	public List<Demanda> getDemandas() {
		return demandas;
	}

	public void setDemandas(List<Demanda> demandas) {
		this.demandas = demandas;
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

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public String getDetalhe() {
		return detalhe;
	}

	public void setDetalhe(String detalhe) {
		this.detalhe = detalhe;
	}

	public String getAtividade() {
		return atividade;
	}

	public void setAtividade(String atividade) {
		this.atividade = atividade;
	}

	public Date getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}

	public Date getDataFim() {
		return dataFim;
	}

	public void setDataFim(Date dataFim) {
		this.dataFim = dataFim;
	}

	public int getHoras() {
		return horas;
	}

	public void setHoras(int horas) {
		this.horas = horas;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	

	@Override
	public String toString() {
		return "Projeto [id=" + id + ", descricao=" + descricao + ", cliente=" + cliente + ", detalhe=" + detalhe
				+ ", atividade=" + atividade + ", dataInicio=" + dataInicio + ", dataFim=" + dataFim + ", horas="
				+ horas + ", user=" + user + ", status=" + status + ", demandas=" + demandas + "]";
	}
	
}
