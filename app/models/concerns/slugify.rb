
  module  Slugify

    module InstanceMethods
        def slug
            self.username.downcase.gsub(" ", "-")
        end
    end

    module ClassMethods
      def find_by_slug(slug)
        self.all.detect {|o| o.slug == slug}
      end
    end

  end
