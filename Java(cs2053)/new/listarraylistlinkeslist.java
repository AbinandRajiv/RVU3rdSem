import java.util.*;

class StudentRec {
    int id;
    String name;
    StudentRec(int id, String name) { this.id = id; this.name = name; }
    @Override public String toString() { return id + ":" + name; }
}

public class Lab9_ListStudentManager {
    private final List<StudentRec> arrayList = new ArrayList<>();
    private final List<StudentRec> linkedList = new LinkedList<>();

    public void add(StudentRec s) {
        arrayList.add(s);
        linkedList.add(s);
    }

    public boolean deleteById(int id) {
        return arrayList.removeIf(s -> s.id == id) | linkedList.removeIf(s -> s.id == id);
    }

    public Optional<StudentRec> search(int id) {
        return arrayList.stream().filter(s -> s.id == id).findFirst();
    }

    public void display() {
        System.out.println("ArrayList: " + arrayList);
        System.out.println("LinkedList: " + linkedList);
    }

    public static void main(String[] args) {
        Lab9_ListStudentManager m = new Lab9_ListStudentManager();
        m.add(new StudentRec(1, "Asha"));
        m.add(new StudentRec(2, "Ravi"));
        m.display();
        System.out.println("Search id=2 -> " + m.search(2).orElse(null));
        m.deleteById(1);
        m.display();
    }
}
