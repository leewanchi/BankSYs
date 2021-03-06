package com.teamone.utils;

import java.io.File;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.springframework.beans.factory.annotation.Autowired;

import com.teamone.entity.Bill;
import com.teamone.service.impl.BillSearchServiceImpl;

public class Db2Excel {
	@Autowired
	public static BillSearchServiceImpl billSearchService;
	public static void dBToExcel(String[] fieldList, String[] titles, List<Bill> allbills,
			OutputStream os) throws Exception {
		
		WritableWorkbook wwb = null;
		WritableSheet ws = null;

		

		String flist = "";
		int fl = fieldList.length;
		
		wwb = Workbook.createWorkbook(os);
		ws = wwb.createSheet("sheet1", 0);
		
		System.out.println(fl);
		for (int i = 0; i < fl; i++) {
			ws.addCell(new Label(i, 0, titles[i]));
		}
		int count = 1;

		
		for (Bill bill : allbills) {
			ws.addCell(new Label(0, count, bill.getBillId() + ""));
			ws.addCell(new Label(1, count, bill.getAccount()));
			try {
				ws.addCell(new Label(2, count, bill.getTransferId().toString()));
			} catch (NullPointerException e) {
				// TODO Auto-generated catch block
				
			}
			ws.addCell(new Label(3, count, bill.getTradeDate().toString()));
			ws.addCell(new Label(4, count, bill.getTradeType().toString()));
			ws.addCell(new Label(5, count, bill.getTradeMoney().toString()));
			ws.addCell(new Label(6, count, bill.getBalance().toString()));
			ws.addCell(new Label(7, count, bill.getCurrency()));
			ws.addCell(new Label(8, count, bill.getTellerId().toString()));
			count++;
		}
		wwb.write();

		if (wwb != null)
			wwb.close();
	}
}
