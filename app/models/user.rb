class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email, :username, :password
  validates_uniqueness_of :email, :username
  validates_format_of :email, with: /@/
  validates_format_of :username, without: /@/

  def self.find_by_identity(identity)
    return nil unless identity

    if identity.include?('@') && identity.include?('.')
      User.find_by(email: identity)
    else
      User.find_by(username: identity)
    end
  end
end
