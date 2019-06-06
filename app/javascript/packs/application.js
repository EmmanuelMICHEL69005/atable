import "bootstrap";
import initNotification from './notification.js'

initNotification()

 document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.datepicker');
    var instances = M.Datepicker.init(elems, options);
  });

console.log('test JS');
document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.collapsible');
    var instances = M.Collapsible.init(elems, options);
  });

import flatpickr from "flatpickr"
import 'flatpickr/dist/flatpickr.min.css'
console.log(flatpickr)
console.log('mkjbljbijnoinibniuhbiuh')

flatpickr("#date", {
  altInput: true,
    altFormat: "j F Y",
    dateFormat: "Y-m-d",
    minDate: "today",

"disable": [
        function(date) {
            // return true to disable
            return (date.getDay() === 0);

        }
    ],
    "locale": {
        "firstDayOfWeek": 1 // start week on Monday
    },



},);



flatpickr("#hour", {
    enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",
    defaultDate: "12:00",
    minuteIncrement: 30,
    time_24hr: true,



},);

flatpickr(".date", {
  altInput: true,
    altFormat: "j F Y",
    dateFormat: "Y-m-d",
    minDate: "today",

"disable": [
        function(date) {
            // return true to disable
            return (date.getDay() === 0);

        }
    ],
    "locale": {
        "firstDayOfWeek": 1 // start week on Monday
    },



},);


flatpickr(".hour", {
  enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",
    defaultDate: "12:00",
    minuteIncrement: 30,
    time_24hr: true,
});

$(document).ready(function() {

  $(".datepicker").datepicker({
    prevText: '<i class="fa fa-fw fa-angle-left"></i>',
    nextText: '<i class="fa fa-fw fa-angle-right"></i>'
  });
});



