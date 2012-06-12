class ClientMailer < ActionMailer::Base
  default from: "vibrafitness@vibrafitness.com"

  def registration_confirmation(client)
  	@client = client;
  	mail to: @client.email, subject: "Bienvenido a Vibra Fitness"
  end

end