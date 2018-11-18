class MessagesController < ApplicationController
  before_action :set_chat
  before_action :set_chat_messages, only: [:show, :update, :destroy]

  # GET /apps/:app_token/chats/:chat_number/messages
  def index
    json_response(@chat.messages)
  end

  # GET /apps/:app_token/chats/:chat_number/messages/:number
  def show
    json_response(@message)
  end

  # POST /apps/:app_token/chats
  def create
    @message = @chat.messages.create!(:number=> @chat.messages_count, :chat_id => @chat.id, :chat_number => @chat.number, :body => params[:body])
    @chat.update(:messages_count => @chat.messages_count + 1)
    json_response(@message, :created)
  end

  # PUT /apps/:app_token/chats/:id
  def update
    @message.update(message_params)
    head :no_content
  end

  # DELETE /apps/:app_token/chats/:id
  def destroy
    @message.destroy
    head :no_content
  end

  private

  def message_params
    params.permit(:app_token, :chat_number, :body, :number)
  end

  def set_chat
    @chat = Chat.find_by!(app_token: params[:app_token], number: params[:chat_number])
  end

  def set_chat_messages
    @message = @chat.messages.find_by!(chat_number: params[:chat_number], number: params[:number]) if @chat
  end
end
