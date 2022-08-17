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
			System.out.println("����̺� �ε� ����");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "id", "pwd");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//list�޼ҵ� �ۼ�
	public ArrayList<BoardDTO> list(int start, int end){
//		String sql = "select * from test_board";
		String sql= "select B.* from(select rownum rn, A.* from"
				+ "(select * from test_board order by idgroup desc)A)B where rn between ? and ?";
		//������������ ������ �� ( ) �� A��� ���ڴ�. 
		//rownum�� rn ��Ī���� ǥ���ϰ� A������ ��簪�� ǥ���ϴµ� �װ� B��� ǥ���ϰڴ�
		//B�� ���� ��� �� �߿��� rn�� ���� 3�� 5���̿� �ִ� ���� ������Ͷ�

		
		//�����ϱ�
		//String sql = "select * from test_board order by idgroup desc,step asc"; //desc :��������,asc:��������
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		try { //db���� ���� ����ó�� �� , ��ü�� ���� ������ ���� �����ϱ�
			ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs=ps.executeQuery();
			while(rs.next()) {         //������ ������ �ڵ�
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

	public void writeSave(String name, String title, String content) { //name, title, content ���� �Ѱܹ޴´�
		String sql="insert into test_board(id, name, title, content, idgroup,step, indent)"
				+"values(test_board_seq.nextval,?,?,?, test_board_seq.currval,0,0)";   //test_board_seq�� 0�̾��ٰ� nextval�� �����鼭 1�� �����Ѵ�. ������ �ѹ���.        
		//test_board_seq.currval�� ���簪�� �ǹ��ϴµ� id�� 1�̸� idgroup�� 1�̾���ؼ�(�������̾�� �Ѵ�) ���簪���� �������°�
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, name);          //ps�� �̿��� ?�ڸ��� ä���ִ´�
			ps.setString(2, title);
			ps.setString(3, content);

			ps.executeUpdate();    //�����ϱ�
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//��ȸ�� ������Ű��
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

		String sql= "select * from test_board where id=" +num; //num�� �������·� ������� ������ ' '�� �ʿ����
		BoardDTO dto= new BoardDTO();
		try {
			ps = con.prepareStatement(sql);
			rs= ps.executeQuery();   //db�κ��� �����ͺ��̽� ��������
			while(rs.next()) {//�� �����Ͱ� �ִٸ�   (if, while �� �߿� �ƹ��ų� �ᵵ�ȴ�)
				dto.setId(rs.getInt("id"));//dto�� �����Ѵ�
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
	
	//�����ϱ�
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
	//step���߱�(���������̶� �ֽű��� ���� ���ڷ� ���ʿ� ��ġ, ���߿� �� ���� ���� ���ڷ� �Ʒ���ġ)
	//step���� ���� �׷쿡 ���� ��ġ���
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
	
	//��۾���
	public void reply(BoardDTO dto) {
		replyShape(dto);
		String sql=
				"insert into test_board(id, name, title, content, idgroup,step, indent)"
				+"values(test_board_seq.nextval,?,?,?,?,?,?)";
		try {           //db�� ����
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName()); //��������
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			
			ps.setInt(4, dto.getIdgroup());
			ps.setInt(5, dto.getStep()+1); //+1�� ���������̴�. step�� �亯�� ���� ��ġ�� �����ϱ� ���Ѱ�
			ps.setInt(6, dto.getIndent()+1);
			
			ps.executeUpdate();  //�̰� �־�� �����
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	//�ۿ� ���� �� ������ ������ �޼ҵ� 
	public int getTotalPage() {
		String sql = "select count(*) from test_board"; //> ���� ������ŭ ��ü count�� ������Ͷ�
		int totalPage = 0;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				totalPage= rs.getInt(1); //�� 1�̶�� ��� �����(��ü �� ����:  totalPage)�� ����� ������´�
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalPage;
	}
	
	//�������ִ� �޼ҵ�
	public PageCount pagingNum(int start) {
		PageCount pc = new PageCount();
		if(start==0) start=1;                       //ó�� start���� �Ѱ��ִ� �� ���� ������ 0���� �Ѵ�. start = 1 : ������ ���۹�ȣ
		                                            //��, ��ŸƮ ���� 0���� ���ٸ� ù ��° �������� �������
		
		int pageNum=3;                              //�� �������� 3���� �����ְڴ�
		int totalPage = getTotalPage();         //�ۿ� ���� �� ���� ������
		
		
		int totEndPage = totalPage/pageNum;
		if(totalPage % pageNum !=0) {         //�� ������ Ȧ����� 
			totEndPage = totEndPage +1;     //���¼��� +1�� �ؼ� ������ ���� ���缭 �ø���
		}
		
		int endPage = start * pageNum;              //�� ��ȣ �����, �� �ڵ� 2���� ���� �������� ?,?�� ���� ���� �ȴ�
		int startPage = endPage +1 - pageNum;  //���� �� �����
		
		pc.setTotEndPage(totEndPage);  //���� �����ϱ�
		pc.setStartPage(startPage);
		pc.setEndPage(endPage);
		return pc;
	}

}