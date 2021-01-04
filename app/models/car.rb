class Car < ApplicationRecord
    validates :title, presence: true
    validates :color, inclusion: { in: ["blue", "yellow", "red"],
                                   message: "%{value} is not a valid color" }
end
