class Person {
    protected String name;
    protected int age;
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
        System.out.println("Person constructor called");
    }
    public String info() { return name + " (" + age + ")"; }
}

class Employee extends Person {
    protected String empId;
    public Employee(String name, int age, String empId) {
        super(name, age); // constructor chaining using super
        this.empId = empId;
        System.out.println("Employee constructor called");
    }
    @Override
    public String info() { // method overriding
        return "Employee " + empId + " - " + super.info();
    }
}

public class Manager extends Employee {
    private String department;
    public Manager(String name, int age, String empId, String department) {
        super(name, age, empId);
        this.department = department;
        System.out.println("Manager constructor called");
    }
    @Override
    public String info() {
        return "Manager of " + department + " | " + super.info();
    }
    public static void main(String[] args) {
        Manager m = new Manager("Neeraj", 35, "E101", "IT");
        System.out.println(m.info());
    }
}
