class HelloWorldWorker
  include Sidekiq::Worker
  def perform(source: nil)
    client = Slack::Web::Client.new
    client.chat_postMessage(channel: '#travel-crawler', text: "Hello World as #{Time.currernt} by #{source}", as_user: true)
  end
end
