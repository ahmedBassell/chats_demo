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
    @newChatNumber = @app.chats_count

    # Handle race condition by locking the record for update and prevent other threads from writing
    App.transaction do
      @app.update(:chats_count => @app.chats_count + 1)
    end

    CreateChatsWorker.perform_async(params[:app_token], @newChatNumber)
    json_response({ number: @newChatNumber }, :created)
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
    params.permit(:app_token, :number)
  end

  def set_app
    @app = App.find_by!(token: params[:app_token])
  end

  def set_app_chats
    @chat = @app.chats.find_by!(number: params[:number]) if @app
  end
end
