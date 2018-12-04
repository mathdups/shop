class Purchase < ApplicationRecord
  belongs_to :user
  
  def to_param
    uuid
  end
end
