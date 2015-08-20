class User < ActiveRecord::Base

	# Regex para validar email
	EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

	# Validações 
	validates_presence_of :email, :full_name, :location, :password
	validates_confirmation_of :password
	validates_length_of :bio, minimum: 30, allow_blank: false
	validates_uniqueness :email

	# validate :email_format

	# def email_format
	# 	errors.add(:email, :invalid) unless  email.match(EMAIL_REGEXP)
	# end

	validate do
		errors.add(:email, :invalid) unless  email.match(EMAIL_REGEXP)
	end

end