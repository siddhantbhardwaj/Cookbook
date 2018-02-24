class Recipie < ApplicationRecord
  ## ASSOCIATIONS ##
  belongs_to :user
  
  ## VALIDATIONS ##
  validates :title, :description, :ingredients, :instruction, presence: true
  
end
