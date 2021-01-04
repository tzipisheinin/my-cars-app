class DriversController < ApplicationController

    def index
      @drivers = Driver.all
      render json: @drivers 
    end

    def show
      @driver = Driver.find(params[:id])
      render json: { data: @driver, status: :ok, message: 'Success' }
    end
  
    def create
      @driver = Driver.new(car_params)
      if @driver.save
          render json: { status: :ok, message: 'Success' }
      else
          render json: { json: @driver.errors, status: :unprocessable_entity }
      end
    end

    def get_cars
      @driver = Driver.find(params[:id])
      @cars = @driver.cars
      render json: @cars,
      each_serializer: CarListSerializer ,scope: {
        driver_id: @driver.id,
      }
    end

    private
    def car_params
      params.require(:driver).permit(:id, :name, :email, :birth_date)
    end

end
