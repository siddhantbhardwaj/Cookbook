class Recipie < ApplicationRecord
  ## ASSOCIATIONS ##
  belongs_to :user
  
  ## VALIDATIONS ##
  validates :title, :description, :ingredients, :instruction, :link, presence: true
  validates :link, url: true
  
end
