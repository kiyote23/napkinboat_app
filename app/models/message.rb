class Message < ActiveRecord::Base
	#def self.receive_mail(message)
		# encoding = message.text_part.content_type_parameters['charset']
		# body = message.text_part.body.decoded.force_encoding(encoding).encode('UTF-8', {:invalid => :replace, :undef => :replace, :replace => '?'})
	#	body = (message.text_part || message.html_part || message).body.decoded.encode('UTF-8')
	#	Message.create sender_email: message.from.first, content: body
	#end
	
#	def receive(email)
#		self.create(sender_email: email.from.to_s, content: email.subject, body: email.body.decoded)
#	end
	
#	Mailman::Rails.receive do
#		to "napkinboat@dorkfarm.net" do
#			Message.create(sender_email: email.from.first, content: email.subject, body: email.body.decoded)
#		end
#	end
end
