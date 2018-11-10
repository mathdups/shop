class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  super
    subclass.primary_key = 'id'
end
