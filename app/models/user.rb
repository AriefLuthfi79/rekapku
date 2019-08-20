class User < ApplicationRecord
  attr_accessor :remember_token, :reset_token

  has_secure_password

  def generate_new_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(token)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(token, cost: cost)
  end

  def authenticate?(field, token)
    encrypt = send("#{field}_digest")
    return false if token.nil?
    BCrypt::Password.new(encrypt).is_password? token
  end

  def remember
    self.remember_token = generate_new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
