package br.inside.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import br.inside.model.entity.Arquivo;
import br.inside.model.entity.Comentario;
import br.inside.model.entity.Demanda;
import br.inside.model.entity.Funcionario;
import br.inside.model.entity.Projeto;
import br.inside.model.entity.User;
import br.inside.model.service.ArquivoService;
import br.inside.model.service.ComentarioService;
import br.inside.model.service.DemandaService;
import br.inside.model.service.FuncionarioService;
import br.inside.model.service.ProducaoService;
import br.inside.model.service.ProjetoService;

@Controller
public class DemandaController {

	@Autowired
	private DemandaService demandaService;
	
	@Autowired
	private FuncionarioService funcionarioService;

	@Autowired
	private ProducaoService producaoService;
	
	@Autowired
	private ComentarioService comentarioService;
	
	@Autowired
	private ArquivoService arquivoService;
	
	@Autowired
	private ProjetoService projetoService;
	
	@RequestMapping("/demandas")
	public String demandasView(Model model, HttpSession session, String chave) throws IOException {
		
		List<Demanda> lista;
		
		if (chave != null && chave.length() > 0) {
			lista = demandaService.listarDemandas(chave);
		} else {
			User u = (User) session.getAttribute("usuario");
			Funcionario f = funcionarioService.buscarFuncionario(u);
			lista = demandaService.listarDemandasPorAnalista(f);
		}
		
		session.setAttribute("lista", lista);
		return "Demandas";
	}
	
	@RequestMapping("/novaDemanda")
	public String novoDemandaForm(Model model, HttpSession session, int idProjeto) {			
		try {
			List<Funcionario> analistas = funcionarioService.listarFuncionarios(2);
			session.setAttribute("idProjeto", idProjeto);
			model.addAttribute("analistas", analistas);
			return "CadastroDemanda";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "CadastroDemanda";
		}		
	}
	
	@RequestMapping("/addDemanda")
	public String addDemanda(@Valid Demanda demanda, Model model, HttpSession session) {
		System.out.println("AddDemanda");
		try {			
			Funcionario funcionario = new Funcionario();
			funcionario.setIdFuncionario(demanda.getFuncionario().getIdFuncionario());
			funcionario = funcionarioService.buscarFuncionario(funcionario.getIdFuncionario());
			demanda.setFuncionario(funcionario);			
			
			if(demandaService.validPeriod(demanda)) {
				demanda = demandaService.criar(demanda);
				return "redirect: projetos";
			} else {
				String error = "O analista j� possui tarefas agendadas para este per�odo.";
				session.setAttribute("error", error);
				return "redirect: novaDemanda?idProjeto=" + demanda.getProjeto().getId();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return "CadastroDemanda";
		}	
	}	
	
	@RequestMapping("/editarDemanda")
	public String editarDemanda(Model model, HttpSession session, int idDemanda) throws IOException {
		List<Funcionario> analistas = funcionarioService.listarFuncionarios(2);
		Demanda demanda = demandaService.buscarDemanda(idDemanda);	
		
		model.addAttribute("demanda", demanda);
		model.addAttribute("analistas", analistas);
		return "EditarDemanda";	
	}
	
	@RequestMapping("/atualizar_demanda")
	public String atualizarDemanda(@Valid Demanda demanda, BindingResult erros, Model model, HttpSession session) throws IOException{		
		
		if(!erros.hasErrors()) {	
			demandaService.atualizar(demanda);
			return "redirect: projetos";
			
		}else {
			System.out.println(erros.toString());
			return "redirect: editarDemanda?idDemanda=" + demanda.getId();
		}
	}	

	@RequestMapping("/iniciarTarefa")
	public String atualizarProjeto(Model model, HttpSession session, int idDemanda) {
		demandaService.iniciarTarefa(idDemanda,producaoService);
		return "redirect: detalheDemanda?idDemanda=" + idDemanda;
	}
	
	@RequestMapping("/pausarTarefa")
	public String pausarTarefa(Model model, HttpSession session, int idDemanda) throws IOException {
		demandaService.pausarTarefa(idDemanda, producaoService);	
		
		Demanda demanda = demandaService.buscarDemanda(idDemanda);
		demanda.setDuracao(producaoService.calcularTotalProducao(demanda));
		demandaService.atualizar(demanda);
		
		try {
			return "redirect: detalheDemanda?idDemanda=" + idDemanda;
			} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		return null;
	}
	
	@RequestMapping("/finalizarTarefa")
	public String finalizarTarefa(Model model, HttpSession session, int idDemanda) {
		Demanda d = demandaService.buscarDemanda(idDemanda);
		
		if(d.getStatus().equals("pausado")) {
			demandaService.pausarTarefa(idDemanda, producaoService);
		}
		
		Demanda demanda = demandaService.finalizarTarefa(idDemanda, producaoService);		
		model.addAttribute("demanda", demanda);
		
		return "redirect: detalheDemanda?idDemanda=" + idDemanda;
	}
	
	@RequestMapping("/detalheDemanda")
	public String detalheDemanda(Model model, HttpSession session, int idDemanda) {
		Demanda demanda = demandaService.buscarDemanda(idDemanda);
		demanda.setComentarios(comentarioService.listarComentarios(demanda));
		demanda.setArquivos(arquivoService.listarArquivos(demanda));
		model.addAttribute("demanda", demanda);
		return "DetalheDemanda";
	}
	
	
	@RequestMapping("/addComentario")
	public String addComentario(@Valid Comentario comentario, Model model, HttpSession session) {
		
		User usuario = (User) session.getAttribute("usuario");
		int idDemanda = comentario.getDemanda().getId();
		Date date = new Date();		
		comentario.setDtComentario(date);
		
		Demanda demanda = demandaService.buscarDemanda(idDemanda);
		comentario.setDemanda(demanda);
		comentario.setUsuario(usuario);
		comentario = demandaService.addComentario(comentario);
		
		demanda = demandaService.buscarDemanda(idDemanda);
		model.addAttribute("demanda", demanda);
		return "redirect: detalheDemanda?idDemanda=" + idDemanda;
	}
	
	@RequestMapping("/upload")
	public String upload(HttpServletRequest request, Model model, HttpSession session, String idDemanda, String nome) {
		try {
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile multipartFile = multipartRequest.getFile("file");
						
			String _fileName = multipartFile.getOriginalFilename();
			
			String type = _fileName.split("\\.")[1];
			String fileName = nome + "." + type;

			//comentar-start
			String filePath = "C:/TI/Utilitarios/inside.backend/inside/WebContent/uploads";
			
			File fileToSave = new File(filePath+"/"+fileName);
			File file = new File("C:\\TI\\Utilitarios\\inside.backend\\inside\\WebContent\\uploads");
			//comentar-end
			
//			String filePath = "D:/Users/tiden/git/inside.backend/inside/WebContent/uploads";
//			File fileToSave = new File(filePath+"/"+fileName);


	        if (!file.exists()) {
	            if (file.mkdir()) {
	            	System.out.println("Directory created!");
	            } else {
	                System.out.println("Failed to create directory!");
	            }
	        }
	        
	        multipartFile.transferTo(fileToSave);
	        
	        Arquivo arquivo = new Arquivo();

	        //comentar-start
	        arquivo.setDiretorio("C:\\TI\\Utilitarios\\inside.backend\\inside\\WebContent\\uploads\\" + fileName);
	        //comentar-end

	        //arquivo.setDiretorio("D:\\Users\\tiden\\git\\inside.backend\\inside\\WebContent\\uploads" + fileName);

	        arquivo.setNome(nome);
	        arquivo.setType(type);
			
			Demanda demanda = demandaService.buscarDemanda(Integer.parseInt(idDemanda));
			
			arquivo.setDemanda(demanda);
			
			arquivo = demandaService.addArquivo(arquivo);
			
			demanda = demandaService.buscarDemanda(Integer.parseInt(idDemanda));
						
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect: detalheDemanda?idDemanda=" + idDemanda;
	}
	
	@RequestMapping("/agenda")
	public String Cronograma() {
		
		return "Calendario";
	}
	
	@RequestMapping("/cronograma")
	public String Cronograma(Model model, HttpSession session, int idProjeto) {				
		Projeto projeto = projetoService.buscarProjeto(idProjeto);
		model.addAttribute("projeto", projeto);
		
		return "Calendario";
	}
}