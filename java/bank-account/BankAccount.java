class BankAccount {
    private boolean active;
    private int balance;

    void open() throws BankAccountActionInvalidException {
        if (active){
            throw new BankAccountActionInvalidException("Account already open");
        };
        active = true;
    }

    void close() throws BankAccountActionInvalidException {
        if (!active){
            throw new BankAccountActionInvalidException("Account not open");
        };
        balance = 0;
        active = false;
    }
    void checkErrors(int amount) throws BankAccountActionInvalidException {
        if (!active){
            throw new BankAccountActionInvalidException("Account closed");
        };
        if(amount<0){
            throw new BankAccountActionInvalidException("Cannot deposit or withdraw negative amount");
        };
    }
    synchronized int getBalance() throws BankAccountActionInvalidException {
        if (!active){
            throw new BankAccountActionInvalidException("Account closed");
        };
        return balance;
    }

    synchronized void deposit(int amount) throws BankAccountActionInvalidException {
        checkErrors(amount);
        balance += amount;
    }

    synchronized void withdraw(int amount) throws BankAccountActionInvalidException {
        checkErrors(amount);
        if (balance<amount){
            throw new BankAccountActionInvalidException("Cannot withdraw more money than is currently in the account");
        };
        balance -= amount;
    }

}