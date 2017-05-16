module TeleNotify
  module Controller
    def webhook
      if params[:message]
        user = TelegramUser.create( { telegram_id: params[:message][:from][:id],
                                      last_name: params[:message][:from][:last_name],
                                      first_name: params[:message][:from][:first_name] } )


        message = Message.create( { telegram_id: params[:message][:from][:id],
                                      text: params[:message][:text],
                                      last_name: params[:message][:from][:last_name],
                                      first_name: params[:message][:from][:first_name] } )

        


        render :nothing => true, :status => :ok
      end
    end
  end
end
