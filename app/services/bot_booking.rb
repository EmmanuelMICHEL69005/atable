class BotBooking
  attr_reader :start

  def initialize(facebook_id, user = nil)
    @step = :day
    @user = user
    @facebook_id = facebook_id
    if user.present?
      @exist = true
      @first_name = user.first_name
      @email = user.email
      @phone_number = user.phone_number
    end
  end

  def next_question
    case @step
    when :day then next_question_day
    when :service then next_question_service
    when :hour then next_question_hour
    when :nb_person then simple_question("Combien serez-vous?")
    when :first_name then simple_question("Quel est votre prénom?")
    when :last_name then simple_question("Quel est votre nom?")
    when :email then simple_question("Quel est votre email?")
    when :phone_number then simple_question("Quel est votre numéro de téléphone?")
    when :finish then booking_confirmation
    end
  end

  def answer(text)
    case @step
    when :day then answer_day(text)
    when :service then answer_service(text)
    when :hour then answer_hour(text)
    when :nb_person then answer_nb_person(text.to_i)
    when :first_name then answer_first_name(text)
    when :last_name then answer_last_name(text)
    when :email then answer_email(text)
    when :phone_number then answer_phone_number(text)
    when :finish then answer_finish
    end
  end

  def debug
    ap ">>>>>>>>>>"
    p self
    ap @step
    ap @day
    ap @hour
    ap @service
    ap @nb_person
    ap @first_name
    ap @last_name
    ap @email
    ap @phone_number
  end

  private

  def booking_confirmation
    if @exist.nil?
      @user = Customer.create!(facebook_id: @facebook_id, first_name: @first_name, last_name: @last_name, email: @email, phone_number: @phone_number)
    end
    Booking.create!(customer: @user, source: "Facebook", content: '', date: @day, number_of_customers: @nb_person, hour: @hour, restaurant: Restaurant.last)
    simple_question("#{@first_name}, votre réservation a bien été prise en compte. Nous vous attendons le #{@day} à #{@hour} pour #{@nb_person} personne(s).")
  end

  def next_question_day
    if Time.now.hour <= 13
      multiple_choice("Bonjour #{@first_name}, quand est ce que vous voulez venir?", ["midi", "soir", "demain"])
    elsif Time.now.hour <= 20
      multiple_choice("Bonjour #{@first_name}, voulez vous venir ce soir ou demain?", ["soir", "demain"])
    else
      multiple_choice("Bonjour #{@first_name}, quel jour vous voulez venir?", ["demain", "apres demain"])
    end
  end

  def answer_day(text)
    case text
    when "midi"
      @day = Date.today
      @service = "midi"
      @step = :hour
    when "soir"
      @day = Date.today
      @service = "soir"
      @step = :hour
    when "demain"
      @day = 1.day.from_now.to_date
      @step = :service
    when "apres demain"
      @day = 2.day.from_now.to_date
      @step = :service
    end
  end

  def next_question_service
    multiple_choice("Quel service souhaitez-vous?", ["midi", "soir"])
  end

  def answer_service(text)
    case text
    when "midi"
      @service = "midi"
      @step = :hour
    when "soir"
      @service = "soir"
      @step = :hour
    end
  end

  def next_question_hour
    if @service == 'midi'
      multiple_choice("A quelle heure souhaitez-vous venir ?", ["12:00", "13:00", "14:00"])
    else
      multiple_choice("A quelle heure souhaitez-vous venir ?", ["19:00", "20:00", "21:00"])
    end
  end

  def answer_hour(text)
    @hour = text
    @step = :nb_person
  end

  def answer_nb_person(nb)
    @nb_person = nb
    if @first_name
      @step = :finish
    else
      @step = :first_name
    end
  end

  def answer_first_name(text)
    @first_name = text
    @step = :last_name
  end

  def answer_last_name(text)
    @last_name = text
    @step = :email
  end

  def answer_email(text)
    @email = text
    if @user.blank?
      @user = Customer.find_by(email: @email)
      @exist = true
    end
    @step = :phone_number
  end

  def answer_phone_number(text)
    @phone_number = text
    @step = :finish
  end

  def answer_finish
    @step = :day
  end

  def multiple_choice(question, choices)
    { type: :multiple, question: question, choices: choices }
  end

  def simple_question(question)
    { type: :simple, question: question }
  end

end
