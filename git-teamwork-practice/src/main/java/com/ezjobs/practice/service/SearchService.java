package com.ezjobs.practice.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ezjobs.practice.entity.Search;


@Service
public class SearchService {
	List<Search> searchDummy=new ArrayList<>();
	int searchIdx=1;
	int tptotal = 27;

	public void search(Map<Object,Object> map) {
		if(searchDummy.size()==0) { // 임시 데이터
			for(int i=0;i<tptotal;i++) {
				
				if(i<5) {
					Search search=new Search(i, "샘숭"+i, "커피맨", "체중 90kg");
					searchDummy.add(search);	
				}
				else {
					Search search=new Search(i, "다음"+i, "커피맨", "체중 90kg");
					searchDummy.add(search);	
				}
			}
			/* 
			 * Search search=new Search(0, "샘숭", "커피맨", "체중 90kg"); searchDummy.add(search);
			 * Search search2=new Search(1, "원양", "새우잡이", "토익 990");
			 * searchDummy.add(search2); Search search3=new Search(2, "Griffin", "감독",
			 * "리그 우승"); searchDummy.add(search3); Search search4=new Search(3, "족소", "노예",
			 * "인내심"); searchDummy.add(search4); Search search5=new Search(4, "샘숭", "커피맨",
			 * "체중 90kg"); searchDummy.add(search5); Search search6=new Search(5, "원양",
			 * "새우잡이", "토익 990"); searchDummy.add(search6); Search search7=new Search(6,
			 * "Griffin", "감독", "리그 우승"); searchDummy.add(search7); Search search8=new
			 * Search(7, "족소", "노예", "인내심"); searchDummy.add(search8);
			 */
		}
		map.put("searchLists",searchDummy); // 이것과 searchList.jsp에 있는 데이터 목록과 맵핑됨
		map.put("total", tptotal);
	}	
		
	//이하는 페이징	
    private final static int pageCount = 5;
    private int blockStartNum = 0;
    private int blockLastNum = 0;
    private int lastPage = 0;

    public int getBlockStartNum() {
        return blockStartNum;
    }
    public void setBlockStartNum(int blockStartNum) {
        this.blockStartNum = blockStartNum;
    }
    public int getBlockLastNum() {
        return blockLastNum;
    }
    public void setBlockLastNum(int blockLastNum) {
        this.blockLastNum = blockLastNum;
    }
    public int getLastPage() {
        return lastPage;
    }
    public void setLastPage(int lastPage) {
        this.lastPage = lastPage;
    }

    // block을 생성
    // 현재 페이지가 속한 block의 시작 번호, 끝 번호를 계산
    public void makeBlock(Map<Object,Object> map, int npg){
        
    	int blockNum = 0;
        blockNum = (int)Math.floor((npg-1)/ pageCount);
        blockStartNum = (pageCount * blockNum) + 1;
        blockLastNum = blockStartNum + (pageCount-1);
        map.put("startBlock", blockStartNum);
        map.put("lastBlock", blockLastNum);
        map.put("nowPage", npg);
    }

    // 총 페이지의 마지막 번호
    public void makeLastPage(Map<Object,Object> map) {
        int total = tptotal;

        if( total % pageCount == 0 ) {
            lastPage = (int)Math.ceil(total/pageCount);
        }
        else {
            lastPage = (int)Math.ceil(total/pageCount) + 1;
        }
        map.put("lastPage", lastPage);
    }
}