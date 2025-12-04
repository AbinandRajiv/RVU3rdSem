import java.util.*;

class InvalidAgeException extends Exception {
    public InvalidAgeException(String msg) { super(msg); }
}

public class Lab6_Exceptions {
    static void verifyAge(int age) throws InvalidAgeException {
        if (age < 18) throw new InvalidAgeException("Age " + age + " is under 18");
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter dividend and divisor: ");
        try {
            int a = sc.nextInt();
            int b = sc.nextInt();
            try {
                int res = a / b; // may throw ArithmeticException
                System.out.println("Result = " + res);
            } catch (ArithmeticException ex) {
                System.out.println("Cannot divide by zero: " + ex.getMessage());
            }

            System.out.print("Enter age to verify: ");
            int age = sc.nextInt();
            verifyAge(age);
            System.out.println("Age ok for registration.");

        } catch (InputMismatchException ex) {
            System.out.println("Invalid input type.");
        } catch (InvalidAgeException ex) { // multiple catch
            System.out.println("Custom exception: " + ex.getMessage());
        } finally {
            System.out.println("Finally: closing resources.");
            sc.close();
        }
    }
}
