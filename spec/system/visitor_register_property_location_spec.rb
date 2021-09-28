require 'rails_helper'
describe 'Visitor register property location' do
    it 'Created region successfully' do
        # Arrange

        # Act
        visit root_path
        click_on 'Cadastrar Região'
        fill_in "Região",	with: "Litoral de Florianópolis" 
        click_on 'Cadastrar'

        # Assert
        expect(page).to have_content("Litoral de Florianópolis")        
    end
end