class DriverListSerializer < ActiveModel::Serializer
  attributes :id, :name, :attached_at

  def attached_at
    CarDriver.find_by(car_id: scope[:car_id],
                      driver_id: self.object.id).created_at
  end
end
