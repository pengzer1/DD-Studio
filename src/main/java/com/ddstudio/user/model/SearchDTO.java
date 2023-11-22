package com.ddstudio.user.model;

/**
 * 검색 조건을 담는 데이터 전송 객체(DTO)입니다.
 * 각 속성은 검색할 대상에 대한 조건을 나타냅니다. 값이 없거나 공백일 경우 " "로 초기화됩니다.
 * 
 * @author 이승원
 */
public class SearchDTO {
	
	private String attractionName; // 어트랙션 이름
    private String mbtiResult; // MBTI 결과
    private String mbtiMbti; // MBTI 유형
    private String courseName; // 코스 이름
    private String hashtagName; // 해시태그 이름
    private String restaurantName; // 음식점 이름
    private String restaurantMenu; // 음식점 대표 메뉴
    private String categoryName; // 카테고리 이름
    private String shopName; // 상점 이름
    private String shopInfo; // 상점 정보
    private String itemName; // 상품 이름
    private String itemInfo; // 상품 정보
    private String convenientName; // 편의시설 이름
    private String festivalName; // 페스티벌 이름
    private String festivalInfo; // 페스티벌정보
    private String theaterName; // 영화관 이름
    private String movieName; // 영화 이름
    private String noticeSubject; // 공지사항 제목
    private String noticeContent; // 공지사항 내용
    private String benefitName; // 혜택 이름
    private String benefitType; // 혜택 유형
    private String faqCategory; // FAQ 카테고리
    private String faqQuestion; // FAQ 질문
    private String faqAnswer; // FAQ 답변

	public String getAttractionName() {
		return (attractionName != null) ? attractionName : " ";
	}

	public void setAttractionName(String attractionName) {
		this.attractionName = (attractionName != null && !attractionName.trim().isEmpty()) ? attractionName : " ";
	}

	public String getMbtiResult() {
		return (mbtiResult != null) ? mbtiResult : " ";
	}

	public void setMbtiResult(String mbtiResult) {
		this.mbtiResult = (mbtiResult != null && !mbtiResult.trim().isEmpty()) ? mbtiResult : " ";
	}

	public String getMbtiMbti() {
		return (mbtiMbti != null) ? mbtiMbti : " ";
	}

	public void setMbtiMbti(String mbtiMbti) {
		this.mbtiMbti = (mbtiMbti != null && !mbtiMbti.trim().isEmpty()) ? mbtiMbti : " ";
	}

	public String getCourseName() {
		return (courseName != null) ? courseName : " ";
	}

	public void setCourseName(String courseName) {
		this.courseName = (courseName != null && !courseName.trim().isEmpty()) ? courseName : " ";
	}

	public String getHashtagName() {
		return (hashtagName != null) ? hashtagName : " ";
	}

	public void setHashtagName(String hashtagName) {
		this.hashtagName = (hashtagName != null && !hashtagName.trim().isEmpty()) ? hashtagName : " ";
	}

	public String getRestaurantName() {
		return (restaurantName != null) ? restaurantName : " ";
	}

	public void setRestaurantName(String restaurantName) {
		this.restaurantName = (restaurantName != null && !restaurantName.trim().isEmpty()) ? restaurantName : " ";
	}

	public String getRestaurantMenu() {
		return (restaurantMenu != null) ? restaurantMenu : " ";
	}

	public void setRestaurantMenu(String restaurantMenu) {
		this.restaurantMenu = (restaurantMenu != null && !restaurantMenu.trim().isEmpty()) ? restaurantMenu : " ";
	}

	public String getCategoryName() {
		return (categoryName != null) ? categoryName : " ";
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = (categoryName != null && !categoryName.trim().isEmpty()) ? categoryName : " ";
	}

	public String getShopName() {
		return (shopName != null) ? shopName : " ";
	}

	public void setShopName(String shopName) {
		this.shopName = (shopName != null && !shopName.trim().isEmpty()) ? shopName : " ";
	}

	public String getShopInfo() {
		return (shopInfo != null) ? shopInfo : " ";
	}

	public void setShopInfo(String shopInfo) {
		this.shopInfo = (shopInfo != null && !shopInfo.trim().isEmpty()) ? shopInfo : " ";
	}

	public String getItemName() {
		return (itemName != null) ? itemName : " ";
	}

	public void setItemName(String itemName) {
		this.itemName = (itemName != null && !itemName.trim().isEmpty()) ? itemName : " ";
	}

	public String getItemInfo() {
		return (itemInfo != null) ? itemInfo : " ";
	}

	public void setItemInfo(String itemInfo) {
		this.itemInfo = (itemInfo != null && !itemInfo.trim().isEmpty()) ? itemInfo : " ";
	}

	public String getConvenientName() {
		return (convenientName != null) ? convenientName : " ";
	}

	public void setConvenientName(String convenientName) {
		this.convenientName = (convenientName != null && !convenientName.trim().isEmpty()) ? convenientName : " ";
	}

	public String getFestivalName() {
		return (festivalName != null) ? festivalName : " ";
	}

	public void setFestivalName(String festivalName) {
		this.festivalName = (festivalName != null && !festivalName.trim().isEmpty()) ? festivalName : " ";
	}

	public String getFestivalInfo() {
		return (festivalInfo != null) ? festivalInfo : " ";
	}

	public void setFestivalInfo(String festivalInfo) {
		this.festivalInfo = (festivalInfo != null && !festivalInfo.trim().isEmpty()) ? festivalInfo : " ";
	}

	public String getTheaterName() {
		return (theaterName != null) ? theaterName : " ";
	}

	public void setTheaterName(String theaterName) {
		this.theaterName = (theaterName != null && !theaterName.trim().isEmpty()) ? theaterName : " ";
	}

	public String getMovieName() {
		return (movieName != null) ? movieName : " ";
	}

	public void setMovieName(String movieName) {
		this.movieName = (movieName != null && !movieName.trim().isEmpty()) ? movieName : " ";
	}

	public String getNoticeSubject() {
		return (noticeSubject != null) ? noticeSubject : " ";
	}

	public void setNoticeSubject(String noticeSubject) {
		this.noticeSubject = (noticeSubject != null && !noticeSubject.trim().isEmpty()) ? noticeSubject : " ";
	}

	public String getNoticeContent() {
		return (noticeContent != null) ? noticeContent : " ";
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = (noticeContent != null && !noticeContent.trim().isEmpty()) ? noticeContent : " ";
	}

	public String getBenefitName() {
		return (benefitName != null) ? benefitName : " ";
	}

	public void setBenefitName(String benefitName) {
		this.benefitName = (benefitName != null && !benefitName.trim().isEmpty()) ? benefitName : " ";
	}

	public String getBenefitType() {
		return (benefitType != null) ? benefitType : " ";
	}

	public void setBenefitType(String benefitType) {
		this.benefitType = (benefitType != null && !benefitType.trim().isEmpty()) ? benefitType : " ";
	}

	public String getFaqCategory() {
		return (faqCategory != null) ? faqCategory : " ";
	}

	public void setFaqCategory(String faqCategory) {
		this.faqCategory = (faqCategory != null && !faqCategory.trim().isEmpty()) ? faqCategory : " ";
	}

	public String getFaqQuestion() {
		return (faqQuestion != null) ? faqQuestion : " ";
	}

	public void setFaqQuestion(String faqQuestion) {
		this.faqQuestion = (faqQuestion != null && !faqQuestion.trim().isEmpty()) ? faqQuestion : " ";
	}

	public String getFaqAnswer() {
		return (faqAnswer != null) ? faqAnswer : " ";
	}

	public void setFaqAnswer(String faqAnswer) {
		this.faqAnswer = (faqAnswer != null && !faqAnswer.trim().isEmpty()) ? faqAnswer : " ";
	}

}