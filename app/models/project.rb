class Project < ActiveRecord::Base
    extend Slugify::ClassMethods
    include Slugify::InstanceMethods

    # validates_presence_of :name, :......

    belongs_to :user

end
