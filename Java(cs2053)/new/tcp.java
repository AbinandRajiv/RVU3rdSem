import java.io.*;
import java.net.*;

public class TCPServer {
    public static void main(String[] args) throws IOException {
        int port = 5000;
        try (ServerSocket server = new ServerSocket(port)) {
            System.out.println("TCP Server started on port " + port);
            try (Socket socket = server.accept();
                 BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                 PrintWriter out = new PrintWriter(socket.getOutputStream(), true)) {
                out.println("Welcome! Type 'bye' to exit.");
                String line;
                while ((line = in.readLine()) != null) {
                    System.out.println("Client: " + line);
                    out.println("Echo: " + line);
                    if ("bye".equalsIgnoreCase(line)) break;
                }
            }
        }
    }
}
