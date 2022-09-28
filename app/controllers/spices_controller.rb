class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    #GET /index 
    def index 
       @spices = Spice.all
       render json: @spices, except: [:created_at, :updated_at], status: :ok
    end

    #GET /show
    def show 
        @spice = find_spice 
        render json: @spice, except: [:created_at, :updated_at], status: :ok
    end

    # POST /create
    def create
       @new_spice = Spice.create(spice_params) 
       render json: @new_spice, except: [:created_at, :updated_at], status: :created    
    end

    #PATCH /update
    def update 
        @spice_update = find_spice 
        @spice_update.update(spice_params)
        render json: @spice_update, except: [:created_at, :updated_at], status: :ok
    end
        
    #DELETE /destroy
    def destroy 
        @new_deleted = find_spice 
        @new_deleted.destroy
        head :no_content
    end

    #private methods
    private
    def find_spice 
        spice = Spice.find(
        params[:id]
        )
    end

    def spice_params
        params.permit(:title ,:notes, :rating, :image, :description)
    end

    def render_not_found 
        render json: { error: "Record Not Found" }, status: :not_found 
    end
end
