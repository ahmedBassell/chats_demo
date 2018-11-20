class ChatsWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform(*args)
    # Do something
    @app_token = args
    App.transaction do
      @app = App.lock(true).find_by!(token: @app_token)
      @chat = @app.chats.create!(:app_token=> @app_token, :number=> @app.chats_count, :app_id => @app.id)
      @app.update(:chats_count => @app.chats_count + 1)
    end
  end
end




# class ChatsDeleteWorker
#   include Sidekiq::Worker
#   sidekiq_options retry: false
#
#   def perform
#
#   end
# end
