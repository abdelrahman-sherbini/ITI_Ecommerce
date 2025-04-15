//package gov.iti.Controllers.admin;
//
//import gov.iti.Entities.Order;
//import gov.iti.Entities.OrderedProduct;
//import jakarta.servlet.AsyncContext;
//import jakarta.servlet.AsyncEvent;
//import jakarta.servlet.AsyncListener;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.concurrent.ConcurrentLinkedQueue;
//
//@WebServlet(name = "OrderSSE", value = "/admin/orderSSE",asyncSupported = true)
//public class OrderSSE extends HttpServlet {
//
//
//    public static final ConcurrentLinkedQueue<AsyncContext> queue = new ConcurrentLinkedQueue<>();
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//        // make sure to sent the event source content type and encoding
//        resp.setContentType("text/event-stream");
//        resp.setCharacterEncoding("UTF-8");
//
//        AsyncContext asyncContext = req.startAsync();
//        asyncContext.setTimeout(0);
//
//        queue.add(asyncContext);
//
//        asyncContext.addListener(new AsyncListener() {
//            @Override
//            public void onComplete(AsyncEvent event) {
////                queue.remove(asyncContext);
//            }
//
//            @Override
//            public void onTimeout(AsyncEvent event) {
//                queue.remove(asyncContext);
//            }
//
//            @Override
//            public void onError(AsyncEvent event) {
//                queue.remove(asyncContext);
//            }
//
//            @Override
//            public void onStartAsync(AsyncEvent event) {
//            }
//        });
//
//    }
//    public static void broadcast(Order order) {
//        String fullMessage = "";
//        for(OrderedProduct orderedProduct : order.getOrderedProducts()) {
//
//
//            String message = String.format("""
//    <form action="UpdateOrderServlet?oid=%d" method="post">
//        <tr>
//            <td class="text-center">
//                <img src="/customer/images/product/%s/%s"
//                     style="width: 50px; height: 50px; width: auto;">
//            </td>
//            <td>%d</td>
//            <td>%s<br>Quantity: %d<br>Total Price: $%.2f</td>
//            <td>%s %s<br>Mobile No. %s<br>%s %s</td>
//            <td>%s</td>
//            <td>COD</td>
//            <td>%s</td>
//            <td>
//                <select id="operation" name="status" class="form-select">
//                    <option>--Select Operation--</option>
//                    <option value="Order Confirmed">Order Confirmed</option>
//                    <option value="Shipped">Shipped</option>
//                    <option value="Out For Delivery">Out For Delivery</option>
//                    <option value="Delivered">Delivered</option>
//                    <option value="Canceled">Canceled</option>
//                </select>
//            </td>
//            <td>
//                <button type="submit" class="btn %s"%s>Update</button>
//            </td>
//        </tr>
//    </form>
//    """,
//                    order.getId(),
//                    orderedProduct.getProduct().getCategory().getName(),
//                    orderedProduct.getProduct().getImage(),
//                    order.getId(),
//                    orderedProduct.getProduct().getName(),
//                    orderedProduct.getQuantity(),
//                    orderedProduct.getPrice(),
//                    order.getUser().getFirstName(),
//                    order.getUser().getLastName(),
//                    order.getUser().getPhone(),
//                    order.getAddress(),
//                    order.getCity(),
//                    order.getDate().toString(),
//                    order.getStatus(),
//                    order.getStatus().equals("Delivered") ? "btn-success disabled" : "btn-secondary",
//                    order.getStatus().equals("Delivered") ? " disabled" : ""
//            );
//
//            fullMessage  = fullMessage.concat(message).concat("<br>");
//        }
//        for ( AsyncContext client  : queue) {
//
//
//            try {
//                PrintWriter writer = client.getResponse().getWriter();
//                writer.write("event: message\n");
//                writer.write("data: " + fullMessage + "\n\n");
//                writer.flush();
//            } catch (IOException e) {
//                queue.remove(client);
//            }
//        }
//    }
//
//
//    public void destroy() {
//    }
//}