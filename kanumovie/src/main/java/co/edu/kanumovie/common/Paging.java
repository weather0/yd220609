package co.edu.kanumovie.common;

public class Paging {

	private int page = 1; // 현재 페이지 (get)
	private int totalCount; // row 전체의 수 (get)
	private int beginPage; // 출력 시작
	private int endPage; // 출력 끝

	private int displayRow = 10; // 한 페이지에 몇 개의 로우 (선택 set)
	private int displayPage = 10; // 한 페이지에 몇 개의 페이지 (선택 set)
	boolean prev; // prev버튼이 보일지 말지
	boolean next; // next버튼이 보일지 말지

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		// setTotalCount()를 꼭 호출해야 paging이 되기 때문에
		// paging() 함수를 setTotalCount()를 호출 했을 떄 자동으로
		// 호출 되기 한다.
		this.totalCount = totalCount;
		paging();
	}

	public int getDisplayRow() {
		return displayRow;
	}

	public void setDisplayRow(int displayRow) {
		this.displayRow = displayRow;
	}

	public int getDisplaypage() {
		return displayPage;
	}

	public void setDisplayPage(int displayPage) {
		this.displayPage = displayPage;
	}
	
	public int getBeginPage() {
		return beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}
	

	private void paging() {
		// prev, next, beginPage, endPage 계산

		// 2+9 = 11, 11/10 = 1, 1*10 = 10

		// 11+9 = 20, 20/10 = 2, 2*10 = 20

		endPage = ((int) Math.ceil(page / (double) displayPage)) * displayPage;
		System.out.println("endPage : " + endPage);

		beginPage = endPage - (displayPage - 1);
		System.out.println("beginPage : " + beginPage);

		// 글 32개
		// 32/10 = 3.2 (올림) 4페이지
		// 2=? 2/10
		int totalPage = (int) Math.ceil(totalCount / (double) displayRow);

		if (totalPage < endPage) {
			endPage = totalPage;
			next = false;
		} else {
			next = true;
		}

		prev = (beginPage == 1) ? false : true;// page가 11이상에만 나온다
		System.out.println("endPage : " + endPage);
		System.out.println("totalPage : " + totalPage);

	}

}
