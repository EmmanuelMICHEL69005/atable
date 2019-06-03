//= require rails-ujs
//= require_tree .
 document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.datepicker');
    var instances = M.Datepicker.init(elems, options);
  });

// const validationReservation = document.querySelector('#BookingValidation');
// validationReservation.addEventListener('click', (event) => {
//  const table = ['12:00', '12:30', '13:00', '13:30', '14:00', '19:00', '19:30', '20:00', '20:30', '21:00']
//   event.preventDefault();
//   const clients = document.querySelector('#clients').inner_HTML;
//   const hour = table.findIndex (t => t === document.querySelector('#requestHour').inner_HTML);
//   console.log(hour);
//   if ((current_user.restaurant.capacity - @total_customer[0].sum - clients) < 0 ) {
//     window.alert("Non disponible");
//   } else {

//   };
// })
