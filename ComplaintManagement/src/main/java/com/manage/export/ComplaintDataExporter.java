package com.manage.export;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.manage.entity.Complaint;
import com.manage.entity.Customer;
import com.manage.entity.Support;

public class ComplaintDataExporter {

	Support support = new Support();
	Customer customer = new Customer();

	private XSSFWorkbook workbook;
	private XSSFSheet sheet;

	private List<Complaint> complaints;

	public ComplaintDataExporter(List<Complaint> complaints) {

		this.complaints = complaints;

		workbook = new XSSFWorkbook();
		sheet = workbook.createSheet("customerData");

	}

	private void writeHeaderRow() {
		Row row = sheet.createRow(0);

		Cell cell = row.createCell(0);
		cell.setCellValue("Complaint-Id");

		cell = row.createCell(1);
		cell.setCellValue("Catagary");

		cell = row.createCell(2);
		cell.setCellValue("Product");

		cell = row.createCell(3);
		cell.setCellValue("Product-Catagary");

		cell = row.createCell(4);
		cell.setCellValue("Description");

		cell = row.createCell(5);
		cell.setCellValue("Complaint-Date");

		cell = row.createCell(6);
		cell.setCellValue("Comment");

		cell = row.createCell(7);
		cell.setCellValue("Status");

		cell = row.createCell(8);
		cell.setCellValue("CustomerName");

	}

	private void writeDataRows() {
		int rowCount = 1;

		for (Complaint complaint : complaints) {
			Row row = sheet.createRow(rowCount++);

			Cell cell = row.createCell(0);
			cell.setCellValue(complaint.getComplaintId());

			cell = row.createCell(1);
			cell.setCellValue(complaint.getCatagary());

			cell = row.createCell(2);
			cell.setCellValue(complaint.getProduct());

			cell = row.createCell(3);
			cell.setCellValue(complaint.getProductCatagary());

			cell = row.createCell(4);
			cell.setCellValue(complaint.getComplaintDescription());

			cell = row.createCell(5);
			cell.setCellValue(complaint.getComplaintDate().toString());

			cell = row.createCell(6);
			cell.setCellValue(complaint.getSupport().getComments());

			cell = row.createCell(7);
			cell.setCellValue(complaint.getSupport().getStatus().toString());

			cell = row.createCell(8);
			cell.setCellValue(complaint.getCustomer().getUsername());

		}

	}

	public void export(HttpServletResponse response) throws IOException {
		writeHeaderRow();
		writeDataRows();

		ServletOutputStream outputStream = response.getOutputStream();
		workbook.write(outputStream);
		workbook.close();
		outputStream.close();
	}
}
