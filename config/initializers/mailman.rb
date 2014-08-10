require 'mailman'

Mailman.config.maildir = "app/mailers/maildir"
Mailman.config.watch_maildir = true

#Mailman.config.pop3 = {
#	server: 'a2s62.a2hosting.com', port: 995, ssl: true,
#	username: ENV["NAPKINBOAT_USERNAME"],
#	password: ENV["NAPKINBOAT_PASSWORD"],
#	polling: 60
#}

Mailman.config.ignore_stdin = true

# can't raise the server?
Mailman::Rails.receive do
	default do
		begin
			puts "Received #{message.subject}"
			Message.create(sender_email: message.from.first, content: message.subject, body: message.body.decoded)	
		rescue Exception => e
			Mailman.logger.error "Exception occurred while receiving message."
			Mailman.logger.error [e, *e.backtrace].join("\n")
		end
	end
end

#class Message < ActiveRecord::Base

#	Mailman::Rails.receive do
#		default do
#			begin
#				puts "Received #{message.subject}"
#				Message.create(message)
#		rescue Exception => e
#				Mailman.logger.error "Exception ocurred while receiving message."
#				Mailman.logger.error [e, *e.backtrace].join("\n")
#			end
#		end
#	end
#end
