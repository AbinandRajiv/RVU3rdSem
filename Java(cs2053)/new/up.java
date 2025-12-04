import java.net.*;

public class UDPServer {
    public static void main(String[] args) throws Exception {
        int port = 6000;
        DatagramSocket socket = new DatagramSocket(port);
        System.out.println("UDP Server on port " + port);
        byte[] buf = new byte[1024];
        while (true) {
            DatagramPacket packet = new DatagramPacket(buf, buf.length);
            socket.receive(packet);
            String received = new String(packet.getData(), 0, packet.getLength());
            System.out.println("Client: " + received);
            if ("bye".equalsIgnoreCase(received.trim())) break;
            DatagramPacket resp = new DatagramPacket(packet.getData(), packet.getLength(),
                    packet.getAddress(), packet.getPort());
            socket.send(resp);
        }
        socket.close();
    }
}
