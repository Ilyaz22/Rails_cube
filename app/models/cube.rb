class Cube < ApplicationRecord
  validates :size, :color, :weight, :material, presence: true
end
