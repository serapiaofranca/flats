    casa = PropertyType.create!(name: 'Casa')
    Property.create!({ title: "Casa com quintal em Copacabana",
                      description:"Excelente localização, com 2 vagas em garagem coberta" ,
                      property_type: casa,
                      rooms: 3,
                      parking_slot: true, 
                      bathrooms: 2, 
                      pets: true,
                      daily_rate: 50
                    })

    apartamento = PropertyType.create!(name: 'Apartamento')
    Property.create({ title: "Cobertura em Manaus",
      description:"Area de 300m2, com area de churrasco e sauna privativa" ,
      property_type: apartamento,
      rooms: 5,
      parking_slot: true, 
      bathrooms: 3, 
      pets: true,
      daily_rate: 180
    })
    