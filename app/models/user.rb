class User < ActiveRecord::Base
extend Slugify::ClassMethods
include Slugify::InstanceMethods

has_secure_password

validates :username, :email, presence: true
validates :username, :email, uniqueness: true
validates :password, presence: true
has_many :projects

end


