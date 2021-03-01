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

  def show
    @dog = Dog.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @dog = Dog.find_by(id: params[:id])
    @dog.name = params[:name] || @dog.name
    @dog.age = params[:age] || @dog.age
    @dog.breed = params[:breed] || @dog.breed
    @dog.size = params[:size] || @dog.size
    #@dog.save
    render "show.json.jb"
  end

  def destroy
    @dog = Dog.find_by(id: params[:id])
    #@dog.destroy
    render json: { message: "you have deleted item successfully" }
  end
end
