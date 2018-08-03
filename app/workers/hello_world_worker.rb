class HelloWorldWorker
  include Sidekiq::Worker
  def perform(source = "unknown")
    client = Slack::Web::Client.new
    client.chat_postMessage(channel: '#travel-crawler', text: "Hello World as #{Time.current} by #{source}", as_user: true)
  end
end
