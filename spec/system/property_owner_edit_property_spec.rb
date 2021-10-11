require 'rails_helper'

describe 'Property owner edit property' do
    it 'not access page to edit' do
        # Arrange  
        julia = PropertyOwner.create!(email: 'julia@owner.com', password: '123456')
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
        daily_rate: 180,
        property_owner: julia
        })

        # Act        
        visit root_path
        click_on 'Cobertura em Manaus'        

        # Assert
        expect(page).not_to have_link('Editar')  
        expect(page).to have_link('Entrar')                                
    end

    it 'access page to edit' do
        # Arrange
        property_owner = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')
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
        daily_rate: 180,
        property_owner: property_owner
        })

        # Act
        login_as property_owner, scope: :property_owner
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
        property_owner = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')
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
            daily_rate: 180,
            property_owner: property_owner
        })

        # Act
        login_as property_owner, scope: :property_owner
        visit root_path
        click_on 'Cobertura em Manaus'
        click_on 'Editar'
        fill_in "Diária", with: 200
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
        property_owner = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')
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
        daily_rate: 180,
        property_owner: property_owner
        })

        # Act
        login_as property_owner, scope: :property_owner
        visit root_path
        click_on 'Cobertura em Manaus'
        click_on 'Editar'
        fill_in "Diária", with: ''
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
        expect(page).to have_content('Editar')        
        expect(page).to have_content('Voltar')        
    end
end