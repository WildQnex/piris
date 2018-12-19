package by.bsuir.piris.util;

public class Helper {

    public static double CURRENCY_RATE = 2.15;

    public static long FOND = 7327100000001L;
    public static long KASSA = 1010100000001L;

    public static long currentCreditAccountNumber = 3014100000000L;
    public static long currentDepositAccountNumber = 2400100000000L;

    public static long getNextCreditAccountNumber()
    {
        return ++currentCreditAccountNumber;
    }

    public static long getNextDepositAccountNumber()
    {
        return ++currentDepositAccountNumber;
    }
}
