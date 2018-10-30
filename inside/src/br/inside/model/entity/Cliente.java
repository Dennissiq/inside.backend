package br.inside.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
//import javax.validation.constraints.NotNull;

import com.sun.istack.internal.NotNull;

@Entity(name="tb_cliente")
public class Cliente {
	
	@Id
	@NotNull
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_cliente")
	private int id;
	
	@NotNull
	@Column(name="nome_cliente")
	private String nome;
	
	private String cnpj;
	
	private String representante;
	
	private String telefone;
	
	private String endereco;
	
	@Column(name="email_rep")
	private String email;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getRepresentante() {
		return representante;
	}

	public void setRepresentante(String representante) {
		this.representante = representante;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getTelefone() {
		return telefone;
	}

	public String getCnpj() {
		return cnpj;
	}
	
	public String getEmail() {
		return email;
	}

	public String getEndereco() {
		return endereco;
	}

	@Override
	public String toString() {
		return "Cliente [Id=" + id + ", nome=" + nome + ", CNPJ= " + cnpj + ", representante=" + representante + ", telefone=" + telefone
				+ ", email=" + email + ",Endereco=" + endereco + "]";
	}
	
}
