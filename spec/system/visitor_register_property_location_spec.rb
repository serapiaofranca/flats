require 'rails_helper'
describe 'Visitor register property location' do
    it 'Created region successfully' do
        # Arrange

        # Act
        visit root_path
        click_on 'Cadastrar Região'
        fill_in "Região", with: "Litoral de Florianópolis" 
        click_on 'Cadastrar'

        # Assert
        expect(page).to have_content("Litoral de Florianópolis")        
    end

    it 'Created region failed' do
        # Arrange

        # Act
        visit root_path
        click_on 'Cadastrar Região'
        fill_in "Região", with: "" 
        click_on 'Cadastrar'

        # Assert
        expect(page).to have_content("Erro, Região precisa possuir um nome e não pode ser em branco")        
    end


end