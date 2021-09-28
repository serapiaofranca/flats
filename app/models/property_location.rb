class PropertyLocation < ApplicationRecord

    validates :location, uniqueness: true , 
        presence: { message: 'Erro, Região precisa possuir um nome e não pode ser em branco' }
end
