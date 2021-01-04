class CarsController < ApplicationController

  def index
    @cars = Car.all
    render json: @cars 
  end

  def show
    @car = Car.find(params[:id])
    render json: { data: @car, status: :ok, message: 'Success' }
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      render json: { status: :ok, message: 'Success' }
    else
      render json: { json: @car.errors, status: :unprocessable_entity }
    end
  end

  def get_drivers
    @car = Car.find(params[:id])
    @drivers = @car.drivers
    render json: @drivers,
      each_serializer: DriverListSerializer ,scope: {
        car_id: @car.id,
      }
  end

  private
  def car_params
    params.require(:car).permit(:id, :title, :car_type, :color)
  end
end
