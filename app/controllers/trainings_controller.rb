class TrainingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @trainings = Training.all
    @current_weigth = Weigth.order(created_at: :desc)
  end

  def show
    @training = Training.where(user_id: current_user).map
    @current_weigth = Weigth.order(created_at: :desc)
  end

  def new
  end

  def edit
    @training  = Training.find(params[:id])
  end

  def create
    @training = Training.new(training_params)
    respond_to do |format|
      if @training.save
        format.html { redirect_to trainings_looper_url}
        format.json { render :show, status: :created, location: @training }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    @training = Training.find(params[:id])
    respond_to do |format|
      if @training.update(training_params)
        format.html { redirect_to root_path, notice: "Treino modificado com sucesso!" }
        format.json { render :show, status: :ok, location: @training }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @training = Training.find(params[:id])
  end
  # DELETE /companies/1 or /companies/1.json
  def destroy
    @training = Training.find(params[:id])
    @weigth = Weigth.find_by(training_id: @training.id)
    respond_to do |format|
      @weigth.destroy
      @training.destroy
      format.html { redirect_to trainings_url, notice: "Treino deletado com sucesso!" }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def training_params
      params.require(:training).permit( :user_id, :name_training, :weigth)
    end

end
