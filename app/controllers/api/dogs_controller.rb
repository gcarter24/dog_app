class Api::DogsController < ApplicationController
  def index
    @dogs = Dog.all
    render "index.json.jb"
  end

  def create
    @dog = Dog.new(
      name: params[:name],
      age: params[:age],
      breed: params[:breed],
      size: params[:size],
    )
    #@dog.save
    render "show.json.jb"
  end
end
