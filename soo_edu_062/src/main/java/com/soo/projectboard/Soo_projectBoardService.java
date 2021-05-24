package com.soo.projectboard;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service("Soo_projectBoardService")
public interface Soo_projectBoardService {

	public int getListCount() throws Exception;
	//public List<Soo_projectBoardVO> getBoardlist(Map<String, Integer> hashmap) throws Exception;	
	//public List<Soo_projectBoardVO> getBoardlist() throws Exception;
	public List<Map<String, Object>> selectBoardList(Criteria cri) throws Exception;
	//public void boardInsert(Soo_projectBoardVO boardvo) throws Exception;
	public void board_insert(Soo_projectBoardVO boardvo) throws Exception;
	public Soo_projectBoardVO boardView(int board_seq)throws Exception;
	public int boardUpdate(Soo_projectBoardVO boardvo)throws Exception;
	public int boardDelete(int board_seq) throws Exception;
}