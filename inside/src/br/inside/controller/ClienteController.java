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

import br.inside.model.entity.Cliente;
import br.inside.model.entity.User;
import br.inside.model.service.ClienteService;
import br.inside.model.service.UserService;


@Controller
public class ClienteController {
	@Autowired
	private ClienteService cService;
		
	@RequestMapping("/cadastroCliente")
	public String cliente(Model model, HttpSession session) throws IOException {
		return "CadastroCliente";
	}
	
	@RequestMapping("/cadastroCliente")
	public String novo(Model model, HttpSession session ) throws IOException{
		return "CadastroCliente";
	}
	
	/*
	@RequestMapping("/cadastroCliente")
	public String criarCliente(@Valid Cliente cliente, BindingResult erros, Model model, HttpSession session) throws IOException{
		try {
			if(!erros.hasErrors()) {
				Cliente clie = new Cliente();
				clie.setId(1);
				clie.setNome("");
				clie.setCnpj("");
				clie.setRepresentante("");
				clie.setEmail("");
				clie.setTelefone("");
				clie.setEndereco("");
				return listarClientes(session, model);
				
			}else {
				return "cadastroCliente";
			}
		} catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("erro", e);
			return "Erro";
			
		}
	}*/
	
	@RequestMapping("/listar_cliente")
	public String listarClientes(HttpSession session, Model model) {
		try {
			
			List<Cliente> lista;
			lista = cService.listarClientes();
			
			session.setAttribute("lista", lista);
			return "Cliente";
			
		} catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("erro", e);
			return "Erro";
		}		
	}
	
	
	
}
