class WeigthsController < ApplicationController
  def new

  end
  def create
    @weigth = Training.new(training_params)
    @current_weigth = Training.last.weigth
    @new_weigth = Weight.new(weigth: @current_weigth)

    respond_to do |format|
      if @weigth.save
        format.html { redirect_to trainings_url}
        format.json { render :show, status: :created, location: @weigth }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @weigth.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def training_params
    params.require(:weigth).permit( :user_id, :name_training, :weigth)
  end

end
