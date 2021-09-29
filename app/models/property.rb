class Property < ApplicationRecord
    belongs_to :property_type

    validates :title, :description, :rooms, :bathrooms, :daily_rate, presence: { message: 'não pode ficar em branco' }
    #validates :title, :uniqueness {message: 'esse título já existe...'}
end
