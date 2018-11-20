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
import br.inside.model.entity.Projeto;
import br.inside.model.entity.User;
import br.inside.model.service.ClienteService;
import br.inside.model.service.DemandaService;
import br.inside.model.service.ProjetoService;

@Controller
public class ProjetoController {

	@Autowired
	private ProjetoService projetoService;
	
	@Autowired
	private DemandaService demandaService;
	
	@Autowired
	private ClienteService clienteService;

	@RequestMapping("/projetos")
	public String projetosView(Model model, HttpSession session, String chave) {
		
		List<Projeto> lista;
		
		if (chave != null && chave.length() > 0) {
			lista = projetoService.listarProjetos(chave);
		} else {
			lista = projetoService.listarProjetos();
			
			for (Projeto projeto : lista) {
				projeto.setDemandas(demandaService.listarDemandas(projeto));
			}
		}
		
		session.setAttribute("lista", lista);		
		return "Projetos";
	}
	
	@RequestMapping("/novoProjeto")
	public String novoProjetoForm(Model model, HttpSession session) throws IOException {		
		List<Cliente> clientes = clienteService.listarClientes();
		model.addAttribute("clientes", clientes);
		return "CadastroProjeto";
	}
	
	@RequestMapping("/addProjeto")
	public String addProjeto(@Valid Projeto projeto, Model model, HttpSession session) {		
		try {
			Cliente c = new Cliente();
			c.setId(2);
			
			projeto.setCliente(c);
			
			projeto.setUser((User)session.getAttribute("usuario"));
			projeto = projetoService.criar(projeto);
			
			return "redirect: projetos";
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		return "CadastroProjeto";
	}
		
	@RequestMapping("/atualizar_projeto")
	public String atualizarProjeto(@Valid Projeto projeto, BindingResult erros, Model model, HttpSession session) throws IOException{
		
		if(!erros.hasErrors()) {			
			projetoService.atualizarProjeto(projeto);
			return "redirect: projetos";			
		}else {
			System.out.println(erros.toString());
			return "redirect: editarProjeto?id=" + projeto.getId();
		}
	}
	
	@RequestMapping("/editarProjeto")
	public String detalheProjeto(Model model, HttpSession session, int id) {
		Projeto projeto = projetoService.buscarProjeto(id);		
		model.addAttribute("projeto", projeto);
		return "EditarProjeto";	
	}
}
