class RelationshipsController < ApplicationController
  
  
  def show
  end

  def new
    @relationship = Relationship.new
  end

  def create
    current_user.active_relationships.create(create_params)
  end

  private

  def create_params
    params.permit(:followed_id)
  end


end