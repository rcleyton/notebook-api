namespace :dev do
  desc "Configure development environment"
  task setup: :environment do
    puts "Resetando BD..."
    %x(rails db:drop db:create db:migrate)

    puts "Cadastrando tipos de contato..."
    kinds = %w(Amigo Comercial Conhecido)
    kinds.each do |kind| 
      Kind.create!(
        description: kind)
    end
    puts "Tipos de contato cadastrado com sucesso!"

    puts "Cadastrando contatos..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts "Contatos cadastrados com sucesso"
    
    puts "Cadastrando telefones..."
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(contact_id: contact.id,
                              number: Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end
    puts "Telefones cadastrados com sucesso"

    puts "Cadastrando endereços.."
      Contact.all.each do |contact|
        address = Address.create!(street: Faker::Address.street_address,
                                city: Faker::Address.city,
                                contact: contact)
      end
    puts "Endereços cadastrados com sucesso"
  end
end
