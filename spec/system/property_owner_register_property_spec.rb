require 'rails_helper'
describe 'Property owner register property' do
    it 'must be signed in' do

        #Act 
        visit root_path

        # Assert
        expect(page).not_to have_link('Cadastrar Imóvel')
    end

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

        #Assert
        expect(page).to have_content("Casa em Florianópolis")
        expect(page).to have_content("Litoral de Santa Catarina")
        expect(page).to have_content("Ótima casa perto da UFSC")
        expect(page).to have_content("Quartos: 3")
        expect(page).to have_content("Banheiros: 2")
        expect(page).to have_content("Aceita Pets: sim")
        expect(page).to have_content("Estacionamento: sim")
        expect(page).to have_content("Diária: R$ 200,00")
        expect(page).to have_content("Imóvel de: jane@doe.com.br")
    end

    it 'and must fill all fields' do
        # Arrange
        property_owner = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')

        # Act
        login_as property_owner, scope: :property_owner
        visit root_path
        click_on 'Cadastrar Imóvel'
        click_on 'Enviar'
        
        # Assert
        expect(page).to have_content('não pode ficar em branco', count: 5)
        expect(Property.count).to eq(0)
    end

    it 'error' do
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
        fill_in "Quartos",	with: "0" 
        fill_in "Banheiros",	with: "0" 
        fill_in "Diária",	with: 0
        select "Litoral de Santa Catarina", from: 'Região'
        select 'Casa',from: 'Tipo'
        check "Aceita Pets?"
        check "Possui vaga para estacionar?"

        click_on 'Enviar'

        #Assert
        expect(page).to have_content('deve ser maior ou igual a 1', count: 3)
        expect(page).to have_content('jane@doe.com.br')
        expect(page).to have_content("Título")
        expect(page).to have_content("Região")
        expect(page).to have_content("Descrição")
        expect(page).to have_content("Quartos")
        expect(page).to have_content("Banheiros")
        expect(page).to have_content("Aceita Pets?")
        expect(page).to have_content("Possui vaga para estacionar?")
        expect(page).to have_content("Diária")
        expect(page).to have_link("Voltar")
    end       
end