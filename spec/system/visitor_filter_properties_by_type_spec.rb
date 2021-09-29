require 'rails_helper'

describe 'Visitor filter properties by type' do

    it 'using links on nav bar' do
        # Arrange
        PropertyType.create!(name: 'Apartamento')
        PropertyType.create!(name: 'Casa')
        PropertyType.create!(name: 'Sítio')    

        # Act
        visit root_path

        # Assert
        expect(page).to have_link('Apartamento')
        expect(page).to have_link('Casa')
        expect(page).to have_link('Sítio')
    end
    
    it 'sussessfully' do
        #Arrange => Preparar (os dados)
        rio =  PropertyLocation.create!(location: 'Litoral do Rio de Janeiro')
        casa = PropertyType.create!(name: 'Casa')
        Property.create!({ title: "Casa com quintal em Copacabana",
                        description:"Excelente localização, com 2 vagas em garagem coberta" ,
                        property_location: rio,
                        property_type: casa,
                        rooms: 3,
                        parking_slot: true, 
                        bathrooms: 2, 
                        pets: true,
                        daily_rate: 50
                        })
        apartamento = PropertyType.create!(name: 'Apartamento')
        amazonia =  PropertyLocation.create!(location: 'Amazônia capital')
        Property.create({ title: "Cobertura em Manaus",
        description:"Area de 300m2, com area de churrasco e sauna privativa" ,
        property_location: amazonia,
        property_type: apartamento,
        rooms: 5,
        parking_slot: true, 
        bathrooms: 3, 
        pets: true,
        daily_rate: 180
        })

        # Act
        visit root_path
        click_on 'Casa' 

        # Assert
        expect(page).to have_css('h1', text: 'Imóveis do Tipo Casa')
        expect(page).to have_content('Litoral do Rio de Janeiro')
        expect(page).to have_content('Casa com quintal em Copacabana')
        expect(page).not_to have_content('Cobertura em Manaus')
        
    end
end