class Team < ActiveRecord::Base
  validates :name, :description, presence: true
  belongs_to :user
  has_many :superheros, through: :nasas
  has_many :nasas, dependent: :destroy
end
