package com.soo.projectboard;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("Soo_projectBoardService")
public class Soo_projectBoardServiceImpl implements Soo_projectBoardService {

	@Resource
	Soo_projectBoardDAO SooprojectBoardDAO;
	/*
	@Override
	public List<Soo_projectBoardVO> getBoardlist(Map<String, Integer> hashmap) throws Exception {
		
		System.out.println("리스트 서비스!!!!!!!!");
		
		return SooprojectBoardDAO.getBoardlist(hashmap);
	}
	*/
	/*
	@Override
	public List<Soo_projectBoardVO> getBoardlist() throws Exception {
		
		//System.out.println("리스트 서비스!!!!!!!!");
		
		return SooprojectBoardDAO.getBoardlist();
	}
	*/
	@Override
	public List<Map<String, Object>> selectBoardList(Criteria cri) throws Exception {
		
		System.out.println("리스트 서비스!!!!!!!!");
		return SooprojectBoardDAO.selectBoardList(cri);
	}
	
	@Override
	public int getListCount() throws Exception {
		
		int res = SooprojectBoardDAO.getListCount();
		
		return res;
	}
	
	@Override
	public void board_insert(Soo_projectBoardVO boardvo) throws Exception {
		
		 SooprojectBoardDAO.boardInsert(boardvo);
	}
	
	
	@Override
	public Soo_projectBoardVO boardView(int board_seq)throws Exception {
		
		
		//System.out.println("boardView 서비스!!");
			
			
		return SooprojectBoardDAO.boardView(board_seq);
	}
	
	@Override
	public int boardUpdate(Soo_projectBoardVO boardvo)throws Exception {
		
		//System.out.println("boardUpdate 서비스!!");
		
		
		return SooprojectBoardDAO.boardUpdate(boardvo);
	}
	
	@Override
	public int boardDelete(int board_seq)throws Exception {
		
		
		return SooprojectBoardDAO.boardDelete(board_seq);
	}
}
