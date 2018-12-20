package by.bsuir.piris.model;

import lombok.Data;

@Data
public class BankAccount {
    private long number;
    private double saldo;
    private boolean isDollar;
    private boolean isActive;
    private Client client;

    public void addMoney(double money)
    {
        saldo = saldo + money;
    }

    public void withdrawMoney(double money)
    {
        saldo = saldo - money;
    }
}
