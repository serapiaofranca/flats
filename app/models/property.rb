class Property < ApplicationRecord
    belongs_to :property_type
    belongs_to :property_location
    belongs_to :property_owner

    validates :title, :description, :rooms, :bathrooms, :daily_rate, presence: { message: 'não pode ficar em branco' }
    validates :rooms, :bathrooms, :daily_rate, numericality: { greater_than_or_equal_to: 1}
    #validates :title, :uniqueness {message: 'esse título já existe...'}
end
