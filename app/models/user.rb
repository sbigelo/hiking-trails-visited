class User < ActiveRecord::Base
extend Slugify::ClassMethods
include Slugify::InstanceMethods

has_secure_password
validates_presence_of :username, :email, :password

has_many :projects

end
