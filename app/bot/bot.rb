include Facebook::Messenger

Bot.on :message do |message|
  if message.text.include? "Bonjour"
    message.reply(text: 'Hello, human!')
  else
    message.reply(text: 'FDP')
  end
end
