class RelationshipsController < ApplicationController

    def index
        @relationships = Relationship.all
    end

    def show
        @relationship = Relationship.find(params[:id])
    end

    def new
        @relationship = Relationship.new
    end

    def create
        @relationship = Relationship.new(relationship_params)
        if Relationship.find_by(user_1_id: relationship_params[:user_1_id], user_2_id: relationship_params[:user_2_id]) || Relationship.find_by(user_1_id: relationship_params[:user_2_id], user_2_id: relationship_params[:user_1_id])
            flash[:message] = "Relationship already exists"
            render 'new'
        else
            @relationship.save
            redirect_to user_path(current_user)
        end
    end

    private
    def relationship_params
        params.require(:relationship).permit(:relationship_type, :user_2_id, :user_1_id, :family_id)
    end

end
