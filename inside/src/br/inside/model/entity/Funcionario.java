package br.inside.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CascadeType;

import com.sun.istack.internal.NotNull;

@Entity(name="tb_funcionario")
public class Funcionario {
	
	@Id
	@NotNull
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_funcionario")
	private int id;
	
	@NotNull
	private String nome;
	
	@NotNull
	private String email;
	
	@NotNull
	private String cpf;
	
	@NotNull
	private String localizacao;
	
	@NotNull
	private String celular;
	
	private String rg;
		
	private String observacoes;
	
	private String telefone;
	
	private String especialidade;
	
	@NotNull
	@ManyToOne
	@JoinColumn(name="id_cargo_func")
	private Cargo cargo;
	
	@NotNull
	@ManyToOne
	@JoinColumn(name="login")
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public int getIdFuncionario() {
		return id;
	}

	public void setIdFuncionario(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getRg() {
		return rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public String getObservacoes() {
		return observacoes;
	}

	public void setObservacoes(String observacoes) {
		this.observacoes = observacoes;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getEspecialidade() {
		return especialidade;
	}

	public void setEspecialidade(String especialidade) {
		this.especialidade = especialidade;
	}

	public Cargo getCargo() {
		return cargo;
	}

	public void setCargo(Cargo cargo) {
		this.cargo = cargo;
	}
	
	public String getLocalizacao() {
		return localizacao;
	}

	public void setLocalizacao(String localizacao) {
		this.localizacao = localizacao;
	}
	
	@Override
	public String toString() {
		return "Funcionario [id=" + id + ", nome=" + nome + ", email=" + email + ", cpf=" + cpf + ", localizacao="
				+ localizacao + ", celular=" + celular + ", rg=" + rg + ", observacoes=" + observacoes + ", telefone="
				+ telefone + ", especialidade=" + especialidade + ", cargo=" + cargo + ", user=" + user + "]";
	}

}
