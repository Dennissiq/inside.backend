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
import br.inside.model.entity.Funcionario;
import br.inside.model.entity.Perfil;
import br.inside.model.entity.SendMail;
import br.inside.model.entity.User;
import br.inside.model.service.FuncionarioService;
import br.inside.model.service.UserService;


@Controller
public class FuncionarioController {
	@Autowired
	private FuncionarioService fService;
	
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
	
	
	@RequestMapping("/cadastrar_analista")
	public String criarFuncionario(@Valid Funcionario funcionario, BindingResult erros, Model model, HttpSession session) throws IOException{
		try {
			if(!erros.hasErrors()) {
				Perfil p = new Perfil();
				p.setId(2);
				p.setNome("Analista");
				
				User user = new User();
				user.setLogin(funcionario.getEmail());
				user.setSenha(((int)(Math.random() * ( 99999 - 11111 )) + 11111)+"" );
				user.setPerfil(p);
				
				Cargo c = new Cargo();
				c.setId(1);
				c.setDescricao(funcionario.getEspecialidade());
				
				funcionario.setCargo(c);
				funcionario.setUser(userService.inserir(user));
				
				funcionario = fService.inserirFuncionario(funcionario);
				model.addAttribute("funcionario", funcionario);
				
				SendMail sm = new SendMail("smtp.gmail.com","465");
				sm.sendMail("auth.insidecompany@gmail.com",funcionario.getEmail(),"Ol� "+ funcionario.getNome() +", est� pronto para um novo desafio?", funcionario.getNome() + ", seu acesso a plataforma j� est� dispon�vel! \nSua senha de acesso �: " + user.getSenha());
				
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
	
	@RequestMapping("/listar_analistas")
	public String listarFuncionarios(HttpSession session, Model model) {
		try {
			
			List<Funcionario> lista;
			lista = fService.listarFuncionarios();
			
			session.setAttribute("lista", lista);
			return "Analistas";
			
		} catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("erro", e);
			return "Erro";
		}		
	}
	
}
