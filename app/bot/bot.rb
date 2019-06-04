require 'facebook/messenger'
include Facebook::Messenger

bb = nil

clients = {}

# {
#   "ertyu456" =>       BotBooking.new,
#   "ertyu456qsqsdf" => BotBooking.new,
# }

def response_multiple(bot_msg, question, choices)
  buttons = choices.map {|c| { type: 'postback', title: c, payload: c } }
  bot_msg.reply(
    attachment: {
      type: 'template',
      payload: {
        template_type: 'button',
        text: question,
        buttons: buttons
      }
    }
  )
end

def response_simple(bot_msg, question)
  bot_msg.reply(text: question)
end

Bot.on :message do |message|
  facebook_id = message.sender['id'].to_s

  if clients.key? facebook_id
    bb = clients[facebook_id]
    bb.answer(message.text)
  else
    user = Customer.find_by(facebook_id: facebook_id)
    bb = BotBooking.new(facebook_id, user)
    clients[facebook_id] = bb
  end

  question = bb.next_question
  if question[:type] == :multiple
    response_multiple(message, question[:question], question[:choices])
  elsif question[:type] == :simple
    response_simple(message, question[:question])
  end

  ap bb.debug
  ap "--"
  ap clients

end

Bot.on :postback do |postback|

  bb.answer(postback.payload)
  question = bb.next_question
  if question[:type] == :multiple
    response_multiple(postback, question[:question], question[:choices])
  elsif question[:type] == :simple
    response_simple(postback, question[:question])
  end

  ap bb.debug
  ap "--"
  ap clients
end



# {
#         :type => :multiple,
#     :question => "Quel service voulez vous?",
#      :choices => [
#         [0] "midi",
#         [1] "soir"
#     ]
# }
# {
#         :type => :simple,
#     :question => "Nombre de personne"
# }



# def proposition_date(postback, hour)
#   variable_envoyee = []
#   if hour > 21
#     variable_envoyee << { type: 'postback', title: 'Demain', payload: 'TOMORROW' }
#     variable_envoyee << { type: 'postback', title: 'Autre jour de la semaine', payload: 'WEEK'}
#     # variable_envoyee << { type: 'postback', title: 'Autre possibilité', payload: 'OTHER' }
#   elsif hour >= 14
#     variable_envoyee << { type: 'postback', title: 'Le soir', payload: 'TONIGHT' }
#     variable_envoyee << { type: 'postback', title: 'Demain', payload: 'TOMORROW' }
#     variable_envoyee << { type: 'postback', title: 'Autre jour de la semaine', payload: 'WEEK'}
#     # variable_envoyee << { type: 'postback', title: 'Autre possibilité', payload: 'OTHER' }
#   else
#     variable_envoyee << { type: 'postback', title: 'Le midi', payload: 'NOON' }
#     variable_envoyee << { type: 'postback', title: 'Le soir', payload: 'TONIGHT' }
#     variable_envoyee << { type: 'postback', title: 'Demain', payload: 'TOMORROW' }
#     # variable_envoyee << { type: 'postback', title: 'Autre jour de la semaine', payload: 'WEEK' }
#   end
#   msg = 'Quand souhaitez-vous venir ?'

#   message(postback, variable_envoyee, msg)
#   postback = ''
# end

# def affichage_heure(postback, heure)
#   variable_envoyee = []
#   i = 0
#   heure.each do |h|
#     p h
#     i += 1
#     variable_envoyee << { type: 'postback', title: h, payload: "H#{i}" }
#   end
#   msg = 'A quelle heure souhaitez-vous nous rejoindre ?'
#   message(postback, variable_envoyee, msg)
# end

# def message(postback, variable_recue, msg)
#   p variable_recue
#   postback.reply(
#   attachment: {
#     type: 'template',
#     payload: {
#       template_type: 'button',
#       text: msg,
#       buttons: variable_recue
#     }
#    }
#   )
# end

# Bot.on :message do |message|
#   @client = message.sender['id'].to_s
#   # p @client
#   # p Customer.where(facebook_id: @client.to_s).first
#   if Customer.where(facebook_id: @client).first != nil
#     @first_name = Customer.where(facebook_id: @client).first.first_name
#     @last_name = Customer.where(facebook_id: @client).first.last_name
#     @phone_number = Customer.where(facebook_id: @client).first.phone_number
#     @email = Customer.where(facebook_id: @client).first.email
#     @client_exist = true
#   else
#     @client_exist = false
#   end

# if @client_exist == true
#   message.reply(text: "Trés content de vous revoir #{@first_name} #{@last_name} !")
# else
#   message.reply(text: "Bienvenue à vous !")
# end

#   message.reply(
#   attachment: {
#     type: 'template',
#     payload: {
#       template_type: 'button',
#       text: 'Souhaitez-vous réserver une table ?',
#       buttons: [
#         { type: 'postback', title: 'Oui', payload: 'YES' },
#         { type: 'postback', title: 'Non', payload: 'NO' },
#       ]
#     }
#   }
# )
# end

# res = []
# hour

# Bot.on :postback do |postback|

#   ap postback
#   ap res
#   res << "data"
#   postback.reply(text: "tototoototo à vous !")
#   # test = postback.sent_at.hour
#   # p test
#   # if postback.payload == 'YES'
#   #   proposition_date(postback, test.to_i)
#   # elsif postback.payload == 'NOON'
#   #     heure =['12H00', '13h00', '14h00']
#   #     affichage_heure(postback, heure)
#   # elsif postback.payload == 'TONIGHT'
#   #     heure =['19h00', '20H00', '21h00']
#   #     affichage_heure(postback, heure)
#   # elsif postback.payload == 'TOMORROW'
#   #     services =['Le midi', 'Le soir']
#   #     affichage_heure(postback, services)
#   #     if postback.payload == 'NOON'
#   #     heure =['12H00', '13h00', '14h00']
#   #     affichage_heure(postback, heure)
#   #     elsif postback.payload == 'TONIGHT'
#   #     heure =['19h00', '20H00', '21h00']
#   #     affichage_heure(postback, heure)
#   #     end
#   # elsif postback.payload == 'WEEK'
#   #    postback.reply(text: "Pour quelle jour de la semaine ?")
#   # end
# end
