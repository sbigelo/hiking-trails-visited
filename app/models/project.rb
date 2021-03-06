class Project < ActiveRecord::Base
    extend Slugify::ClassMethods
    include Slugify::InstanceMethods

    validates_presence_of :name, :location, :date_visited, :rating

    belongs_to :user

end
