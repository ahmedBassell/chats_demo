class CreateChatsWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform(*args)
    # Do something
    @app = App.lock(true).find_by!(token: args[0])
    @chat = @app.chats.create!(:app_token=> args[0], :number=> args[1], :app_id => @app.id)
  end
end
