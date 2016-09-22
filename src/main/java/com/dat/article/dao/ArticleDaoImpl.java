package com.dat.article.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dat.article.vo.ArticleVO;
import com.dat.article.vo.CategoryVO;
import com.dat.news.vo.JournalistVO;
import com.dat.news.vo.NewsVO;

public class ArticleDaoImpl implements ArticleDao{

	@Override
	public List<ArticleVO> getArticles(int categoryId) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ARTCL","ARTCL");
			
			StringBuffer query = new StringBuffer();
			query.append(" SELECT	A.ARTCL_ID ");
			query.append("			, A.SBJ ");
			query.append("			, A.CONT ");
			query.append("			, A.CRT_DT ");
			query.append("			, C.CTGR_ID ");
			query.append("			, C.CTGR_NM ");
			query.append(" FROM		ARTCL A ");
			query.append(" 			, CTGR C ");
			query.append(" WHERE	A.CTGR_ID = C.CTGR_ID ");
			query.append(" AND		C.CTGR_ID = ? ");
			query.append(" ORDER	BY     A.ARTCL_ID DESC ");
			
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, categoryId);
			
			rs = pstmt.executeQuery();
			
			List<ArticleVO> articles = new ArrayList<ArticleVO>();
			
			ArticleVO articleVO = null;
			CategoryVO categoryVO = null;
			
			while(rs.next()) {
				
				articleVO = new ArticleVO();
				articleVO.setArticle_Id(rs.getInt("ARTCL_ID"));
				articleVO.setSubject(rs.getString("SBJ"));
				articleVO.setContents(rs.getString("CONT"));
				articleVO.setCreated_Date(rs.getString("CRT_DT"));
				
				categoryVO = articleVO.getCategoryVO();
				
				categoryVO.setCategoryId(rs.getInt("CTGR_ID"));
				categoryVO.setCategoryName(rs.getString("CTGR_NM"));
				articles.add(articleVO);
			}
			return articles;
			
			
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
		finally{
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {}
			}
		}
	}

	@Override
	public List<CategoryVO> getCategoriesOf(int parentCategoryId) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ARTCL","ARTCL");
			StringBuffer query = new StringBuffer();
			query.append("SELECT	CTGR_ID ");
			query.append("			,CTGR_NM ");
			query.append("			,PRNT_CTGR_ID ");
			query.append("FROM		CTGR ");
			query.append("WHERE		PRNT_CTGR_ID = ? ");
			
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1,parentCategoryId);
			
			rs = pstmt.executeQuery();
			
			List<CategoryVO> categories = new ArrayList<CategoryVO>();
			
			CategoryVO categoryVO = null;
			
			while(rs.next()) {
				categoryVO = new CategoryVO();
				categoryVO.setCategoryId(rs.getInt("CTGR_ID"));
				categoryVO.setCategoryName(rs.getString("CTGR_NM"));
				categoryVO.setParentCategoryId(rs.getInt("PRNT_CTGR_ID"));
				
				categories.add(categoryVO);
			}
			return categories;

		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
		finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {}
			}
			if(pstmt != null){
				try {
					pstmt.close();
				} catch (SQLException e) {}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {}
			}
		}
	}

	@Override
	public boolean isCategoryLeafNode(int categoryId) {
		return getCategoriesOf(categoryId).size() == 0;
	}

	@Override
	public void addNewArticles(ArticleVO articleVO) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ARTCL","ARTCL");
			StringBuffer query = new StringBuffer();
			query.append("INSERT INTO ARTCL ( ");
			query.append("       	 ARTCL_ID ");
			query.append("       	 , SBJ");
			query.append("       	 , CONT");
			query.append("       	 , CRT_DT");
			query.append("       	 , CTGR_ID ) ");
			query.append("VALUES	( ARTCL_ID_SEQ.NEXTVAL, ?, ?, SYSDATE, ? ) ");
			
			pstmt = conn.prepareStatement(query.toString());
			
			pstmt.setString(1, articleVO.getSubject());
			pstmt.setString(2, articleVO.getContents());
			pstmt.setInt(3, articleVO.getCategoryId());
			
			pstmt.executeUpdate();	
			
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
		finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {}
			}
		}
		
	}

	@Override
	public List<CategoryVO> getCategories() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","NEWS","news");
			StringBuffer query = new StringBuffer();
			query.append("SELECT	CTGR_ID ");
			query.append("			,( ");
			query.append("				SELECT	CTGR_NM ");
			query.append("				FROM	CTGR ");
			query.append("				WHERE	C1.PRNT_CTGR_ID = CTGR_ID ");
			query.append("			 )  || '-' || CTGR_NM CTGR_NM ");
			query.append("FROM		CTGR C1 ");
			query.append("WHERE		NOT EXISTS ( ");
			query.append("							SELECT	'1' ");
			query.append("							FROM	CTGR C2");
			query.append("							WHERE	C1.CTGR_ID = C2.PRNT_CTGR_ID");
			query.append("						) ");
			
			pstmt = conn.prepareStatement(query.toString());
			
			rs = pstmt.executeQuery();
			
			List<CategoryVO> categories = new ArrayList<CategoryVO>();
			
			CategoryVO categoryVO = null;
			
			while(rs.next()) {
				categoryVO = new CategoryVO();
				categoryVO.setCategoryId(rs.getInt("CTGR_ID"));
				categoryVO.setCategoryName(rs.getString("CTGR_NM"));
				
				categories.add(categoryVO);
			}
			return categories;
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
		finally{
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {}
			}
		}
	}

	@Override
	public ArticleVO getArticleAt(int articleId) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e.getMessage(), e);
		}

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "ARTCL", "ARTCL");
			StringBuffer query = new StringBuffer();
			query.append(" SELECT	A.ARTCL_ID ");
			query.append("			, A.SBJ ");
			query.append("			, A.CONT ");
			query.append("			, A.CRT_DT ");
			query.append("			, C.CTGR_ID ");
			query.append("			, C.CTGR_NM ");
			query.append(" FROM		ARTCL A ");
			query.append(" 			, CTGR C ");
			query.append(" WHERE	A.CTGR_ID = C.CTGR_ID ");
			query.append(" AND		A.ARTCL_ID = ? ");
			query.append(" ORDER	BY     A.ARTCL_ID DESC ");

			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, articleId);
			rs = pstmt.executeQuery();

			ArticleVO articleVO = null;
			CategoryVO categoryVO = null;
			
			while(rs.next()) {
				
				articleVO = new ArticleVO();
				articleVO.setArticle_Id(rs.getInt("ARTCL_ID"));
				articleVO.setSubject(rs.getString("SBJ"));
				articleVO.setContents(rs.getString("CONT"));
				articleVO.setCreated_Date(rs.getString("CRT_DT"));
				
				categoryVO = articleVO.getCategoryVO();
				
				categoryVO.setCategoryId(rs.getInt("CTGR_ID"));
				categoryVO.setCategoryName(rs.getString("CTGR_NM"));
			}
			return articleVO;	
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(), e);
		}

		finally {
			// rs.pstmt,conn 을 순서대로 닫는다.
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}

		}
	}

	@Override
	public void deleteArticle(int articleId) {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e.getMessage(), e);
		}

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "ARTCL", "ARTCL");
			StringBuffer query = new StringBuffer();
			query.append(" DELETE	     ");
			query.append(" FROM		ARTCL ");
			query.append(" WHERE	ARTCL_ID = ? ");

			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, articleId);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(), e);
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
		
	}
	
}
