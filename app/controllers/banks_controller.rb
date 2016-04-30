class BanksController < ApplicationController
  def index
     if current_user
      @current_pack = current_user.packs.find_by(active: true)
      if @current_pack.nil?
        flash[:notice] = "Please enter your local price for a pack of cigarettes."
        redirect_to new_pack_path
      else
        @stats = generatestats
        @cighash = {}
        @vars = create_cighash
        @sumbank = "%.2f" % current_user.total
      end
    else
      flash[:error] = "Please sign in."
      redirect_to new_user_session_path
    end
  end

  def updatevalues
    generatestats
    respond_to do |format|
      format.json { render json: create_cighash }
    end
  end

  private

  def banks_params
    params.require(:bank).permit(:value,
                                :user_id,
                                :phrase_id)
  end

  def generatestats
    @spent_today = Bank.money_spent_today(current_user)
    @smoked_today = Bank.smoked_today(current_user)
    @saved_today = Bank.money_saved_today(current_user)
    @nonsmoked_today = Bank.nonsmoked_today(current_user)

    @spent_week = Bank.money_spent_week(current_user)
    @saved_week = Bank.money_saved_week(current_user)
    @smoked_week = Bank.smoked_week(current_user)
    @nonsmoked_week = Bank.nonsmoked_week(current_user)

    @spent_alltime = Bank.money_spent_alltime(current_user)
    @saved_alltime = Bank.money_saved_alltime(current_user)
    @smoked_alltime = Bank.smoked_alltime(current_user)
    @nonsmoked_alltime = Bank.nonsmoked_alltime(current_user)

    @seconds = Bank.time_seconds(current_user)
    @minutes = Bank.time_seconds(current_user) / 60
    @hours = Bank.time_seconds(current_user) / 3600
    @days = Bank.time_seconds(current_user) / 86400
    @weeks = Bank.time_seconds(current_user) / 604800
  end

  def create_cighash
    @phrases = Phrase.all
    @rand = rand(@phrases.length)
    @quote = @phrases[@rand]["quote"]
    @cighash = {}
    @cighash[:quote] = @quote
    @cighash[:minutes] = @minutes
    @cighash[:hours] = @hours
    @cighash[:days] = @days
    @cighash[:weeks] = @weeks
    @cighash[:smoked_today] = @smoked_today
    @cighash[:nonsmoked_today] = @nonsmoked_today
    @cighash[:net_today] = "%.2f" % (@saved_today - @spent_today)
    @cighash[:smoked_week] = @smoked_week
    @cighash[:nonsmoked_week] = @nonsmoked_week
    @cighash[:net_week] = "%.2f" % (@saved_week - @spent_week)
    @cighash[:smoked_alltime] = @smoked_alltime
    @cighash[:nonsmoked_alltime] = @nonsmoked_alltime
    @cighash[:net_alltime] = "%.2f" % (@saved_alltime - @spent_alltime)
    @cighash
  end
end
