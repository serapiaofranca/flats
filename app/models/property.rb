class Property < ApplicationRecord
    validates :title, :description, :rooms, :bathrooms, :daily_rate, presence: { message: 'não pode ficar em branco' }
    #validates :title, :uniqueness {'esse título já existe...'}
end
