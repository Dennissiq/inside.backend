package br.inside.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@Entity(name="tb_usuario")
public class User {
	
	@Id
	@NotNull
	private String login;
	
	@NotNull
	private String senha;
	
	@NotNull
	@ManyToOne
	@JoinColumn(name="id_perfil")
	private Perfil perfil;
	
	public Perfil getPerfil() {
		return perfil;
	}
	public void setPerfil(Perfil perfil) {
		this.perfil = perfil;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	@Override
	public String toString() {
		return "{login=" + login + ", senha=" + senha + ", perfil={perfil.id=" + perfil.getId() + ",perfil.nome="+perfil.getNome() +"}}";
	}
}
