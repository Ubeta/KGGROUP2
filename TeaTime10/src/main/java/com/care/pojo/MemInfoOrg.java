package com.care.pojo;

import org.springframework.stereotype.Component;

@Component
public class MemInfoOrg {

	public String genderOrg(int gen) {
		String gender = null;
		if (gen == 1) {
			gender = "남성";
		} else if (gen == 0) {
			gender = "여성";
		}
		return gender;
	}

	public String telOrg(String tel) {
		if (tel.length() == 11) {
			String telephone = null;
			telephone = tel.substring(0, 3) + "-" + tel.substring(3, 7) + "-" + 
					tel.substring(7, tel.length());
			return telephone;
		} else {
			return tel;
		}
	}

	public String birthDate(String dob) {
		String birthDate = null;
		birthDate = dob.substring(0, 2) + "년 " + dob.substring(2, 4) + "월 " + 
				dob.substring(4, dob.length()) + "일";
		return birthDate;
	}

}
