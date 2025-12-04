import java.util.function.*;

@FunctionalInterface
interface Calculator {
    int op(int a, int b);
}

public class Lab11_Lambdas {
    public static void main(String[] args) {
        // Lambda expressions
        Calculator add = (a, b) -> a + b;
        Calculator mul = (a, b) -> a * b;

        // Block lambda with logic
        Calculator max = (a, b) -> {
            if (a > b) return a;
            else return b;
        };

        System.out.println("Add: " + add.op(10, 20));
        System.out.println("Mul: " + mul.op(10, 20));
        System.out.println("Max: " + max.op(10, 20));

        // Using Java built-in functional interfaces
        Predicate<Integer> isEven = n -> n % 2 == 0;
        System.out.println("Is 42 even? " + isEven.test(42));
    }
}
