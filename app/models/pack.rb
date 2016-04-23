class Pack < ActiveRecord::Base
  belongs_to :user
  has_many :banks

  validates :price_pack, presence: true, numericality: true
  validates :price_pack, numericality: { greater_than: 0 }
end
