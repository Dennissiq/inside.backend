package br.inside.model.entity;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.sun.istack.internal.NotNull;

@Entity(name="tb_producao")
public class Producao {
	
	@Id
	@NotNull
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_producao")
	private int id;
	
	@NotNull
	private Date data;
	
	@NotNull
	@Column(name="hr_inicio")
	private Timestamp horaInicio;
	
	@Column(name="hr_fim")
	private Timestamp horaFim;
		
	@ManyToOne
	@JoinColumn(name="id_demanda")
	private Demanda demanda;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public Timestamp getHoraInicio() {
		return horaInicio;
	}

	public void setHoraInicio(Timestamp horaInicio) {
		this.horaInicio = horaInicio;
	}

	public Timestamp getHoraFim() {
		return horaFim;
	}

	public void setHoraFim(Timestamp horaFim) {
		this.horaFim = horaFim;
	}

	public Demanda getDemanda() {
		return demanda;
	}

	public void setDemanda(Demanda demanda) {
		this.demanda = demanda;
	}

	@Override
	public String toString() {
		return "Producao [id=" + id + ", data=" + data + ", horaInicio=" + horaInicio + ", horaFim=" + horaFim
				+ "]";
	}
}
