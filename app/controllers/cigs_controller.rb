class CigsController < ApplicationController
  def positive
    @bank = Bank.new(user: current_user, value: getprice)
    @bank.save
    @val = current_user.total
    @sumbank = "%.2f" % @val
    respond_to do |format|
      format.json { render json: { total: @sumbank }}
      format.html { redirect_to banks_path }
    end
  end

  def negative
    @bank = Bank.new(user: current_user, value: ((getprice) * -1))
    @bank.save
    @val = current_user.total
    @sumbank = "%.2f" % @val
    respond_to do |format|
      format.json { render json: { total: @sumbank }}
      format.html { redirect_to banks_path }
    end
  end

  private

  def getprice
    @cig_pack = current_user.packs.find_by(active: true)
    @cig_price = @cig_pack.price_pack/20
  end
end
