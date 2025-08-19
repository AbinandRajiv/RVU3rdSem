public class Calculator {
       int add(int a, int b) {
    	   return a+b;
       }
       
       int subtract(int a, int b) {
    	   return a-b;
       }
       
       public static void main(String[]args) {
    	   Calculator calc = new Calculator();
    	   System.out.println("Addition: " + calc.add(23,4));
    	   System.out.println("Subtraction: " + calc.subtract(45,8));
       }
}
