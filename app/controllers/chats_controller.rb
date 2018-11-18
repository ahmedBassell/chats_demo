class ChatsController < ApplicationController
  before_action :set_app
  before_action :set_app_chats, only: [:show, :update, :destroy]

  # GET /apps/:app_token/chats
  def index
    json_response(@app.chats)
  end

  # GET /apps/:app_token/chats/:id
  def show
    json_response(@chat)
  end

  # POST /apps/:app_token/chats
  def create
    @chat = @app.chats.create!(:app_token=> chat_params[:app_token], :number=> @app.chats_count, :app_id => @app.id)
    @app.update(:chats_count => @app.chats_count + 1)
    json_response(@chat, :created)
  end

  # PUT /apps/:app_token/chats/:id
  def update
    @chat.update(chat_params)
    head :no_content
  end

  # DELETE /apps/:app_token/chats/:id
  def destroy
    @chat.destroy
    head :no_content
  end

  private

  def chat_params
    p params
    params.permit(:app_token, :number)
  end

  def set_app
    @app = App.find_by!(token: params[:app_token])
  end

  def set_app_chats
    @chat = @app.chats.find_by!(number: params[:number]) if @app
  end
end
