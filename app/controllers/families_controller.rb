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
        @family = Family.new(family_params)
        if @family.save
            redirect_to family_path(@family)
        else
            flash[:message] = @family.errors.full_messages
            render 'new'
        end
    end

    def edit
        @family = Family.find(params[:id])
    end

    def update
        @family = Family.find(params[:id])
        if @family.update(family_params)
            redirect_to family_path(@family)
        else
            flash[:message] = @family.errors.full_messages
            render 'new'
        end
    end
    
    private

    def family_params
        params.require(:family).permit(:name)
    end

end
