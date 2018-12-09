class Purchase < ApplicationRecord
  belongs_to :user

  validates :is_sent, inclusion: { in: [ true, false ] }, :default => false
  
  def to_param
    uuid
  end
end
