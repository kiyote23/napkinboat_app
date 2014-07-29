class UserMailer < ActionMailer::Base

	def receive(email)
		Message.create(sender_email: email.from.to_s, content: email.subject, body:email.body.decoded)
		if email.has_attachments?
			email.attachments.each do |attachment|
				page.attachments.create({
					file: attachment,
					description: email.subject
				})
			end
		end
	end
end
