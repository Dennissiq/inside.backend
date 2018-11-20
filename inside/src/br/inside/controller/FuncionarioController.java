package br.inside.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.inside.model.entity.Cargo;
import br.inside.model.entity.Cliente;
import br.inside.model.entity.Funcionario;
import br.inside.model.entity.Perfil;
import br.inside.model.entity.SendMail;
import br.inside.model.entity.User;
import br.inside.model.service.CargoService;
import br.inside.model.service.FuncionarioService;
import br.inside.model.service.UserService;

@Controller
public class FuncionarioController {
	
	@Autowired
	private FuncionarioService funcionarioService;
	
	@Autowired
	private CargoService cargoService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/analistas")
	public String analista(Model model, HttpSession session) throws IOException {
		return "Analistas";
	}
	
	@RequestMapping("/novo_analista")
	public String novo(Model model, HttpSession session ) throws IOException{
		return "CadastroAnalista";
	}	
	
	@RequestMapping("/novo_admin")
	public String novoAdmin(Model model, HttpSession session ) throws IOException{
		return "CadastroAdmin";
	}	
	
	@RequestMapping("/cadastrar_analista")
	public String criarFuncionario(@Valid Funcionario funcionario, BindingResult erros, Model model, HttpSession session) throws IOException{
		try {
			if(!erros.hasErrors()) {
				Perfil p = new Perfil();				
				p.setId(4);
				p.setNome("Analista");
				
				User user = new User();
				user.setLogin(funcionario.getEmail());
				user.setSenha(((int)(Math.random() * ( 99999 - 11111 )) + 11111)+"" );
				user.setPerfil(p);
				
				Cargo c = new Cargo();
				c.setId(2);
				c.setDescricao(funcionario.getEspecialidade());
				
				funcionario.setCargo(c);
				funcionario.setUser(userService.inserir(user));
				
				funcionario = funcionarioService.inserirFuncionario(funcionario);
				model.addAttribute("funcionario", funcionario);
				
				SendMail sm = new SendMail("smtp.gmail.com","465");
				sm.sendMail("auth.insidecompany@gmail.com",funcionario.getEmail(),"Olá "+ funcionario.getNome() +", está pronto para um novo desafio?", funcionario.getNome() + ", seu acesso à plataforma já está disponível!\nSeu usuário é: " + funcionario.getEmail() + "\nSua senha de acesso é: " + user.getSenha());
				
				return listarFuncionarios(session, model);
				
			}else {
				return "CadastroAnalista";
			}
		} catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("erro", e);
			return "Erro";
			
		}
	}
	
	@RequestMapping("/cadastrar_admin")
	public String criarAdmin(@Valid Funcionario funcionario, BindingResult erros, Model model, HttpSession session) throws IOException{
		try {
			if(!erros.hasErrors()) {
				Perfil p = new Perfil();				
				p.setId(3);
				
				User user = new User();
				user.setLogin(funcionario.getEmail());
				user.setSenha(((int)(Math.random() * ( 99999 - 11111 )) + 11111)+"" );
				user.setPerfil(p);
				
				Cargo c = new Cargo();
				c.setId(3);
				
				funcionario.setCargo(c);
				funcionario.setUser(userService.inserir(user));
				
				funcionario = funcionarioService.inserirFuncionario(funcionario);
				model.addAttribute("funcionario", funcionario);
				
				SendMail sm = new SendMail("smtp.gmail.com","465");
				sm.sendMail("auth.insidecompany@gmail.com",funcionario.getEmail(),"Olá "+ funcionario.getNome() +", está pronto para um novo desafio?", funcionario.getNome() + ", seu acesso à plataforma já está disponível!\nSeu usuário é: " + funcionario.getEmail() + "\nSua senha de acesso é: " + user.getSenha());
				
				return "redirect: listar_gestores";
				
			}else {
				return "CadastroAdmin";
			}
		} catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("erro", e);
			return "Erro";
			
		}
	}
	
	@RequestMapping("/listar_analistas")
	public String listarFuncionarios(HttpSession session, Model model) {
		try {
			
			List<Funcionario> lista;
			lista = funcionarioService.listarFuncionarios(2);
			
			session.setAttribute("lista", lista);
			return "Analistas";
			
		} catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("erro", e);
			return "Erro";
		}		
	}
	@RequestMapping("/listar_gestores")
	public String listarAdmin(HttpSession session, Model model) {
		try {
			
			List<Funcionario> lista;
			lista = funcionarioService.listarFuncionarios(3);
			
			session.setAttribute("lista", lista);
			return "Admin";
			
		} catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("erro", e);
			return "Erro";
		}		
	}
	
	
	@RequestMapping("/alterarDados")
	public String atualizar(Funcionario funcionario, Model model, HttpSession session) {
		try {			
			Cargo c = new Cargo();
			c.setId(2);
			funcionario.setCargo(c);
			funcionario.getUser().setSenha(funcionario.getUser().getSenha());
		
			Funcionario f = (Funcionario) session.getAttribute("funcionario");
			funcionario.getUser().setPerfil(f.getUser().getPerfil());
			funcionario.getUser().setLogin(f.getUser().getLogin());
			
			userService.atualizarUsuario(funcionario.getUser());
			funcionario = funcionarioService.atualizarFuncionario(funcionario);			
			model.addAttribute("funcionario", funcionario);
			
			return "EditarPerfil";
		} catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("erro", e);
			return "Erro";
		}
	}
}
