package memo2;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Memo2Test {

	public static void main(String[] args) throws SQLException {
		
		Memo2DAO dao = new Memo2DAO();
		
		//create(dao);
		//read(dao);
		//list(dao);
		//upviewcnt(dao);
		//update(dao);
		delete(dao);
	}



	private static void delete(Memo2DAO dao) throws SQLException {
		
		int memono = 2;
		
		dao.getRefnum(memono);
		if(dao.delete(memono)){
			p("성공");
		}else{
			p("실패");
		}
		
		
		
	}



	private static void update(Memo2DAO dao) throws SQLException {
		Memo2DTO dto = dao.read(1);
		
		dto.setWname("이병헌");
		dto.setTitle("제목을변경합니다");
		dto.setContent("내용도 변경합니다.");
		
		if(dao.update(dto)){
			p("성공");
		}else{
			p("실패");
		}
		
		p(dao.read(1));
		
	}

	private static void upviewcnt(Memo2DAO dao) throws SQLException {
		int memono = 1;
		p(dao.read(memono));
		dao.upviewcnt(memono);
		p("=================");
		p(dao.read(memono));
	}

	private static void list(Memo2DAO dao) throws SQLException {
		String col = "";
		String word = "";
		int sno = 1;
		int eno = 5;
		
		Map map = new HashMap();
		
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		List<Memo2DTO> list = dao.list(map);
		for(int i =0; i<list.size();i++){
			Memo2DTO dto = list.get(i);
			p2(dto);
			p("=======================");
		}
		
	}

	private static void p2(Memo2DTO dto) {
		p("번호:" + dto.getMemono());
		p("이름:" + dto.getWname());
		p("제목:" + dto.getTitle());
		p("등록날짜:" + dto.getWdate());
		p("조회수:" + dto.getViewcnt());
		p("Grpno:" + dto.getGrpno());
		p("Indent:" + dto.getIndent());
		p("Ansnum:" + dto.getAnsnum());
	}

	private static void read(Memo2DAO dao) throws SQLException {
		int memono = 2;
		Memo2DTO dto = dao.read(memono);
		p(dto);
		
	}

	private static void p(Memo2DTO dto) {
		p("번호:" + dto.getMemono());
		p("이름:" + dto.getWname());
		p("제목:" + dto.getTitle());
		p("내용:" + dto.getContent());
		p("등록날짜:" + dto.getWdate());
		p("조회수:" + dto.getViewcnt());
	}

	private static void create(Memo2DAO dao) throws SQLException {
		
		Memo2DTO dto = new Memo2DTO();
		dto.setTitle("메모입니다.");
		dto.setWname("송길동");
		dto.setContent("내용입니다.");
		
		if(dao.create(dto )){
			p("성공");
		}else{
			p("실패");
		}
		
	}

	private static void p(String string) {
		System.out.println(string);
	}

}
