class CreateMessagesWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform(*args)
    # Do something
    Chat.transaction do
      @chat = Chat.lock(true).find_by!(app_token: args[0], number: args[1])
      @message = @chat.messages.create!(
        :chat_id => @chat.id,
        :chat_number => args[1],
        :body => args[2],
        :number=> args[3]
      )
    end
  end
end
