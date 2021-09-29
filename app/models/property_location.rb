class PropertyLocation < ApplicationRecord
    has_many :properties

    validates :location, uniqueness: {message: 'Erro, já existe região com esse nome'} , 
        presence: { message: 'Erro, Região precisa possuir um nome e não pode ser em branco' }
end
