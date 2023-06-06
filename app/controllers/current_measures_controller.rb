class CurrentMeasuresController < ApplicationController
  def new

  end
  def create
    @current_measure = Measure.find(measure_find["measure_id"])
    @measure = Measure.where(id: @current_measure.id).update(measure_params)
    @new_measure = CurrentMeasure.new(measure_new: @current_measure.new_measure , measure_id: measure_find["measure_id"])


    respond_to do |format|
      if @new_measure.save
        format.html { redirect_to measures_url}
        format.json { render :show, status: :created, location: @measure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @measure.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def measure_find
    params.require(:measure).permit( :measure_id)
  end
  def measure_params
    params.require(:measure).permit( :new_measure)
  end

end
