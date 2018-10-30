package br.inside.model.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.inside.model.dao.RecursoDAO;
import br.inside.model.entity.Arquivo;
import br.inside.model.entity.Comentario;
import br.inside.model.entity.Demanda;
import br.inside.model.entity.Recurso;
import br.inside.model.entity.User;

@Service
public class RecursoService {
	
	@Autowired
	private RecursoDAO dao;
	
	@Autowired
	private ComentarioService comentarioService;
	
	@Autowired
	private ArquivoService arquivoService;
	
	@Transactional
	public Comentario criarRecurso(Demanda demanda, User usuario, Comentario comentario) {
		
		Recurso recurso = dao.criarRecurso(demanda, usuario);
		
		comentario.setRecurso(recurso);
		
		return comentarioService.criar(comentario); 
	}
	
	@Transactional
	public Arquivo criarRecurso(Demanda demanda, User usuario, Arquivo arquivo) {
		
		Recurso recurso = dao.criarRecurso(demanda, usuario);
		
		arquivo.setRecurso(recurso);
		
		return arquivoService.persistir(arquivo); 
	}
	
	@Transactional
	public void removerRecurso(Recurso recurso) {
		dao.removerRecurso(recurso);
	}


}
