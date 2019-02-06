class GreetingMailer < ApplicationMailer
	default from: "no-reply@nomsterapp.com"

	def user_signed_up(user)
		mail(to: user.email,
         subject: "Thank you for signing up")
	end
end
