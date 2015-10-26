class Superhero < ActiveRecord::Base
  validates :name, :height, :bio, :image_url, presence: true
  has_many :teams, through: :nasas
  has_many :nasas, dependent: :destroy
end
