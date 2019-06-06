const initNotification = () => {
  console.log("je suis la")

   fetch('/bookings/notifications')
    .then((resp) => resp.json()) // Transform the data into json
    .then(function(data) {
      console.log(data.total)
      // Create and append the li's to the ul


      const element = document.querySelector('.navbar-nav')
      const element2 = document.querySelector('.notification-dropdown')

      element.insertAdjacentHTML("beforeend", `<li class ="nb-notification">${data.total}</li>`);
      element2.insertAdjacentHTML("beforeend", `<p class ="nb-notification-menu">${data.total}</p>`);
    })
}

export default initNotification
