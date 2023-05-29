class MeasuresController < ApplicationController

  def index
    @measures = Measure.all
    @current_measure = CurrentMeasure.order(created_at: :desc)
  end

  def new

  end
  def create
    @measure = Measure.new(measure_params)

    respond_to do |format|
      if @measure.save
        format.html { redirect_to root_url}
        format.json { render :show, status: :created, location: @measure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @measure.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def measure_params
    params.require(:measure).permit( :new_measure, :name_muscle, :user_id)
  end

end
