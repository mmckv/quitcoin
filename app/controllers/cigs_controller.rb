class CigsController < ApplicationController
  before_action :pre_click

  def positive
    @bank = Bank.new(user: current_user, value: getprice)
    @bank.save
    @total = current_user.total
    @notice = @phrases[@rand]["quote"]
    flash[:notice] = @notice
    respond_to do |format|
      format.json { render json: "%.2f" % @total }
      format.html { redirect_to banks_path }
    end
  end

  def negative
    @bank = Bank.new(user: current_user, value: ((getprice) * -1))
    @bank.save
    @total = current_user.total
    flash[:notice] = @phrases[@rand]["quote"]
    respond_to do |format|
      format.json { render json: "%.2f" % @total }
      format.html { redirect_to banks_path }
    end
  end

  private

  def getprice
    @cig_pack = current_user.packs.find_by(active: true)
    @cig_price = @cig_pack.price_pack/20
  end

  def pre_click
    @phrases = Phrase.all
    @rand = rand(@phrases.length)
  end
end
