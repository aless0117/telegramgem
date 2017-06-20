 module TeleNotify
  module Controller
    def webhook
      if params[:message]
        user = TelegramUser.create( { telegram_id: params[:message][:from][:id],
                                      last_name: params[:message][:from][:last_name],
                                      first_name: params[:message][:from][:first_name] } )
        if user.save
          user.send_message("Bienvenido #{user.first_name}. Dime, quieres saber cuales son los proximos eventos?")
        end


                user2 = User.create( { telegram_id: params[:message][:from][:id],
                                       last_name: params[:message][:from][:last_name],
                                       first_name: params[:message][:from][:first_name] } )


        message = Message.create( { telegram_id: params[:message][:from][:id],
                                      text: params[:message][:text],
                                      last_name: params[:message][:from][:last_name],
                                      first_name: params[:message][:from][:first_name] } )

        evento = Event.all
        usuarios = User.all


        if message.text['Si'] || message.text['Sí'] || message.text['sí'] || message.text['si']
            user.send_message("Estos son los proximos eventos:")

            evento.each do |event|
              user.send_message("El evento " + event.name + " " + "que se dara el dia " + event.start )

            end

            user.send_message("A cual vas a asistir?")
        end

        evento.each do |event|
          if message.text[event.name]
            usuarios.each do |bro|
                event_to_user = EventToUser.create( { event_id: event.id,
                                              user_id: bro.id } )
                if event_to_user.save
                        user.send_message("Bienvenido a " + event.name + "! " +  "Te mantendremos informado")

              end
          end
        end
      end





      #  if message.text['Como'] || message.text['estas'] || message.text['Que tal']
      #      user.send_message("Bien y tu?")
    #    end

    #    if message.text['Bien'] || message.text['Genial'] || message.text['Cool'] || message.text['Estupendo']
    #        user.send_message("Me alegra el alma")
    #    end

    #    if message.text['Mal'] || message.text['Normal'] || message.text['Ahi ahi'] || message.text['Pesimo']
    #        user.send_message("Y eso?")
    #    end





        render :nothing => true, :status => :ok
      end
    end
  end
end
