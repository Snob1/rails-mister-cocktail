class Cocktail < ApplicationRecord

  has_many :doses, dependent: :destroy
  has_many :ingredients, :through => :doses
  validates :name, presence: true, uniqueness: true
end

# validates :dose, dependent: :destroy
# do we need to has_many :ingredient?
