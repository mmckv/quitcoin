class User < ActiveRecord::Base
  has_many :banks
  has_many :packs
  has_many :phrases, through: :banks

  validates :email, presence: true
  validates :encrypted_password, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def total
  @count = 0
  @banks = banks
  @banks.each do |cig|
    @count += cig.value
  end
    return @count
  end
end
