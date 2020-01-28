class Rayon < ApplicationRecord
  validates :name, uniqueness: true
end
