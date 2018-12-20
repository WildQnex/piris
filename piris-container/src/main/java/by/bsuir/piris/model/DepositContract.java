package by.bsuir.piris.model;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Data
public class DepositContract {
    private boolean revocable;
    private long number;
    private boolean dollar;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate startDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate endDate;
    private long daysAmount;
    private double money;
    private int percent;
    private long id;
    private Client user;
    private BankAccount account;
    private BankAccount percentAccount;
}
