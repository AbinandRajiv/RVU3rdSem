
public class student {
	String name;
	int age;
	
	void displayInfo()
	{
		System.out.println("Name : "+name+", Age : "+age);
	}
	
	public static void main(String [] args)
	{
		student s1=new student();
		s1.name="Ben";
		s1.age=22;
		s1.displayInfo();
	}
}
