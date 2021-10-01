require 'rails_helper'

describe 'visitor edit property' do
    it 'access page to edit' do
        # Arrange
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
        click_on 'Cobertura em Manaus'        
        click_on 'Editar'

        # Assert
        expect(page).to have_content('Editar Propriedade')  
        expect(page).to have_content('Título')
        expect(page).to have_content('Descrição')        
        expect(page).to have_content('Tipo')        
        expect(page).to have_content('Quartos')        
        expect(page).to have_content('Aceita Pets?')        
        expect(page).to have_content('Possui vaga para estacionar?')                 
        expect(page).to have_content('Voltar')        
    end

    it 'Successfully edit' do
        # Arrange
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
        click_on 'Cobertura em Manaus'
        click_on 'Editar'
        fill_in "daily_rate", with: 'R$ 200,00'
        click_on 'Enviar'

        # Assert
        expect(page).to have_content("Cobertura em Manaus") 
        expect(page).to have_content("Area de 300m2, com area de churrasco e sauna privativa")        
        expect(page).to have_content('Amazônia capital')        
        expect(page).to have_content('Apartamento')
        expect(page).to have_content('R$ 200,00')              
        expect(page).to have_content('Editar')        
        expect(page).to have_content('Voltar')              
    end

    it 'Error on edit' do
        # Arrange
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
        click_on 'Cobertura em Manaus'
        click_on 'Editar'
        fill_in "daily_rate", with: ''
        click_on 'Enviar'

        # Assert
        expect(page).to have_content('não pode ficar em branco')  
        expect(page).to have_content('Editar Propriedade')  
        expect(page).to have_content('Título')
        expect(page).to have_content('Descrição')        
        expect(page).to have_content('Tipo')        
        expect(page).to have_content('Quartos')        
        expect(page).to have_content('Aceita Pets?')        
        expect(page).to have_content('Possui vaga para estacionar?')        
        expect(page).to have_content('Enviar')        
        expect(page).to have_content('Voltar')        
    end
end