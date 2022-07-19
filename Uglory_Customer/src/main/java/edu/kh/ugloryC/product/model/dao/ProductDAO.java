package edu.kh.ugloryC.product.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryC.product.model.vo.OptionType;
import edu.kh.ugloryC.product.model.vo.ProductDetail;
import edu.kh.ugloryC.product.model.vo.ProductOrder;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 상품 상세조회 DAO
	 * @param productCode
	 * @return detail
	 */
	public ProductDetail productDetail(int productCode) {
		
		return sqlSession.selectOne("productMapper.productDetail", productCode);
	}

//	/** 총 가격 조회 DAO
//	 * @param map
//	 * @return result
//	 */
//	public int totalAmount(Map<String, Object> map) {
//		return sqlSession.selectOne("productMapper.totalAmount", map);
//	}


	/** 주문 페이지 내 옵션에 따른 상품, 옵션 조회 DAO
	 * @param map
	 * @return selectOptionList
	 */
	public List<OptionType> orderOptionSelect(Map<String, Object> map) {

		return sqlSession.selectList("productMapper.orderOptionSelect", map);
	}
	
	/** 주문 정보 DAO
	 * @param productOrder
	 * @return result
	 */
	public int productOrder(Map<String, Object> productOrder) {

		return sqlSession.insert("productMapper.productOrder", productOrder);
	}

}
