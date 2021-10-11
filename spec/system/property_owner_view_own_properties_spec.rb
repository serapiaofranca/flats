require 'rails_helper'
describe 'Property Owner view own properties' do
    it 'using menu' do
        # Arrange
        property_owner = PropertyOwner.create!(email: 'user@property_owner.com', password: '123456')
    
        #Act 
        login_as property_owner, scope: :property_owner
        visit root_path
    
        #Assert
        expect(page).to have_link("Meus Imóveis", href: my_properties_properties_path)
    end

    it 'using menu' do
        # Arrange
        julia = PropertyOwner.create!(email: 'julia@property_owner.com', password: '123456')
        john = PropertyOwner.create!(email: 'john@property_owner.com', password: '123456')
       
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
                        daily_rate: 50,
                        property_owner: julia
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
        daily_rate: 180,
        property_owner: john
        })

        #Act 
        login_as julia, scope: :property_owner
        visit root_path
        click_on 'Meus Imóveis'        
    
        #Assert
        expect(page).to have_content("Casa com quintal em Copacabana")
        expect(page).not_to have_content("Cobertura em Manaus")
    end
end