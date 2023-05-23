class TrainingsController < ApplicationController
  before_action :authenticate_user!
  before_action :new_repeter_path, only[:new]

  def index
    @trainings = Training.all
  end

  def show
    @training = Training.where(user_id: current_user).map
  end

  def new

  end

  def edit
  end

  def create
    @training = Training.new(training_params)

    respond_to do |format|
      if @training.save
        format.html { redirect_to trainings_url, notice: "Treino salvo com sucesso!" }
        format.json { render :show, status: :created, location: @training }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    respond_to do |format|
      if @training.update(training_params)
        format.html { redirect_to training_url(@training), notice: "Treino modificado com sucesso!" }
        format.json { render :show, status: :ok, location: @training }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    @training.destroy

    respond_to do |format|
      format.html { redirect_to trainings_url, notice: "Treino deletado com sucesso!" }
      format.json { head :no_content }
    end
  end

  private
    def number_of_trainings
      @number = params(:number)
    end

    # Only allow a list of trusted parameters through.
    def training_params
      params.require(:training).permit( :user_id, :name_training, :weigth)
    end

end
