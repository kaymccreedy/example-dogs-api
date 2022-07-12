class DogsController < ApplicationController

  def index
    dogs = Dog.all
    render json: dogs.as_json
  end

  def show
    dog = Dog.find_by(id: params["id"])
    render json: dog.as_json
  end

  def create
    dog = Dog.new(
      name: params["name"],
      age: params["age"],
      breed: params["breed"]
    )
    dog.save
    render json: dog.as_json
  end

  def update
    dog = Dog.find_by(id: params["id"])
    dog.name = params["name"] || dog.name,
    dog.age = params["age"] || dog.age,
    dog.breed = params["breed"] || dog.breed
    render json: dog.as_json
  end

  def destroy
    dog = Dog.find_by(id: params["id"])
    dog.destroy
    render json: { dog: "destroyed" }
  end

end
