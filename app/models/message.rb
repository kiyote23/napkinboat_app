class Message < ActiveRecord::Base
	def self.receive_mail(message)
		Message.create! sender_email: message.from.first, content: message.body.decoded
	end
end
