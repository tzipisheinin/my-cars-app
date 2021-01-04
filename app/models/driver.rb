class Driver < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
                                              message: "%{value} is wrong email address" }
  has_many :car_drivers
  has_many :cars, :through => :car_drivers
end
