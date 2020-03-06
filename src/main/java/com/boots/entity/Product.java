package com.boots.entity;

import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

@Entity
@Table(name = "t_product")
public class Product {

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public  String[] getDateCreate() throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String[] mas = (sdf.format(dateCreate)).split(" ");
        return mas;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }

    public Date getDateStart() {
        return dateStart;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBirthdayPolicyholder() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(birthdayPolicyholder);
    }

    public void setBirthdayPolicyholder(Date birthdayPolicyholder) {
        this.birthdayPolicyholder = birthdayPolicyholder;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public String getSum() {
        return sum;
    }

    public void setSum(String sum) {
        this.sum = sum;
    }

    public String getSumRU() {
        return sumRU;
    }

    public void setSumRU(String sumRU) {
        this.sumRU = sumRU;
    }

    public int getDayTotal() {
        return dayTotal;
    }

    public void setDayTotal(int dayTotal) {
        this.dayTotal = dayTotal;
    }

    public String getInsuredName() {
        return insuredName;
    }

    public void setInsuredName(String insuredName) {
        this.insuredName = insuredName;
    }

    public String getInsuredLastName() {
        return insuredLastName;
    }

    public void setInsuredLastName(String insuredLastName) {
        this.insuredLastName = insuredLastName;
    }

    public String getPolicyholderInsuredName() {
        return policyholderInsuredName;
    }

    public void setPolicyholderInsuredName(String policyholderInsuredName) {
        this.policyholderInsuredName = policyholderInsuredName;
    }

    public String getPolicyholderInsuredLastName() {
        return policyholderInsuredLastName;
    }

    public void setPolicyholderInsuredLastName(String policyholderInsuredLastName) {
        this.policyholderInsuredLastName = policyholderInsuredLastName;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Date dateCreate;
    private Date dateStart;
    private Date dateEnd;
    private boolean status;
    private String paymentType;
    @Size(min=2, message = "Не меньше 5 знаков")
    private String insuredName;
    @Size(min=2, message = "Не меньше 5 знаков")
    private String insuredLastName;
    @Size(min=2, message = "Не меньше 5 знаков")
    private String policyholderInsuredName;
    @Size(min=2, message = "Не меньше 5 знаков")
    private String policyholderInsuredLastName;
    private String phone;
    private String email;
    private Date birthdayPolicyholder;
    private String currency;
    private String sum;
    private String sumRU;
    private int dayTotal;

    public Product() {

    }
}
