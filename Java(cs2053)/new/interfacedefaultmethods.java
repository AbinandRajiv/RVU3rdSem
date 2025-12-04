interface Printable {
    void print();
    default void header() { System.out.println("[Printable] default header"); }
}

interface Showable {
    void show();
    default void footer() { System.out.println("[Showable] default footer"); }
}

public class Report implements Printable, Showable {
    private String title;
    public Report(String title) { this.title = title; }
    @Override public void print() { System.out.println("Printing report: " + title); }
    @Override public void show() { System.out.println("Showing report on screen: " + title); }

    public static void main(String[] args) {
        Report r = new Report("Semester Marks");
        r.header();
        r.print();
        r.show();
        r.footer();
    }
}
