class Box<T> {
    private T value;
    public Box(T value) { this.value = value; }
    public T get() { return value; }
    public void set(T value) { this.value = value; }
    @Override public String toString() { return "Box{" + value + "}"; }

    public static void main(String[] args) {
        // Autoboxing: int -> Integer
        Box<Integer> bi = new Box<>(10); // 10 autoboxed
        bi.set(20); // autoboxing again
        int val = bi.get(); // unboxing
        System.out.println(bi + " unboxed=" + val);

        Box<String> bs = new Box<>("hello");
        System.out.println(bs);
    }
}
