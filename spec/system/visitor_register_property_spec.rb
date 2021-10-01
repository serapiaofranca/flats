require 'rails_helper'
describe 'Visitor register property' do
    it 'successfully' do
        #Arrange
        property_owner = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')
        property_type = PropertyType.create!(name: 'Casa')
        property_location = PropertyLocation.create!(location: 'Litoral de Santa Catarina')
        
        #Act
        login_as property_owner, scope: :property_owner
        visit root_path        
        click_on 'Cadastrar Imóvel'
        fill_in "Título",	with: "Casa em Florianópolis"         
        fill_in "Descrição", with: "Ótima casa perto da UFSC"        
        fill_in "Quartos",	with: "3" 
        fill_in "Banheiros",	with: "2" 
        fill_in "Diária",	with: 200
        select "Litoral de Santa Catarina", from: 'Região'
        select 'Casa',from: 'Tipo'
        check "Aceita Pets?"
        check "Possui vaga para estacionar?"
        click_on 'Enviar'

        #Asserty
        expect(page).to have_content("Casa em Florianópolis")
        expect(page).to have_content("Litoral de Santa Catarina")
        expect(page).to have_content("Ótima casa perto da UFSC")
        expect(page).to have_content("Quartos: 3")
        expect(page).to have_content("Banheiros: 2")
        expect(page).to have_content("Aceita Pets: sim")
        expect(page).to have_content("Estacionamento: sim")
        expect(page).to have_content("Diária: R$ 200,00")
    end

    it 'and must fill all fields' do
        property_owner = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')

        login_as property_owner, scope: :property_owner
        visit root_path
        click_on 'Cadastrar Imóvel'
        click_on 'Enviar'
        
        expect(page).to have_content('não pode ficar em branco', count: 5)
        expect(Property.count).to eq(0)
    end

    # TODO: verificar que rooms, daily_rate, bathrooms são maiores que zero
    
end