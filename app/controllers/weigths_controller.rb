class WeigthsController < ApplicationController
    def index
        @weigth = Weigth.all
      end
    
      def show
        @weigth = Weigth.where(training_id: params[:training_id]).map
      end
    
      def new
        @weigth = Weigth.new
        @current_training_id = Training.find_by(id: params[:training_id]).id
        @current_name_training = Training.find_by(id: params[:training_id]).name_training
        @current_weigth = Training.find_by(id: params[:training_id]).weigth
      end
    
      def edit
      end
    
      def create
        @weigth = Weigth.new(weigth_params)
    
        respond_to do |format|
          if @weigth.save
            format.html { redirect_to root_path}
            format.json { render :show, status: :created, location: @weigth }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @weigth.errors, status: :unprocessable_entity }
          end
        end
      end
      def looper
      end
    
      # PATCH/PUT /companies/1 or /companies/1.json
      def update
        respond_to do |format|
          if @weigth.update(weigth_params)
            format.html { redirect_to root_path, notice: "Treino modificado com sucesso!" }
            format.json { render :show, status: :ok, location: @weigth }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @weigth.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # DELETE /companies/1 or /companies/1.json
      def destroy
        @weigth.destroy
    
        respond_to do |format|
          format.html { redirect_to trainings_url, notice: "Treino deletado com sucesso!" }
          format.json { head :no_content }
        end
      end
    
      private
    
        # Only allow a list of trusted parameters through.
        def weigth_params
          params.require(:weigth).permit( :training_id, :last_weigth)
        end
end
