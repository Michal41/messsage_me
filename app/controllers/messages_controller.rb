class MessagesController < ApplicationController
	before_action :require_user

	def create
		@message=Message.new( body: params[:message][:body], user: current_user )

		if @message.save
			ActionCable.server.broadcast "chatroom_channel", mod_message: message_render(@message)
		end		
		redirect_to root_path
	end


	private

	def message_render(message)
		render(partial: 'message', locals:{message: message})
	end


end


