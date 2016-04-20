class Bank < ActiveRecord::Base
  belongs_to :phrase
  belongs_to :pack
  belongs_to :user

  validates :user_id, presence: true
  validates :value, numericality: true  
end
