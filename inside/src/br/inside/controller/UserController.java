package br.inside.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.inside.model.entity.User;
import br.inside.model.service.UserService;

public class UserController {
	@Autowired
	private UserService uService;

	@RequestMapping("/index")
	public String loginForm(Model model, HttpSession session) {
		return "index";
	}
	
	@RequestMapping("/login")
	public String login(@Valid User user, BindingResult erros, Model model, HttpSession session) {
		if(uService.login(user)){
			session.setAttribute("usuario", user);
			if(user.getPerfil().getNome() == "Administrador")
				return "projetos";
			else
				return "demandas";
		}else {
			session.setAttribute("error", "Login e/ou Senha inválidos.");
			return "index";
		}
	}
}