public class SumOfDigits {

    public static void main(String[] args) {
        int number = 82895; 
        int sum = 0;       
        while (number != 0) {
            int lastDigit = number % 10;
            sum += lastDigit;           
            number /= 10;           
        }

        System.out.println("The sum of digits is: " + sum);
    }
}
