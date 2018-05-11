package kh.com.a.service;

import java.util.List;

import kh.com.a.model.BasketDto;
import kh.com.a.model2.BasketParam;

public interface BasketServ {

	public boolean addMuBasket(BasketDto bsk) throws Exception;
	public List<BasketParam> getBasketListByMid(String mid) throws Exception;
	public boolean delBskByBkseq(int[] bkseq) throws Exception;
//	0419
	public List<BasketParam> getBskListByBkseq(int[] bkseq) throws Exception;
	public List<Integer> getRvseqByBkseq(int[] bkseq) throws Exception;
	public boolean addCdBasket(BasketDto bsk) throws Exception;
	public int getNextBkseq() throws Exception;
	
}
