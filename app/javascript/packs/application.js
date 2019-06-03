import "bootstrap";
 document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.datepicker');
    var instances = M.Datepicker.init(elems, options);
  });


import flatpickr from "flatpickr"
import 'flatpickr/dist/flatpickr.min.css'
console.log(flatpickr)
console.log('mkjbljbijnoinibniuhbiuh')

flatpickr("#dateReservation", {
  altInput: true,
    altFormat: "j F Y",
    dateFormat: "Y-m-d",
    minDate: "today",

"disable": [
        function(date) {
            // return true to disable
            return (date.getDay() === 1);

        }
    ],
    "locale": {
        "firstDayOfWeek": 1 // start week on Monday
    },



},);



flatpickr("#heureReservation", {
    enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",
    defaultDate: "12:00",
    minuteIncrement: 30,
    time_24hr: true,



},);
