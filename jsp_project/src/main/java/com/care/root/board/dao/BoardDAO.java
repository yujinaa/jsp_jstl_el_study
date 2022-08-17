package com.care.root.board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.care.root.board.dto.BoardDTO;
import com.care.root.paging.PageCount;

public class BoardDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	public BoardDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이브 로드 성공");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "id", "pwd");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//list메소드 작성
	public ArrayList<BoardDTO> list(int start, int end){
//		String sql = "select * from test_board";
		String sql= "select B.* from(select rownum rn, A.* from"
				+ "(select * from test_board order by idgroup desc)A)B where rn between ? and ?";
		//내림차순으로 정렬한 값 ( ) 을 A라고 쓰겠다. 
		//rownum을 rn 별칭으로 표현하고 A에대한 모든값을 표현하는데 그걸 B라고 표현하겠다
		//B에 대한 모든 값 중에서 rn에 대해 3과 5사이에 있는 값을 가지고와라

		
		//정렬하기
		//String sql = "select * from test_board order by idgroup desc,step asc"; //desc :내림차순,asc:오름차순
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		try { //db접근 위해 예외처리 후 , 객체를 만들어서 각각의 값들 실행하기
			ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs=ps.executeQuery();
			while(rs.next()) {         //데이터 얻어오기 코드
				BoardDTO dto = new BoardDTO();
				dto.setId(rs.getInt("id"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));

				dto.setSavedate(rs.getTimestamp("savedate"));
				dto.setHit(rs.getInt("hit"));
				dto.setIdgroup(rs.getInt("idgroup"));
				dto.setStep(rs.getInt("step"));
				dto.setIndent(rs.getInt("indent"));

				list.add(dto);

			}
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void writeSave(String name, String title, String content) { //name, title, content 값을 넘겨받는다
		String sql="insert into test_board(id, name, title, content, idgroup,step, indent)"
				+"values(test_board_seq.nextval,?,?,?, test_board_seq.currval,0,0)";   //test_board_seq가 0이었다가 nextval을 만나면서 1씩 증가한다. 가상의 넘버링.        
		//test_board_seq.currval은 현재값을 의미하는데 id가 1이면 idgroup도 1이어야해서(같은값이어야 한다) 현재값으로 가져오는것
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, name);          //ps를 이용해 ?자리에 채워넣는다
			ps.setString(2, title);
			ps.setString(3, content);

			ps.executeUpdate();    //실행하기
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//조회수 증가시키기
	private void upHit(String num) {    
		String sql = "update test_board set hit=hit+1 where id="+num;
		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public BoardDTO contentView(String num, int flag) {
		if(flag==1)
			upHit(num);

		String sql= "select * from test_board where id=" +num; //num은 숫자형태로 만들었기 때문에 ' '가 필요없다
		BoardDTO dto= new BoardDTO();
		try {
			ps = con.prepareStatement(sql);
			rs= ps.executeQuery();   //db로부터 데이터베이스 가져오고
			while(rs.next()) {//그 데이터가 있다면   (if, while 둘 중에 아무거나 써도된다)
				dto.setId(rs.getInt("id"));//dto에 저장한다
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));

				dto.setSavedate(rs.getTimestamp("savedate"));
				dto.setHit(rs.getInt("hit"));
				dto.setIdgroup(rs.getInt("idgroup"));
				dto.setStep(rs.getInt("step"));
				dto.setIndent(rs.getInt("indent"));
			}
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//수정하기
	public void modify(String id, String name, String title, String content) {
		String sql = "update test_board set name=?, title=?, content=? where id=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, title);
			ps.setString(3, content);
			ps.setString(4, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int delete(String id) {
		String sql = "delete from test_board where id="+id;
		int result=0;
		try {
			ps = con.prepareStatement(sql);
			result=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	//step맞추기(오름차순이라 최신글이 낮은 숫자로 위쪽에 위치, 나중에 쓴 글이 높은 숫자로 아래위치)
	//step으로 같은 그룹에 대한 위치잡기
	private void replyShape(BoardDTO dto) {
		String sql="update test_board set step =step+1 where idgroup=? and step >?";
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, dto.getIdgroup());
			ps.setInt(2, dto.getStep());
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
	
	//답글쓰기
	public void reply(BoardDTO dto) {
		replyShape(dto);
		String sql=
				"insert into test_board(id, name, title, content, idgroup,step, indent)"
				+"values(test_board_seq.nextval,?,?,?,?,?,?)";
		try {           //db로 전송
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName()); //순서지정
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			
			ps.setInt(4, dto.getIdgroup());
			ps.setInt(5, dto.getStep()+1); //+1을 해준이유이다. step은 답변에 대한 위치를 지정하기 위한것
			ps.setInt(6, dto.getIndent()+1);
			
			ps.executeUpdate();  //이게 있어야 실행됨
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	//글에 대한 총 갯수를 얻어오는 메소드 
	public int getTotalPage() {
		String sql = "select count(*) from test_board"; //> 글의 개수만큼 전체 count를 가지고와라
		int totalPage = 0;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				totalPage= rs.getInt(1); //꼭 1이라고 써야 결과값(전체 글 개수:  totalPage)을 제대로 가지고온다
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalPage;
	}
	
	//연산해주는 메소드
	public PageCount pagingNum(int start) {
		PageCount pc = new PageCount();
		if(start==0) start=1;                       //처음 start값은 넘겨주는 게 없기 때문에 0으로 한다. start = 1 : 페이지 시작번호
		                                            //즉, 스타트 값이 0으로 없다면 첫 번째 페이지를 보여줘라
		
		int pageNum=3;                              //한 페이지에 3개씩 보여주겠다
		int totalPage = getTotalPage();         //글에 대한 총 개수 얻어오기
		
		
		int totEndPage = totalPage/pageNum;
		if(totalPage % pageNum !=0) {         //글 갯수가 홀수라면 
			totEndPage = totEndPage +1;     //남는수에 +1을 해서 페이지 수를 맞춰서 늘린다
		}
		
		int endPage = start * pageNum;              //끝 번호 만들기, 이 코드 2줄이 위의 쿼리문의 ?,?에 들어가는 값이 된다
		int startPage = endPage +1 - pageNum;  //시작 값 만들기
		
		pc.setTotEndPage(totEndPage);  //값들 저장하기
		pc.setStartPage(startPage);
		pc.setEndPage(endPage);
		return pc;
	}

}