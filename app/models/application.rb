class Application < ActiveRecord::Base

  validates :name, length: { maximum: 60 }, presence: true
  validates :description, length: { maximum: 300 }, presence: true

  belongs_to :user
  has_many :pages, dependent: :destroy

end
