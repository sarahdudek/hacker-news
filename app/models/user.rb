class User < ActiveRecord::Base
  include BCrypt

  validates :email, presence: true, uniqueness: true
  validate :validate_password

  def password
    @password ||= Password.new(self.hashed_password)
  end

  def password=(input_password)
    @raw_password = input_password
    @password = Password.create(input_password)
    self.hashed_password = @password
  end

  def validate_password
    if @raw_password.nil?
      errors.add(:password, "is required")
    elsif @raw_password.length < 6
      errors.add(:password, "must be greater than 6 characters")
    end
  end

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    if user && user.password == password
      return user
    else
      return nil
    end
  end
end
