include Facebook::Messenger

def proposition_date(postback, hour)
  variable_envoyee = []
  if hour > 21
    variable_envoyee << { type: 'postback', title: 'Demain', payload: 'TOMORROW' }
  elsif hour > 14
    variable_envoyee << { type: 'postback', title: 'Ce soir', payload: 'TONIGHT' }
  else
    variable_envoyee << { type: 'postback', title: 'Ce midi', payload: 'NOON' }
    variable_envoyee << { type: 'postback', title: 'Ce soir', payload: 'TONIGHT' }
  end
  variable_envoyee << { type: 'postback', title: 'Cette semaine', payload: 'WEEK' }
  variable_envoyee << { type: 'postback', title: 'Autre possibilité', payload: 'OTHER' }
  msg = 'Quand souhaitez-vous venir ?'

  message(postback, variable_envoyee, msg)
  postback = ''
end

def affichage_heure(postback, heure)
  variable_envoyee = []
  i = 0
  heure.each do |h|
    p h
    i += 1
    variable_envoyee << { type: 'postback', title: h, payload: "H#{i}" }
  end
  msg = 'A quelle heure souhaitez-vous nous rejoindre? '
  message(postback, variable_envoyee, msg)
end

def message(postback, variable_recue, msg)
  p variable_recue
  postback.reply(
  attachment: {
    type: 'template',
    payload: {
      template_type: 'button',
      text: msg,
      buttons: variable_recue
    }
   }
  )
end

Bot.on :message do |message|
  @client = message.sender['id'].to_s
  # p @client
  # p Customer.where(facebook_id: @client.to_s).first
  if Customer.where(facebook_id: @client).first != nil
    @first_name = Customer.where(facebook_id: @client).first.first_name
    @last_name = Customer.where(facebook_id: @client).first.last_name
    @phone_number = Customer.where(facebook_id: @client).first.phone_number
    @email = Customer.where(facebook_id: @client).first.email
    @client_exist = true
  else
    @client_exist = false
  end

if @client_exist == true
  message.reply(text: "Trés content de vous revoir #{@first_name} #{@last_name} !")
else
  message.reply(text: "Bienvenue à vous !")
end

  message.reply(
  attachment: {
    type: 'template',
    payload: {
      template_type: 'button',
      text: 'Souhaitez-vous réserver une table ?',
      buttons: [
        { type: 'postback', title: 'Oui', payload: 'YES' },
        { type: 'postback', title: 'Non', payload: 'NO' },
      ]
    }
  }
)
end

Bot.on :postback do |postback|
  test = postback.sent_at.hour
  if postback.payload == 'YES'
    proposition_date(postback, test.to_i)
  elsif postback.payload == 'NOON'
      heure =['12H00', '13h00', '14h00']
      affichage_heure(postback, heure)
  elsif postback.payload == 'TONIGHT'
      heure =['19h00', '20H00', '21h00']
      affichage_heure(postback, heure)
  end
end

