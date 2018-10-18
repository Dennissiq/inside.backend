package br.inside.model.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.inside.model.dao.ComentarioDAO;
import br.inside.model.entity.Comentario;

@Service
public class ComentarioService {
	
	
	@Autowired
	private ComentarioDAO dao;
	
	@Transactional
	public Comentario criar(Comentario comentario) {		
		return dao.criar(comentario);
	}
	
	@Transactional
	public void remover(Comentario comentario) {
		dao.removerComentario(comentario);
	}
}
