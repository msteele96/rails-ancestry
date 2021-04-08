class FamiliesController < ApplicationController

    def index
        @families = Family.all
    end

    def show
        @family = Family.find(params[:id])
    end

    def new
        @family = Family.new
    end

    def create
        @family = Family.create(family_params)
        redirect_to family_path(@family)
    end

    def edit
        @family = Family.find(params[:id])
    end

    def update
        
    end

    def destroy
        
    end
    
    private

    def family_params
        params.require(:family).permit(:name)
    end

end
