public class car {
	String brand;
	int year;
	
	car(String b,int y)
	{
		brand=b;
		year=y;
	}
	
	void display()
	{
		System.out.println("Car : "+brand+" ("+year+") ");
	}
	
	public static void main(String [] args)
	{
		car c1=new car("Mclaren",2025);
		car c2=new car("Audi",2022);
		
		c1.display();
		c2.display();
	}

}
