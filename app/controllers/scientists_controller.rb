class ScientistsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_validation_errors

    def index
        scientists =  Scientist.all
        render json: scientists
    end

    def show
        scientist = find_scientist
        render json: scientist, serializer: ScientistShowSerializer
    end

    def create
        scientist = Scientist.create!(params_scientist)
        render json: scientist, status: :created
    end

    def update
        scientist = find_scientist
        scientist.update!(params_scientist)
        render json: scientist, status: :accepted 
    end

    def destroy 
        scientist = find_scientist
        scientist.destroy
        head :no_content
    end

    private

    def render_not_found
        render json: {error: "Scientist not found"}, status: :not_found
    end

    def render_validation_errors
        render json: {errors: ErrorMessage.Serializer.error.messages(invalid.record.errors)}, status: :unprocessable_entity
    end

    def find_scientist
        Scientist.find(params[:id])
    end

    def params_scientist
        params.permit(:name, :field_of_study, :avatar)
    end
end
