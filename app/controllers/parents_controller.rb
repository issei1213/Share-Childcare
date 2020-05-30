class ParentsController < ApplicationController
  before_action :parent_find, only: [:edit, :update, :show]

  def new
    @parent = Parent.new
    @parent.baby_infomations.new
  end

  def create
  end

  def edit
    @parent.baby_infomations
  end

  def update
  end

  def show
  end

  private

  def parent_find
    @parent = current_user.parent
  end
end
