class CarListSerializer < ActiveModel::Serializer
  attributes :id, :name, :attached_at

  def name
    self.object.title + '_' + self.object.car_type + '_' + self.object.color 
  end

  def attached_at
    CarDriver.find_by(car_id: self.object.id,
                      driver_id: scope[:driver_id]).created_at
  end
end