package guest;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GuestTest {

	public static void main(String[] args) throws SQLException {
		
		GuestDAO dao = new GuestDAO();
		
		//create(dao);
		//read(dao);
		//list(dao);
		total(dao);

	}

	private static void total(GuestDAO dao) throws SQLException {
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		
		p("총 레코드 갯수:" + dao.total(map));
		
	}

	private static void list(GuestDAO dao) throws SQLException {
		String col = "";
		String word = "";
		int sno = 1;
		int eno = 5;
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		List<GuestDTO> list = dao.list(map);
		for(int i = 0; i<list.size(); i++){
			GuestDTO dto = list.get(i);
			p(dto);
			p("========================");
		}
		
		
	}

	private static void read(GuestDAO dao) throws SQLException {
		int gno = 1;
		GuestDTO dto = dao.read(gno);
		p(dto);
		
		
	}

	private static void p(GuestDTO dto) {
		
		p("번호:" + dto.getGno());
		p("이름:" + dto.getName());
		p("이메일:" + dto.getEmail());
		p("내용:" + dto.getComments());
		p("날짜:" + dto.getWdate());
		
	}

	private static void create(GuestDAO dao) throws SQLException {
		GuestDTO dto = new GuestDTO();
		
		dto.setName("홍길동");
		dto.setEmail("aaa@naver.com");
		dto.setComments("방명록입니다.");
		
		if(dao.create(dto)){
			p("성공");
		}else{
			p("실패");
		}
		
		
	}

	private static void p(String string) {
		
		System.out.println(string);
		
	}

}
