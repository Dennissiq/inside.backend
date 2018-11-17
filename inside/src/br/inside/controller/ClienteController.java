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
import br.inside.model.service.ClienteService;

@Controller
public class ClienteController {
	
	@Autowired
	private ClienteService cService;
	
	@RequestMapping("/novo_cliente")
	public String novo(Model model, HttpSession session ) throws IOException{
		return "CadastroCliente";
	}	
	
	@RequestMapping("/cadastrar_cliente")
	public String criarCliente(@Valid Cliente cliente, BindingResult erros, Model model, HttpSession session) throws IOException{
		try {
			if(!erros.hasErrors()) {
				Cliente clie = new Cliente();
				clie.setNome(cliente.getNome());
				clie.setCnpj(cliente.getCnpj());
				clie.setRepresentante(cliente.getRepresentante());
				clie.setEmail(cliente.getEmail());
				clie.setTelefone(cliente.getTelefone());
				clie.setEndereco(cliente.getEndereco());
				
				cliente = cService.inserirCliente(cliente);

				model.addAttribute("cliente", cliente);
				
				return "redirect: clientes";
				
			}else {
				return "Clientes";
			}
		} catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("erro", e);
			return "Erro";
			
		}
	}
	
	@RequestMapping("/clientes")
	public String listarClientes(HttpSession session, Model model) {
		try {
			
			List<Cliente> lista;
			lista = cService.listarClientes();
			
			session.setAttribute("lista", lista);
			return "Clientes";
			
		} catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("erro", e);
			return "Erro";
		}		
	}
	
	@RequestMapping("/detalheCliente")
	public String detalheCliente(Model model, HttpSession session, int id) {
		try {
			Cliente cliente = cService.buscarCliente(id);		
			model.addAttribute("cliente", cliente);
			return "EditarCliente";
		}catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("erro", e);
			return "Erro";
		}	
	}
	
	@RequestMapping("/atualizar_cliente")
	public String attCliente(@Valid Cliente cliente, BindingResult erros, Model model, HttpSession session) throws IOException{
		try {
			if(!erros.hasErrors()) {
				Cliente clie = new Cliente();
				clie.setNome(cliente.getNome());
				clie.setCnpj(cliente.getCnpj());
				clie.setRepresentante(cliente.getRepresentante());
				clie.setEmail(cliente.getEmail());
				clie.setTelefone(cliente.getTelefone());
				clie.setEndereco(cliente.getEndereco());
				
				cliente = cService.atualizarCliente(cliente);

				model.addAttribute("cliente", cliente);
				
				return "redirect: clientes";
				
			}else {
				return "Clientes";
			}
		} catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("erro", e);
			return "Erro";
			
		}
	}
	
}
