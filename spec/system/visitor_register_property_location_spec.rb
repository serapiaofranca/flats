require 'rails_helper'
describe 'Visitor register property location' do
    it 'Created region successfully' do
        # Arrange
        property_owner = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')

        # Act
        login_as property_owner, scope: :property_owner
        visit root_path
        click_on 'Cadastrar Região'
        fill_in "Região", with: "Litoral de Florianópolis" 
        click_on 'Salvar'

        # Assert
        expect(page).to have_content("Litoral de Florianópolis")        
    end

    it 'Created region failed' do
        # Arrange
        property_owner = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')

        # Act
        login_as property_owner, scope: :property_owner
        visit root_path
        click_on 'Cadastrar Região'
        fill_in "Região", with: "" 
        click_on 'Salvar'

        # Assert
        expect(page).to have_content("Erro, Região precisa possuir um nome e não pode ser em branco")        
    end

    it 'Created region failed, has already been taken ' do
        # Arrange
        property_owner = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')
        location = PropertyLocation.create!(location: "Litoral de Florianópolis")
       
        # Act
        login_as property_owner, scope: :property_owner
        visit root_path
        click_on 'Cadastrar Região'
        fill_in "Região", with: "Litoral de Florianópolis" 
        click_on 'Salvar'

        # Assert
        expect(page).to have_content("Erro, já existe região com esse nome")        
    end

end