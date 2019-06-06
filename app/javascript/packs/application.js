import "bootstrap";


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
import { French } from "flatpickr/dist/l10n/fr.js"



console.log(flatpickr)
console.log('mkjbljbijnoinibniuhbiuh')

flatpickr.localize(French);


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
    ]



},);



flatpickr("#hour", {
    enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",
    defaultDate: "12:00",
    minuteIncrement: 30,
    time_24hr: true,
    onChange: function(dateObj) {
       console.log(dateObj);
       // console.log(dateStr);
   }
},)

let caldate = Array.from(document.querySelectorAll('span'));
console.log(caldate);

caldate.forEach(date => {
 date.addEventListener('click', (e) => {
   console.log(e.currentTarget);
 });
});


let test = document.querySelectorAll('td');
test.forEach(date => {
 date.addEventListener('click', (e) => {
   console.log(e.currentTarget);
 });
});

flatpickr("#autredate", {
    onChange: function(dateObj, dateStr) {
       console.log(dateStr);
       var url = window.location.href.split("?")[0];
       if (url.indexOf('?') > -1){
          url += `?date=${dateStr}`
       }else{
          url += `?date=${dateStr}`
       }
       window.location.href = url;
   },

  altInput: true,
    altFormat: "j F Y",
    dateFormat: "Y-m-d",
    minDate: "today",
    inline: true,


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





