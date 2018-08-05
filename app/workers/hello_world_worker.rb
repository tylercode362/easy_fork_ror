class HelloWorldWorker
  include Sidekiq::Worker
  def perform(source = "unknown")
    dasdadas
    client = Slack::Web::Client.new
    client.chat_postMessage(channel: '#travel-crawler', text: "Hello World as #{Time.current} by #{source}", as_user: true)
    puts "slack test ok"
  end
end
