class Application < ActiveRecord::Base

  validates :name, length: { maximum: 60 }, presence: true
  validates :description, length: { maximum: 300 }, presence: true

  has_many :pages

end
