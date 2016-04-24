class CigsController < ApplicationController
  def positive
    @bank = Bank.new(user: current_user, value: getprice)
    @bank.save
    @phrases = Phrase.all
    @rand = rand(@phrases.length)
    flash[:notice] = @phrases[@rand]["quote"]
    redirect_to banks_path
  end

  def negative
    @bank = Bank.new(user: current_user, value: ((getprice) * -1))
    @bank.save
    @phrases = Phrase.all
    @rand = rand(@phrases.length)
    flash[:notice] = @phrases[@rand]["quote"]
    redirect_to banks_path
  end

  private

  def getprice
    @cig_pack = current_user.packs.find_by(active: true)
    @cig_price = @cig_pack.price_pack/20
  end
end
