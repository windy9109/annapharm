package kr.or.annapharm.dto;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

@SuppressWarnings("serial")
public class MedicienBillVO implements Serializable {

	private int manageBill;			// 약국관리료
	private int medicineBasicBill;	// 조제기본료
	private int takingMedicineBill;	// 복약지도료
	private int medicineBill;			// 처방조제료
	private int medicalManageBill;	// 의약품관리료
	private int medicalManageDrugBill;// 의약품관리료(마약류)

	public int getManageBill() {
		return manageBill;
	}
	public void setManageBill(int manageBill) {
		this.manageBill = manageBill;
	}
	public int getMedicineBasicBill() {
		return medicineBasicBill;
	}
	public void setMedicineBasicBill(int medicineBasicBill) {
		this.medicineBasicBill = medicineBasicBill;
	}
	public int getTakingMedicineBill() {
		return takingMedicineBill;
	}
	public void setTakingMedicineBill(int takingMedicineBill) {
		this.takingMedicineBill = takingMedicineBill;
	}
	public int getMedicineBill() {
		return medicineBill;
	}
	public void setMedicineBill(int medicineBill) {
		this.medicineBill = medicineBill;
	}
	public int getMedicalManageBill() {
		return medicalManageBill;
	}
	public void setMedicalManageBill(int medicalManageBill) {
		this.medicalManageBill = medicalManageBill;
	}
	public int getMedicalManageDrugBill() {
		return medicalManageDrugBill;
	}
	public void setMedicalManageDrugBill(int medicalManageDrugBill) {
		this.medicalManageDrugBill = medicalManageDrugBill;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
