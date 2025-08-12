 public class Palindrome {

 public static void main(String[] args) {
     int originalNumber = 98089;
     int reversedNumber = 0;
     int temp = originalNumber;
     while (originalNumber != 0) {
     int digit = originalNumber % 10;
     reversedNumber = reversedNumber * 10 + digit;
     originalNumber /= 10;
        }
      if (reversedNumber==temp)  {  
      System.out.println("It is a palindrome" );
      }
      else
      {  
          System.out.println("It is not a palindrome");
      }
      
    }
    
    
}
