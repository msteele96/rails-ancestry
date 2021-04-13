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
        raise params.inspect
    end

    private
    def relationship_params
        params.require(:relationship).permit(:relationship_type, :user_2_id, :user_1_id, :family_id)
    end

end
