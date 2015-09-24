require 'bcrypt'
class User < ActiveRecord::Base
	before_save :add_salt, :if=>:password_changed?
	after_save :clear_password
	
	def check_password(hash)
		if hash == nil or hash == ''
			return false
		end
		new_hash = BCrypt::Engine.hash_secret(hash, salt)
		new_hash == pwd_hash
	end

    def self.authenticate(email="", password="")
		user = User.find_by_email(email)
		puts user
		if user && user.check_password(password)
			return user
		else
			return false
		end
    end
  
    def password_changed?
    	return true
    end

    def add_salt
    	self.salt = BCrypt::Engine.generate_salt
    	self.pwd_hash= BCrypt::Engine.hash_secret(pwd_hash, salt)
    end

    def clear_password
    	self.pwd_hash = ''
    end
end