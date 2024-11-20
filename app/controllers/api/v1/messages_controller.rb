class Api::V1::MessagesController < ApplicationController
    before_action :authenticate_request
  
    def index
      messages = Message.includes(:ticket).where(ticket_id: params[:ticket_id])
      render json: {
        client_name: messages.first&.ticket&.client_name,
        messages: messages.map do |message|
          {
            id: message.id,
            ticket_id: message.ticket_id,
            sender: message.sender,
            content: message.content,
            created_at: message.created_at,
            updated_at: message.updated_at
          }
        end
      }, status: :ok
    end
  
    def create
      message = Message.new(message_params)
      if message.save
        render json: message, status: :created
      else
        render json: { error: message.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def message_params
      params.require(:message).permit(:ticket_id, :sender, :content)
    end
  end
  