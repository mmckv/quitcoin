class Phrase < ActiveRecord::Base
  has_many :banks
  has_many :users, through: :banks
end
