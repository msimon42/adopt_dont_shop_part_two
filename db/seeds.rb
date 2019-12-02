# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Shelter.destroy_all
Pet.destroy_all

shelter_1 = Shelter.create(
  name: 'Shelter of Dog',
  address: '123 main street',
  city: 'Denver',
  state: 'CO',
  zip: '80234'
)

shelter_2 = Shelter.create(
  name: 'Animal Center',
  address: '123 Way St',
  city: 'Denver',
  state: 'CO',
  zip: '80444'
)

shelter_3 = Shelter.create(
  name: 'DogLand',
  address: '123 Broadway',
  city: 'Denver',
  state: 'CO',
  zip: '80848'
)

shelter_4 = Shelter.create(
  name: 'Center of Pets',
  address: '123 Colfax',
  city: 'Denver',
  state: 'CO',
  zip: '80218'
)

shelter_5 = Shelter.create(
  name: 'Animal Shelter',
  address: '123 Denver Street',
  city: 'Denver',
  state: 'CO',
  zip: '80244'
)

pet_2 = Pet.create(
  shelter_id: shelter_1.id,
  image: 'https://i.redd.it/pfk7qbbti1041.jpg',
  name: 'Louise',
  description: 'Bichon Frise',
  approx_age: 3,
  sex: 'Female',
  adoptable?: true

  )

  pet_3 = Pet.create(
    shelter_id: shelter_2.id,
    image: 'https://i.redd.it/hfnbnni572041.jpg',
    name: 'Snowball',
    description: 'Black Cat',
    approx_age: 3,
    sex: 'male',
    adoptable?: true

    )

    pet_4 = Pet.create(
      shelter_id: shelter_3.id,
      image: 'https://i.redd.it/zb81apf641041.jpg',
      name: 'Kitty',
      description: 'Grey Cat',
      approx_age: 4,
      sex: 'male',
      adoptable?: true

      )


      pet_5 = Pet.create(
        shelter_id: shelter_4.id,
        image: 'https://i.redd.it/x8bs5trjk2041.jpg',
        name: 'Spot',
        description: 'Golden Retriver',
        approx_age: 3,
        sex: 'male',
        adoptable?: true

        )


        pet_6 = Pet.create(
          shelter_id: shelter_5.id,
          image: 'https://i.redd.it/am0f8jtop2041.jpg',
          name: 'Lucius',
          description: 'Spotted Dog',
          approx_age: 1,
          sex: 'male',
          adoptable?: true

          )

          pet_7 = Pet.create(
            shelter_id: shelter_1.id,
            image: 'https://i.imgur.com/iKqs301.jpg',
            name: 'Quackers',
            description: 'Duckling',
            approx_age: 5,
            sex: 'female',
            adoptable?: true

            )
            pet_8 = Pet.create(
              shelter_id: shelter_2.id,
              image: 'https://i.redd.it/rg5tbcotf4041.jpg',
              name: 'Gucci',
              description: 'Golden Retriver',
              approx_age: 4,
              sex: 'female',
              adoptable?: true

              )
              pet_9 = Pet.create(
                shelter_id: shelter_3.id,
                image: 'https://i.redd.it/znir8eora4041.jpg',
                name: 'Meatloaf',
                description: 'Brown Dog',
                approx_age: 5,
                sex: 'male',
                adoptable?: true

                )
                pet_10 = Pet.create(
                  shelter_id: shelter_4.id,
                  image: 'https://i.redd.it/5g33a3qlz1041.jpg',
                  name: 'Scruffert',
                  description: 'White Cat',
                  approx_age: 3,
                  sex: 'male',
                  adoptable?: true

                  )
                  pet_11 = Pet.create(
                    shelter_id: shelter_5.id,
                    image: 'https://i.redd.it/tev56zd14zz31.png',
                    name: 'Koko',
                    description: 'Golden Retriver',
                    approx_age: 1,
                    sex: 'male',
                    adoptable?: true

                    )
                    pet_12 = Pet.create(
                      shelter_id: shelter_1.id,
                      image: 'https://i.redd.it/xhkr5b0sc3041.jpg',
                      name: 'Doge',
                      description: 'Doge',
                      approx_age: 6,
                      sex: 'male',
                      adoptable?: true

                      )
                      pet_13 = Pet.create(
                        shelter_id: shelter_2.id,
                        image: 'https://i.redd.it/fxekew520yz31.jpg',
                        name: 'Wookie',
                        description: 'Brown Mix',
                        approx_age: 2,
                        sex: 'female',
                        adoptable?: true

                        )
                        pet_14 = Pet.create(
                          shelter_id: shelter_3.id,
                          image: 'https://i.redd.it/k0x3a78eb2041.jpg',
                          name: 'Fang',
                          description: 'A cat',
                          approx_age: 3,
                          sex: 'male',
                          adoptable?: true

                          )
                          pet_15 = Pet.create(
                            shelter_id: shelter_4.id,
                            image: 'https://i.redd.it/fnqpdh1vp4041.jpg',
                            name: 'Popo',
                            description: 'Large brown dog',
                            approx_age: 2,
                            sex: 'male',
                            adoptable?: true

                            )
                            pet_16 = Pet.create(
                              shelter_id: shelter_5.id,
                              image: 'https://i.redd.it/t4tnbj2vohx31.jpg',
                              name: 'Oogie',
                              description: 'Orangutan',
                              approx_age: 3,
                              sex: 'male',
                              adoptable?: true)
