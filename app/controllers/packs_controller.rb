class PacksController < ApplicationController
  def new
    @pack = Pack.new
    @total = current_user.total
  end

  def create
    user_packs = Pack.where(user: current_user)
    user_packs.each do |pack|
      pack.active = false
      pack.save
    end
    @pack = Pack.new(pack_params)
    @pack.user = current_user
    if @pack.save
      user_packs = Pack.where(user: current_user)
      user_packs.each do |pack|
        pack.active = false
        pack.save
      end
      @pack.active = true
      @pack.save
      flash[:notice] = "Pack updated!"
      redirect_to banks_path
    else
      flash[:notice] = "Please enter the price of a pack of cigarettes."
      redirect_to new_pack_path
    end
  end

  def edit
    @pack = Pack.find(params[:id])
    @total = current_user.total
  end

  def update
    @pack = Pack.find(params[:id])
    if @pack.update_attributes(pack_params)
      flash[:notice] = "Pack price updated successfully."
    else
      flash[:error] = @pack.errors.full_messages.join(". ")
    end
  end

  private

  def pack_params
    params.require(:pack).permit(:price_pack)
  end
end
