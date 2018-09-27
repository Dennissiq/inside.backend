package br.inside.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.inside.model.entity.Cliente;
import br.inside.model.entity.Projeto;
import br.inside.model.entity.User;
import br.inside.model.service.ProjetoService;

@Controller
public class ProjetoController {

	@Autowired
	private ProjetoService projetoService;

	@RequestMapping("/projetos")
	public String projetosView(Model model, HttpSession session, String chave) {
		
		List<Projeto> lista;
		
		if (chave != null && chave.length() > 0) {
			lista = projetoService.listarProjetos(chave);
		} else {
			lista = projetoService.listarProjetos();
		}
		
		session.setAttribute("lista", lista);
		return "Projetos";
	}
	
	@RequestMapping("/novoProjeto")
	public String novoProjetoForm(Model model, HttpSession session) {			
		return "CadastroProjeto";
	}
	
	@RequestMapping("/addProjeto")
	public String addProjeto(@Valid Projeto projeto, Model model, HttpSession session) {		
		Cliente c = new Cliente();
		c.setId(1);
		
		projeto.setCliente(c);
		
		projeto.setUser((User)session.getAttribute("usuario"));
		projeto = projetoService.criar(projeto);
		model.addAttribute("projeto", projeto);		
		return this.projetosView(null, session, null);
	}
	
	@RequestMapping("/atualizarProjeto")
	public String atualizarProjeto(@Valid Projeto projeto, Model model, HttpSession session) {
		projeto = projetoService.atualizar(projeto);
		model.addAttribute("projeto", projeto);
		
		return "DetalheProjeto";
	}
	
	@RequestMapping("/detalheProjeto")
	public String visualizarFilme(@Valid Projeto projeto, Model model) {
		projeto = projetoService.buscarProjeto(projeto.getId());
		model.addAttribute("filme", projeto);
		return "DetalheProjeto";
	}
}
