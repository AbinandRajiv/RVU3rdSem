class Calc {
	   int add(int a, int b) {
	       return a + b;
	   }
	    double add(double a, double b) {
	        return a + b;
	    }
	}
	public class q3 {
	    public static void main(String[] args) {
	        Calc calc = new Calc();

	        System.out.println("Sum of 2: " + calc.add(10, 20));
	        System.out.println("Sum of doubles: " + calc.add(5.5, 4.5));
	    }
	}
  
