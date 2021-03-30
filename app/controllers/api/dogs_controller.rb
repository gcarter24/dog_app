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
    if @dog.save
      render "show.json.jb"
    else
      render json: { errors: errors.full_messages }
    end
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
    if @dog.save
      render "show.json.jb"
    else
      render json: { errors: errors.full_messages }
    end
  end

  def destroy
    @dog = Dog.find_by(id: params[:id])
    @dog.destroy
    render json: { message: "Dog was succesfully removed" }
  end
end
