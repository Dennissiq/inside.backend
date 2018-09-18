package br.inside.model.entity;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

@Entity(name="tb_usuario")
public class User {
	
	@NotNull
	private String login;
	
	@NotNull
	private String senha;
	
	@NotNull
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
}
