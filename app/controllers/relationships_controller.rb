class RelationshipsController < ApplicationController

    def index
        @relationships = current_user.relationships
    end

    def new
        @relationship = Relationship.new
    end

    def create
        @relationship = Relationship.new(relationship_params)
        if Relationship.find_by(user_id: relationship_params[:user_id], family_id: relationship_params[:family_id], relationship_type: relationship_params[:relationship_type])
            flash[:message] = "Relationship already exists"
            render 'new'
        else
            @relationship.save
            clear_flash
            redirect_to user_path(current_user)
        end
    end

    def destroy
        @relationship = Relationship.find(params[:id])
        @relationship.delete
        redirect_to relationships_path
    end

    private
    def relationship_params
        params.require(:relationship).permit(:relationship_type, :user_id, :family_id)
    end

end
