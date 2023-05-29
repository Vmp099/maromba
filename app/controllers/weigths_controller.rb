class WeigthsController < ApplicationController
  def new

  end
  def create
    @current_weigth = Training.find(training_find["training_id"])
    @weigth = Training.where(id: @current_weigth).update(training_params)
    @new_weigth = Weigth.new(weigth: @current_weigth.weigth , training_id: training_find["training_id"])


    respond_to do |format|
      if @new_weigth.save
        format.html { redirect_to trainings_url}
        format.json { render :show, status: :created, location: @weigth }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @weigth.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def training_find
    params.require(:weigth).permit( :training_id)
  end
  def training_params
    params.require(:weigth).permit( :weigth)
  end

end
