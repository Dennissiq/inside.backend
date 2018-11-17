package br.inside.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.inside.model.entity.Funcionario;
import br.inside.model.entity.User;
import br.inside.model.service.CargoService;
import br.inside.model.service.FuncionarioService;
import br.inside.model.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private FuncionarioService funcionarioService;

	@RequestMapping("/index")
	public String loginForm(Model model, HttpSession session) {
		return "index";
	}
	
	@RequestMapping("/logout")
	public String logout(Model model, HttpSession session) {
		session.removeAttribute("error");	
		session.invalidate();			
		return "index";
	}
	
	@RequestMapping("/login")
	public String login(@Valid User user, BindingResult erros, Model model, HttpSession session) throws IOException {
		User userLogged = userService.login(user);
		
		if(userLogged != null){			
			session.setAttribute("usuario", userLogged);
			
			if(userLogged.getPerfil().getNome().equals("Administrador")) { //retornar o proprio perfil que sera o nome da sua 'index'; mudar o nome das jps												
				session.setAttribute("funcionario", "");
				return "redirect: projetos";
			}
			else {
				Funcionario funcionario = funcionarioService.buscarFuncionario(userLogged);				
				session.setAttribute("funcionario", funcionario);
				return "redirect: agenda";
			}				
		}else {			
			model.addAttribute("error", "Login e/ou Senha inválidos.");
			return "index";
		}
	}
	
	@RequestMapping("/perfil")
	public String perfilForm(Model model, HttpSession session) {
		return "EditarPerfil";
	}
	
	@RequestMapping("/perfil_admin")
	public String perfilAdmin(Model model, HttpSession session) {
		return "EditarAdmin";
	}
}