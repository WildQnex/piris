package by.bsuir.piris.model;

import lombok.Data;

@Data
public class BankAccount {
    private long number;
    private long saldo;
    private boolean isDollar;
    private boolean isActive;
    private Client client;
}
