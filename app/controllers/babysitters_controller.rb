class BabysittersController < ApplicationController
  def new
    @babysitter = Babysitter.new
  end

  def create
  end
end
