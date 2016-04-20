class Pack < ActiveRecord::Base
  belongs_to :user
  has_many :banks
  
  validates :price_pack, presence: true, numericality: true
end
