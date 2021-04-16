class RelationshipsController < ApplicationController

    def index
        @relationships = current_user.relationships
    end

    def new
        @relationship = Relationship.new
    end

    def create
        @relationship = Relationship.new(relationship_params)
        if @relationship.save
            clear_flash
            redirect_to user_path(current_user)
        else
            flash[:message] = @relationship.errors.full_messages
            render 'new'
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
