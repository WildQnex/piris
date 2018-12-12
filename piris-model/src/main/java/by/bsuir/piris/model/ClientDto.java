package by.bsuir.piris.model;

import java.math.BigDecimal;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ClientDto {

    private long id;

    private String surname;

    private String name;

    private String middleName;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate birthday;

    private String passportSeries;

    private String passportNumber;

    private String issuedBy;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate issueDate;

    private String identNumber;

    private String birthdayPlace;

    private String address;

    private String homeTelephone;

    private String mobilePhone;

    private String email;

    private String workplace;

    private String position;

    private boolean pensioner;

    private BigDecimal salary;

    private boolean militarity;

    private long disability;

    private long meritalStatus;

    private long citizenship;

    private long city;
}
