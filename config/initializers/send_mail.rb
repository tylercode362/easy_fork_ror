def send_mail(
    to: ,
    subject:, 
    content:,
    send_at:,
  )
  require "sinatra"
  require "sendgrid-ruby"
  
    # Define necessary information for a new email
    from    = SendGrid::Email.new email: Rails.application.config.app["SENDGRID_SENDER"]
    to      = SendGrid::Email.new email: to
    subject = subject
    content = SendGrid::Content.new type:  "text/plain",
                                    value: content
  
    # Define the new email with provided information
    mail = SendGrid::Mail.new(from, subject, to, content)
  
    # Create a new API Client to send the new email
    sendgrid = SendGrid::API.new api_key: Rails.application.config.app["SENDGRID_API_KEY"]
  
    begin
      # Send request to "mail/send"
      response = sendgrid.client.mail._('send').post request_body: mail.to_json
  
      puts "Email sent. #{response.status_code}"
      true
    rescue Exception => ex
      puts "An error occurred: #{ex.message}"
      false
    end
  end
end