require 'rails_helper'

describe 'Visitor visit home_page' do
  it 'and view propierties' do
    #Arrange => Preparar (os dados)
    casa = PropertyType.create!(name: 'Casa')
    rio = PropertyLocation.create!(location: 'Litoral Rio de Janeiro')
    Property.create!({ title: "Casa com quintal em Copacabana",
                        description:"Excelente localização, com 2 vagas em garagem coberta" ,
                        property_location: rio, 
                        property_type: casa,
                        rooms: 3, bathrooms: 2, daily_rate: 'R$ 180,00'
                      })
    apartamento = PropertyType.create!(name: 'Apartamento')
    amazonia = PropertyLocation.create!(location: 'Amazonia área urbana')
    Property.create!({ title: "Cobertura em Manaus",
                        description:"Area de 300m2, com area de churrasco e sauna privativa",
                        property_location: amazonia,  
                        property_type: apartamento,
                        rooms: 5, bathrooms: 2, daily_rate: 'R$ 100,00'
                      })
      #Act => Agir (executar a funcionalidade)
    visit root_path
    #Assert => Garantir (que algo aconteceu ou Não)
    expect(page).to have_text("Casa com quintal em Copacabana")
    expect(page).to have_text("Quartos: 3")
    expect(page).to have_text("Excelente localização, com 2 vagas em garagem coberta")    
    expect(page).to have_text('Litoral Rio de Janeiro')
    expect(page).to have_text("Cobertura em Manaus")
    expect(page).to have_text("Area de 300m2, com area de churrasco e sauna privativa")
    expect(page).to have_text("Quartos: 5")
    expect(page).to have_text("Amazonia área urbana")
  end

  it 'and theres no property available' do
      #Arrange => preparar os dados

      #Act -> Agir (executar a funcionalidade)
    visit root_path

      #Assert => Garantir (que algo aconteceu ou NAO aconteceu)
    expect(page).to have_text("Nenhum imóvel disponível")
  end

  it 'and view propierties details' do
      #Arrange => Preparar (os dados)
    rio = PropertyLocation.create!(location: 'Litoral Rio de Janeiro')
    casa = PropertyType.create!(name: 'Casa')
    Property.create!({ title: "Casa com quintal em Copacabana",
                        description:"Excelente localização, com 2 vagas em garagem coberta" ,
                        rooms: 3,
                        property_location: rio,
                        property_type: casa,
                        parking_slot: true, 
                        bathrooms: 2, 
                        pets: true,
                        daily_rate: 50
                      })
    apartamento = PropertyType.create!(name: 'Apartamento')
    amazonia = PropertyLocation.create!(location: 'Amazonia área urbana')
    Property.create!({ title: "Cobertura em Manaus",
        description:"Area de 300m2, com area de churrasco e sauna privativa" ,
        rooms: 5,
        property_location: amazonia,
        property_type: apartamento,
        parking_slot: true, 
        bathrooms: 3, 
        pets: true,
        daily_rate: 120
    })

      #Act => Agir (executar a funcionalidade)
    visit root_path
    click_on 'Casa com quintal em Copacabana'

      #Assert => Garantir (que algo aconteceu ou Não)
    expect(page).to have_text("Casa com quintal em Copacabana")
    expect(page).not_to have_text("Area de 300m2, com area de churrasco e sauna privativa")      
    expect(page).to have_text("Excelente localização, com 2 vagas em garagem coberta")
    expect(page).to have_text("Tipo: Casa")
    expect(page).to have_text("Quartos: 3")
    expect(page).to have_text("Banheiros: 2")
    expect(page).to have_text("Aceita Pets: sim")
    expect(page).to have_text("Estacionamento: sim")
    expect(page).to have_text("Diária: R$ 50,00")
  end

  it 'and view propierties details and return to home page' do
    #Arrange => Preparar (os dados)
    rio = PropertyLocation.create!(location: 'Litoral Rio de Janeiro')
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
    amazonia = PropertyLocation.create!(location: 'Amazonia área urbana')
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
    
    #Act => Agir (executar a funcionalidade)
    visit root_path
    click_on 'Casa com quintal em Copacabana'
    click_on 'Voltar'

    #Assert => Garantir (que algo aconteceu ou Não)
    expect(current_path).to eq(root_path)
    expect(page).to have_text("Casa com quintal em Copacabana")
    
    expect(page).to have_text("Cobertura em Manaus")
  end

end