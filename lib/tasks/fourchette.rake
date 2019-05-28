require 'rest-client'
require 'json'

namespace :fourchette do
  task reservations: :environment do
    url = "https://www.myfourchette.com/reservation/webList.json"

    payload = "page=1&rp=10&sortname=reservation.idReservation&sortorder=asc&query=&qtype=&reservation_search%5Bdate%5D=&reservation_search%5BsearchString%5D=&reservation_search%5BisPending%5D=&reservation_search%5BisMsgRequestNbPeople%5D=&reservation_search%5BisPast%5D=&reservation_search%5BidLunchConfiguration%5D="

    headers = {
      "accept" => 'application/json, text/javascript, */*; q=0.01',
      "accept-language" => 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7',
      "content-length" => '302',
      "content-type" => 'application/x-www-form-urlencoded',
      "cookie" => '__utmc=134624877; __utmz=134624877.1558966658.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); _fbp=fb.1.1558966659446.1290425252; PHPSESSID=375b03a2d5fd3cd9f3fe66e38c06239f; REMEMBERME=TGFGb3VyY2hldHRlXENvbW1vblxNb2R1bGVcVXNlck1vZHVsZVxFbnRpdHlcVXNlcjpiR0ZqWTJWdWRHUjFOa0JuYldGcGJDNWpiMjA9OjE1OTA1MDI2ODU6MGZjNTAwOThmOGQwNjgzNjNlYjMzNGNjN2Q1ZDE1NmM4ZTg4NThlY2E0NGIzMDFlY2IzNTg0YWJiYjZkM2ZmNQ%3D%3D; __utma=134624877.1506694813.1558966658.1558966658.1558970860.2; __utmb=134624877.4.8.1558970860; intercom-session-t8kmccqi=SlFHckVocmplODVFZk9uWmRLcm95cU5JWGljejJRZGxiVHRkVDFzTEh3ejF4ZWNRS1EzdTVsUld2SDY3RE9hcy0tTzB5U2liT3RwRTM4WEhJR2xsTW96UT09--7ba682a96a24f6800434ec7b71318f00517e382e; datadome=6tT9bFNgD8YAgeAqdz7_kE7rM8MXgCu1YnwdcOnZOs',
      "origin" => 'https://www.myfourchette.com',
      "referer" => 'https://www.myfourchette.com/reservation/web',
      "user_agent" => 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Mobile Safari/537.36',
      "x-requested-with" => 'XMLHttpRequest',
      "x-newrelic-id" => "UA8DU1NTGwEDVllSDwI="
    }

    response = RestClient.post(url, payload, headers)
    result = JSON.parse(response.body)

    result["rows"].each do |resa|
      last_name = resa["cell"]["customer.lastName"]
      first_name = resa["cell"]["customer.firstName"]
      email = resa["cell"]["customer.email"]
      phone_number = resa["cell"]["customer.phone"]
      id_customer = resa["cell"]["customer.idCustomer"]
      reservation_hour = resa["cell"]["reservation.startTime"]
      reservation_date = resa["cell"]["reservation.date"]
      reservation_people = resa["cell"]["reservation.nbPeople"]
      reservation_comment = resa["cell"]["reservation.notes"]
      reservation_status = resa["cell"]["reservation.state"]
      reservation_validation_link = resa["cell"]["reservation.url_to_validate"]
      reservation_edit_link = resa["cell"]["reservation.edit"]

      restaurant = Restaurant.create!(name: "Rafiresto")
      client = Customer.create!(first_name: first_name, last_name: last_name, phone_number: phone_number, email: email)
      Booking.create!(date: reservation_date, number_of_customers: reservation_people, source: "la fourchette", customer: client, restaurant: restaurant)
    end
  end
end

