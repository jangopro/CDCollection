class User < ActiveRecord::Base
  has_many :ratings
  has_many :ligne_listes

  attr_accessor :password, :password_confirmation
  before_save :encrypt_password

  #validation de nom d'utilisateur
  validates_uniqueness_of :username
  validates_presence_of :username, :on => :create

  #validation de mot de passe
  has_secure_password
  validates :password, length: { minimum: 6 }

  #validation
  validates_presence_of :email, :on => :create
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i


  def initialize(attributes = {})
    super # must allow the active record to initialize!
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def self.authenticate_by_email(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def self.authenticate_by_username(username, password)
    user = find_by_username(username)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end