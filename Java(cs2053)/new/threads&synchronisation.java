class BankAccount {
    private int balance;
    public BankAccount(int initial) { this.balance = initial; }

    public synchronized void deposit(int amt) {
        balance += amt;
        System.out.println(Thread.currentThread().getName() + " deposit " + amt + " | balance=" + balance);
        notifyAll();
    }

    public synchronized void withdraw(int amt) {
        while (balance < amt) {
            try {
                System.out.println(Thread.currentThread().getName() + " waiting to withdraw " + amt + " | balance=" + balance);
                wait();
            } catch (InterruptedException e) { Thread.currentThread().interrupt(); }
        }
        balance -= amt;
        System.out.println(Thread.currentThread().getName() + " withdraw " + amt + " | balance=" + balance);
    }
}

public class Lab7_ThreadsSync {
    public static void main(String[] args) {
        BankAccount acc = new BankAccount(100);

        Thread t1 = new Thread(() -> {
            for (int i = 0; i < 3; i++) acc.withdraw(100);
        }, "Withdrawer");

        class Depositor extends Thread {
            public void run() {
                for (int i = 0; i < 3; i++) {
                    acc.deposit(100);
                    try { Thread.sleep(200); } catch (InterruptedException ignored) {}
                }
            }
        }
        Thread t2 = new Depositor();

        t1.start();
        t2.start();
        try { t1.join(); t2.join(); } catch (InterruptedException ignored) {}
        System.out.println("Done.");
    }
}
