class BanksController < ApplicationController
  def index
    if current_user
      @current_pack = current_user.packs.find_by(active: true)
      if @current_pack.nil?
        flash[:notice] = "Add your pack price!"
        redirect_to new_pack_path
      end
        @total = current_user.total
    else
      flash[:error] = "Please sign in!"
      redirect_to new_user_session_path
    end
  end

  private

  def banks_params
    params.require(:bank).permit(:value,
                                :user_id,
                                :phrase_id)
  end
end
