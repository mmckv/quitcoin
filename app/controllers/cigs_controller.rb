class CigsController < ApplicationController
  def positive
    @bank = Bank.new(user: current_user, value: getprice)
    @bank.save
    @total = "%.2f" % current_user.total
    respond_to do |format|
      format.json { render json: @total }
      format.html { redirect_to banks_path }
    end
  end

  def negative
    @bank = Bank.new(user: current_user, value: ((getprice) * -1))
    @bank.save
    @float = current_user.total
    @total = "%.2f" % @float
    respond_to do |format|
      format.json { render json: @total }
      format.html { redirect_to banks_path }
    end
  end

  private

  def getprice
    @cig_pack = current_user.packs.find_by(active: true)
    @cig_price = @cig_pack.price_pack/20
  end
end
