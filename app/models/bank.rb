class Bank < ActiveRecord::Base
  attr_accessor :time

  belongs_to :phrase
  belongs_to :pack
  belongs_to :user

  validates :user_id, presence: true
  validates :value, numericality: true

  def self.money_spent_today(user)
    @money_spent_today = (user.banks.where("DATE(created_at) = ?", Date.today).where("value < 0").sum(:value)).abs
    return @money_spent_today
  end

  def self.smoked_today(user)
    @smoked_today_total = user.banks.where("DATE(created_at) = ?", Date.today).where("value < 0").count
    return @smoked_today_total
  end

  def self.money_saved_today(user)
    @money_saved_today = user.banks.where("DATE(created_at) = ?", Date.today).where("value > 0").sum(:value)

  end

  def self.nonsmoked_today(user)
    @nonsmoked_today_total = user.banks.where("DATE(created_at) = ?", Date.today).where("value > 0").count
    return @nonsmoked_today_total
  end

  def self.money_spent_week(user)
    @money_spent_week = (user.banks.where("created_at >= :start AND created_at < :end",
                   :start => 1.week.ago.to_date,
                   :end   => Time.now).where("value < 0 ").sum(:value)).abs
    return @money_spent_week
  end

  def self.smoked_week(user)
    @smoked_week_total = user.banks.where("created_at >= :start AND created_at < :end",
                       :start => 1.week.ago.to_date,
                       :end   => Time.now).where("value < 0 ").count
    return @smoked_week_total
  end

  def self.money_saved_week(user)
    @money_saved_week = user.banks.where("created_at >= :start AND created_at < :end",
                       :start => 1.week.ago.to_date,
                       :end   => Time.now).where("value > 0 ").sum(:value)
    return @money_saved_week
  end

  def self.nonsmoked_week(user)
    @nonsmoked_week_total = user.banks.where("created_at >= :start AND created_at < :end",
                       :start => 1.week.ago.to_date,
                       :end   => Time.now).where("value > 0 ").count
    return @nonsmoked_week_total
  end

  def self.money_spent_alltime(user)
    @money_spent_alltime = (user.banks.where("value < 0").sum(:value)).abs
    return @money_spent_alltime
  end

  def self.smoked_alltime(user)
    @smoked_alltime = user.banks.where("value < 0").count
    return @smoked_alltime
  end

  def self.money_saved_alltime(user)
    @money_saved_alltime = user.banks.where("value > 0").sum(:value)
    return @money_saved_alltime
  end

  def self.nonsmoked_alltime(user)
    @nonsmoked_alltime = user.banks.where("value > 0").count
    return @nonsmoked_alltime
  end

  def self.time_seconds(user)
    @smoked = Bank.where("value < 0").order(created_at: :desc)
    @last_smoked = @smoked.first
    @time = (Time.now - @last_smoked.created_at).to_i
  end
end
