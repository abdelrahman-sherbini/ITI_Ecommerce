// /**
//  *
//  */
//
// var source = new EventSource('orderSSE');
//
// source.addEventListener("message", function (event) {
//
//     if( $('.container.mt-5.mb-5.text-center').length )
//     {
//         // it exists
//         $('.container.mt-5.mb-5.text-center').remove();
//         $('.container-fluid.px-3.py-3').append(`
//         <div class="container-fluid">
//             <table class="table table-hover">
//                 <tr class="table-primary" style="font-size: 18px;">
//                     <th class="text-center">Product</th>
//                     <th>Order ID</th>
//                     <th>Product Details</th>
//                     <th>Delivery Address</th>
//                     <th>Date & Time</th>
//                     <th>Payment Type</th>
//                     <th>Status</th>
//                     <th colspan="2" class="text-center">Action</th>
//                 </tr>
//             </table>
//         </div>
//     `);
//     }
//
//
//
//     $(".table.table-hover").append(event.data.data);
//
// });
// source.onerror = function(event) {
//     console.log('Failed to Start EventSource: ', event);
// };