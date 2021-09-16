require 'rails_helper'

describe 'Visitor visit home_page' do
    it 'and view propierties' do
        #Arrange => Preparar (os dados)
        Property.create({ title: "Casa com quintal em Copacabana",
                          description:"Excelente localização, com 2 vagas em garagem coberta" ,
                          rooms: 3
                        })
        Property.create({ title: "Cobertura em Manaus",
                          description:"Area de 300m2, com area de churrasco e sauna privativa" ,
                          rooms: 5
                        })

        #Act => Agir (executar a funcionalidade)
        visit root_path

        #Assert => Garantir (que algo aconteceu ou Não)
        expect(page).to have_text("Casa com quintal em Copacabana")
        expect(page).to have_text("Excelente localização, com 2 vagas em garagem coberta")
        expect(page).to have_text("Quartos: 3")
        expect(page).to have_text("Cobertura em Manaus")
        expect(page).to have_text("Area de 300m2, com area de churrasco e sauna privativa")
        expect(page).to have_text("Quartos: 5")
    end
end