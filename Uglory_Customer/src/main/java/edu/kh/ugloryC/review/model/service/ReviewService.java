package edu.kh.ugloryC.review.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.ugloryC.review.model.vo.ReviewWrite;

public interface ReviewService {

	
	
	/**
	 * 리뷰 + 이미지 삽입 서비스
	 * @param reviewWrite
	 * @param imageList
	 * @param webPath
	 * @param folderPath
	 * @return result
	 */
	int insertReview(ReviewWrite reviewWrite, List<MultipartFile> imageList, String webPath, String folderPath);

	
	

}
