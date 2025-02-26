namespace :import do
  desc "Import books from JSON data and associate them with countries and authors"
  task books: :environment do
    require 'json'

    books_data = [
      {
        "sku": "c5b7089e-1e89-4940-b5fc-58e12912e21e",
        "title": "Espadas & Bruxas",
        "author": "Esteban Maroto",
        "published_at": "2017",
        "country": "Espanha"
      },
      {
        "sku": "cae5f813-c44f-4431-936b-8ff3c51986c6",
        "title": "Cannon",
        "author": "Wallace Wood",
        "published_at": "2017",
        "country": "Estados Unidos"
      },
      {
        "sku": "d7b22c83-3900-4183-b2fc-9c7398e07c5b",
        "title": "Moby Dick",
        "author": "Christophe Chabouté",
        "published_at": "2017",
        "country": "França"
      },
      {
        "sku": "14e18210-2586-4f56-9d91-41c7b8f1e4ec",
        "title": "Beasts of Burden: Rituais Animais",
        "author": "Evan Dorkin e Jill Thompson",
        "published_at": "2017",
        "country": "Estados Unidos"
      },
      {
        "sku": "9b4db65d-6747-4578-82a6-4fc70efab1e0",
        "title": "Um Pequeno Assassinato",
        "author": "Alan Moore e Oscar Zárate",
        "published_at": "2017",
        "country": "Inglaterra"
      },
      {
        "sku": "b7f881ec-a98b-4742-9676-b56f2d6a16af",
        "title": "Conan: o Bárbaro - volume 1 (Livro)",
        "author": "Robert E. Howard",
        "published_at": "2017",
        "country": "Estados Unidos"
      },
      {
        "sku": "ef56271f-8051-48d2-a285-e117f698ba9a",
        "title": "O Guia Definitivo da Espada & Feitiçaria (E-book)",
        "author": "Alexandre Callari, Bruno Zago e Daniel Lopes",
        "published_at": "2017",
        "country": "Brasil"
      },
      {
        "sku": "6d45ac72-b062-4c36-ae21-f78ff7ffa3f5",
        "title": "Marada: A Mulher-Lobo",
        "author": "Chris Claremont e John Bolton",
        "published_at": "2018",
        "country": "Estados Unidos"
      },
      {
        "sku": "876377fe-5717-4bfe-b2e7-63a8c974472b",
        "title": "Conto de Areia",
        "author": "Jim Henson, Jerry Juhl e Ramón K. Pérez",
        "published_at": "2018",
        "country": "Estados Unidos"
      },
      {
        "sku": "780ba042-858a-407f-93bb-a1c2f23cfce0",
        "title": "Guardiões do Louvre",
        "author": "Jiro Taniguchi",
        "published_at": "2018",
        "country": "Japão"
      },
      {
        "sku": "69d851ea-749d-4fea-899d-9cfe9ccd7c4f",
        "title": "Um Pedaço de Madeira e Aço",
        "author": "Christophe Chabouté",
        "published_at": "2018",
        "country": "França"
      },
      {
        "sku": "3f181851-dad6-4e80-a881-7de753087d05",
        "title": "A Arte de Charlie Chan Hock Chye",
        "author": "Sonny Liew",
        "published_at": "2018",
        "country": "Cingapura"
      },
      {
        "sku": "eae3b390-06c1-4e85-95cd-688ca08266a9",
        "title": "Blood: Uma História de Sangue",
        "author": "J. M. DeMatteis e Kent Williams",
        "published_at": "2018",
        "country": "Estados Unidos"
      },
      {
        "sku": "a5e1bf7f-767b-4ef9-b00c-0f1e0563c39c",
        "title": "Conan: o Bárbaro - volume 2 (Livro)",
        "author": "Robert E. Howard",
        "published_at": "2018",
        "country": "Estados Unidos"
      },
      {
        "sku": "b3279719-695f-4058-abc8-9d54e44616f7",
        "title": "O Anel do Nibelungo",
        "author": "P. Craig Russell",
        "published_at": "2018",
        "country": "Estados Unidos"
      },
      {
        "sku": "b7298da7-9568-40ad-a981-62ef56f23c1d",
        "title": "Cinco por Infinito",
        "author": "Esteban Maroto",
        "published_at": "2018",
        "country": "Espanha"
      },
      {
        "sku": "839e666d-c38d-468e-96e1-8545a736a5f7",
        "title": "Beowulf",
        "author": "Santiago García e David Rubín",
        "published_at": "2018",
        "country": "Espanha"
      },
      {
        "sku": "7eed841d-864b-4eeb-8288-6a4648a3c0e9",
        "title": "O Relatório de Brodeck",
        "author": "Manu Larcenet",
        "published_at": "2018",
        "country": "França"
      },
      {
        "sku": "a184a73b-3b23-44e4-8235-214cbee7b2e2",
        "title": "Dragão Negro",
        "author": "Chris Claremont e John Bolton",
        "published_at": "2019",
        "country": "Estados Unidos"
      },
      {
        "sku": "cf5b7b90-2b4d-4765-9c84-40c5b3ebaf20",
        "title": "Lone Sloane",
        "author": "Philippe Druillet",
        "published_at": "2019",
        "country": "França"
      },
      {
        "sku": "27e44a61-8df2-43f5-9acb-fb2ecb522d82",
        "title": "Virgem Depois dos 30",
        "author": "Atsuhiko Nakamura e Bargain Sakurai",
        "published_at": "2019",
        "country": "Japão"
      },
      {
        "sku": "5740fd95-b9cb-4d03-91a0-e6de0a684030",
        "title": "Beasts of Burden: Cães Sábios e Homens Nefastos",
        "author": "Evan Dorkin e Benjamin Dewey",
        "published_at": "2019",
        "country": "Estados Unidos"
      },
      {
        "sku": "3aee06b6-d4f5-4a06-8459-0fdc7abbb2a0",
        "title": "Druuna - volume 1",
        "author": "Paolo Eleuteri Serpieri",
        "published_at": "2019",
        "country": "Itália"
      },
      {
        "sku": "556cdb66-b23c-4e98-9335-9dbb5be71ff6",
        "title": "Os Mitos de Cthulhu",
        "author": "Esteban Maroto",
        "published_at": "2019",
        "country": "Espanha"
      },
      {
        "sku": "84257af7-3dbf-45d6-947f-80a8159a6027",
        "title": "O Ninguém",
        "author": "Jeff Lemire",
        "published_at": "2019",
        "country": "Estados Unidos"
      },
      {
        "sku": "9d3e9a3e-6505-4e29-96b6-6d38f87c1cf7",
        "title": "Solitário",
        "author": "Christophe Chabouté",
        "published_at": "2019",
        "country": "França"
      },
      {
        "sku": "a3f29c72-21b4-44b4-985f-3b4f79af1973",
        "title": "Jane",
        "author": "Aline McKenna e Ramon K. Perez",
        "published_at": "2019",
        "country": "Canadá"
      },
      {
        "sku": "a474f6ed-c572-4f8a-97be-bb9ef1e6ff75",
        "title": "Druuna - volume 2",
        "author": "Paolo Eleuteri Serpieri",
        "published_at": "2019",
        "country": "Itália"
      },
      {
        "sku": "8f75bb45-2df9-4f78-b6e0-06e5b8e87be8",
        "title": "Conan: o Bárbaro - volume 3",
        "author": "Robert E. Howard",
        "published_at": "2019",
        "country": "Estados Unidos"
      },
      {
        "sku": "292cba50-96a0-4e7c-bfbf-041b578d6eb7",
        "title": "O Preço da Desonra",
        "author": "Hiroshi Hirata",
        "published_at": "2019",
        "country": "Japão"
      },
      {
        "sku": "a381f0f1-f81d-486f-92db-8b8f4edfeea7",
        "title": "Luz que Fenece",
        "author": "Barbara Baldi",
        "published_at": "2019",
        "country": "Itália"
      },
      {
        "sku": "769dc525-faa3-4729-9e2b-bc6be7ab35d5",
        "title": "O Último Voo das Borboletas",
        "author": "Kan Takahama",
        "published_at": "2019",
        "country": "Japão"
      },
      {
        "sku": "4d72e850-8723-4538-a62a-5e7dfbfd708c",
        "title": "A Arte de Charlie Chan Hock Chye",
        "author": "Sonny Liew",
        "published_at": "2019",
        "country": "Singapura"
      },
      {
        "sku": "d564e92d-6c84-4c64-bd38-3912ea9a0ad9",
        "title": "Druuna - volume 3",
        "author": "Paolo Eleuteri Serpieri",
        "published_at": "2019",
        "country": "Itália"
      },
      {
        "sku": "948aba3c-2346-49b5-90b9-3373a4dd255b",
        "title": "A Grande Odalisca",
        "author": "Bastien Vivès, Florent Ruppert e Jérôme Mulot",
        "published_at": "2019",
        "country": "França"
      },
      {
        "sku": "bb9d0c30-91f3-4d67-9d12-e8e2dbe8722a",
        "title": "A Floresta das Árvores Retorcidas",
        "author": "Alexandre Callari e Doug Firmino",
        "published_at": "2019",
        "country": "Brasil"
      },
      {
        "sku": "4db593c8-1f0d-4f35-8010-6ae35356e47b",
        "title": "Sob o Solo",
        "author": "Bianca Pinheiro e Greg Stella",
        "published_at": "2019",
        "country": "Brasil"
      },
      {
        "sku": "621bb3ea-3f43-47eb-86b8-5e3742fc5f43",
        "title": "Roseira, Medalha, Engenho e Outras Histórias",
        "author": "Jefferson Costa",
        "published_at": "2019",
        "country": "Brasil"
      },
      {
        "sku": "caef5a43-86fa-4a0e-9755-7bd9ff55da4d",
        "title": "Gastaria Tudo com Pizza",
        "author": "Pedro Duarte",
        "published_at": "2019",
        "country": "Brasil"
      },
      {
        "sku": "68a1f947-d7b2-4a7b-b54d-f2aa72a8d4a6",
        "title": "Moonshadow",
        "author": "J. M. DeMatteis e Jon J. Muth",
        "published_at": "2019",
        "country": "Estados Unidos"
      },
      {
        "sku": "a184a73b-3b23-44e4-8235-214cbee7b2e2",
        "title": "Dragão Negro",
        "author": "Chris Claremont e John Bolton",
        "published_at": "2019",
        "country": "Estados Unidos"
      },
      {
        "sku": "cf5b7b90-2b4d-4765-9c84-40c5b3ebaf20",
        "title": "Lone Sloane",
        "author": "Philippe Druillet",
        "published_at": "2019",
        "country": "França"
      },
      {
        "sku": "27e44a61-8df2-43f5-9acb-fb2ecb522d82",
        "title": "Virgem Depois dos 30",
        "author": "Atsuhiko Nakamura e Bargain Sakurai",
        "published_at": "2019",
        "country": "Japão"
      },
      {
        "sku": "5740fd95-b9cb-4d03-91a0-e6de0a684030",
        "title": "Beasts of Burden: Cães Sábios e Homens Nefastos",
        "author": "Evan Dorkin e Benjamin Dewey",
        "published_at": "2019",
        "country": "Estados Unidos"
      },
      {
        "sku": "3aee06b6-d4f5-4a06-8459-0fdc7abbb2a0",
        "title": "Druuna - volume 1",
        "author": "Paolo Eleuteri Serpieri",
        "published_at": "2019",
        "country": "Itália"
      },
      {
        "sku": "556cdb66-b23c-4e98-9335-9dbb5be71ff6",
        "title": "Os Mitos de Cthulhu",
        "author": "Esteban Maroto",
        "published_at": "2019",
        "country": "Espanha"
      },
      {
        "sku": "84257af7-3dbf-45d6-947f-80a8159a6027",
        "title": "O Ninguém",
        "author": "Jeff Lemire",
        "published_at": "2019",
        "country": "Estados Unidos"
      },
      {
        "sku": "9d3e9a3e-6505-4e29-96b6-6d38f87c1cf7",
        "title": "Solitário",
        "author": "Christophe Chabouté",
        "published_at": "2019",
        "country": "França"
      },
      {
        "sku": "a3f29c72-21b4-44b4-985f-3b4f79af1973",
        "title": "Jane",
        "author": "Aline McKenna e Ramon K. Perez",
        "published_at": "2019",
        "country": "Canadá"
      },
      {
        "sku": "a474f6ed-c572-4f8a-97be-bb9ef1e6ff75",
        "title": "Druuna - volume 2",
        "author": "Paolo Eleuteri Serpieri",
        "published_at": "2019",
        "country": "Itália"
      },
      {
        "sku": "8f75bb45-2df9-4f78-b6e0-06e5b8e87be8",
        "title": "Conan: o Bárbaro - volume 3",
        "author": "Robert E. Howard",
        "published_at": "2019",
        "country": "Estados Unidos"
      },
      {
        "sku": "292cba50-96a0-4e7c-bfbf-041b578d6eb7",
        "title": "O Preço da Desonra",
        "author": "Hiroshi Hirata",
        "published_at": "2019",
        "country": "Japão"
      },
      {
        "sku": "a381f0f1-f81d-486f-92db-8b8f4edfeea7",
        "title": "Luz que Fenece",
        "author": "Barbara Baldi",
        "published_at": "2019",
        "country": "Itália"
      },
      {
        "sku": "769dc525-faa3-4729-9e2b-bc6be7ab35d5",
        "title": "O Último Voo das Borboletas",
        "author": "Kan Takahama",
        "published_at": "2019",
        "country": "Japão"
      },
      {
        "sku": "4d72e850-8723-4538-a62a-5e7dfbfd708c",
        "title": "A Arte de Charlie Chan Hock Chye",
        "author": "Sonny Liew",
        "published_at": "2019",
        "country": "Singapura"
      },
      {
        "sku": "d564e92d-6c84-4c64-bd38-3912ea9a0ad9",
        "title": "Druuna - volume 3",
        "author": "Paolo Eleuteri Serpieri",
        "published_at": "2019",
        "country": "Itália"
      },
      {
        "sku": "948aba3c-2346-49b5-90b9-3373a4dd255b",
        "title": "A Grande Odalisca",
        "author": "Bastien Vivès, Florent Ruppert e Jérôme Mulot",
        "published_at": "2019",
        "country": "França"
      },
      {
        "sku": "bb9d0c30-91f3-4d67-9d12-e8e2dbe8722a",
        "title": "A Floresta das Árvores Retorcidas",
        "author": "Alexandre Callari e Doug Firmino",
        "published_at": "2019",
        "country": "Brasil"
      },
      {
        "sku": "4db593c8-1f0d-4f35-8010-6ae35356e47b",
        "title": "Sob o Solo",
        "author": "Bianca Pinheiro e Greg Stella",
        "published_at": "2019",
        "country": "Brasil"
      },
      {
        "sku": "621bb3ea-3f43-47eb-86b8-5e3742fc5f43",
        "title": "Roseira, Medalha, Engenho e Outras Histórias",
        "author": "Jefferson Costa",
        "published_at": "2019",
        "country": "Brasil"
      },
      {
        "sku": "caef5a43-86fa-4a0e-9755-7bd9ff55da4d",
        "title": "Gastaria Tudo com Pizza",
        "author": "Pedro Duarte",
        "published_at": "2019",
        "country": "Brasil"
      },
      {
        "sku": "68a1f947-d7b2-4a7b-b54d-f2aa72a8d4a6",
        "title": "Moonshadow",
        "author": "J. M. DeMatteis e Jon J. Muth",
        "published_at": "2019",
        "country": "Estados Unidos"
      },
      {
        "sku": "073a17a7-4d87-44bb-8b8c-93537f7e7143",
        "title": "Olympia",
        "author": "Bastien Vivès, Florent Ruppert e Jérôme Mulo",
        "published_at": "2020",
        "country": "França"
      },
      {
        "sku": "b1725b7c-9125-4cd6-b5aa-07c0f7d4cbf6",
        "title": "Rohan no Louvre",
        "author": "Hirohiko Araki",
        "published_at": "2020",
        "country": "Japão"
      },
      {
        "sku": "c6d89e6e-d6b6-4fa0-88db-9e1651d91698",
        "title": "Beasts of Burden: Guardiões da Vizinhança",
        "author": "Evan Dorkin, Sarah Dyer, Mike Mignola e Benjamin Dewey",
        "published_at": "2020",
        "country": "Estados Unidos"
      },
      {
        "sku": "530d2b1c-f960-46cb-86ed-1be180a31f77",
        "title": "Destino Adiado",
        "author": "Jean-Pierre Gibrat",
        "published_at": "2020",
        "country": "França"
      },
      {
        "sku": "4fc5e227-39a3-42a3-bdb0-e88f8d176409",
        "title": "Maxwell, o Gato Mágico",
        "author": "Alan Moore",
        "published_at": "2020",
        "country": "Inglaterra"
      },
      {
        "sku": "342b6ee2-4b0b-453e-b44c-9a42bc1ff2d5",
        "title": "O Máskara",
        "author": "John Arcudi e Doug Mahnke",
        "published_at": "2020",
        "country": "Estados Unidos"
      },
      {
        "sku": "0e75c1d3-d166-4c56-8c4a-09c375d4cf4f",
        "title": "Tartarugas Ninja: Coleção Clássica - volume 1",
        "author": "Peter Laird e Kevin Eastman",
        "published_at": "2020",
        "country": "Estados Unidos"
      },
      {
        "sku": "9c5c2e6b-8265-4f80-a364-91813f804d56",
        "title": "Por Deus ou Pelo Acaso",
        "author": "Becky Cloonan e Lee Loughridge",
        "published_at": "2020",
        "country": "Estados Unidos"
      },
      {
        "sku": "d1a8f6dc-d020-4d82-b5f0-4efb62d17f36",
        "title": "Fronteiras do Além",
        "author": "Jayme Cortez",
        "published_at": "2020",
        "country": "Brasil"
      },
      {
        "sku": "27abf24d-9298-49c6-b285-2a5fcd2ae018",
        "title": "A Profecia",
        "author": "David Seltzer",
        "published_at": "2020",
        "country": "Estados Unidos"
      },
      {
        "sku": "b65cd60a-759f-4c56-8f79-3cb5cb6f0c1d",
        "title": "Grama",
        "author": "Keum Suk Gendry-Kim",
        "published_at": "2020",
        "country": "Coreia do Sul"
      },
      {
        "sku": "81cb4268-d252-4fa4-a5fc-7fa0838a6323",
        "title": "Sky Masters da Força Espacial",
        "author": "Dave Wood, Dick Wood, Jack Kirby e Wally Wood",
        "published_at": "2020",
        "country": "Estados Unidos"
      },
      {
        "sku": "22f8a312-8b3e-4f17-9b9d-23b02cbd5b0c",
        "title": "Henri Désiré Landru",
        "author": "Christophe Chabouté",
        "published_at": "2020",
        "country": "França"
      },
      {
        "sku": "d591c3a8-7adf-4b9b-b0d9-815ab16f66e0",
        "title": "Satsuma Gishiden - volume 1",
        "author": "Hiroshi Hirata",
        "published_at": "2020",
        "country": "Japão"
      },
      {
        "sku": "39f67f71-b5c8-4183-9628-6e7b76e1830e",
        "title": "O Rei Macaco",
        "author": "Silverio Pisu e Milo Manara",
        "published_at": "2020",
        "country": "Itália"
      },
      {
        "sku": "e7a39c85-d9a6-49e7-a812-50c5cb178b0b",
        "title": "Recado a Adolf - volume 1",
        "author": "Osamu Tezuka",
        "published_at": "2020",
        "country": "Japão"
      },
      {
        "sku": "9720f1ae-6a17-4185-9149-5ab90b70c29b",
        "title": "Funny Creek",
        "author": "Eduardo Medeiros, Rafael Albuquerque e Rafael Scavone",
        "published_at": "2020",
        "country": "Brasil"
      },
      {
        "sku": "be3dc60a-bc94-464c-b6de-5fa9f0e5d056",
        "title": "Satsuma Gishiden - volume 2",
        "author": "Hiroshi Hirata",
        "published_at": "2020",
        "country": "Japão"
      },
      {
        "sku": "b2e5a3b7-55b7-4d6e-9b4c-0a7b0e5c9167",
        "title": "A Fortaleza Móvel e o Mundo Subterrâneo",
        "author": "Ricardo Barreiro e Enrique Alcatena",
        "published_at": "2020",
        "country": "Argentina"
      },
      {
        "sku": "26f0e5b9-24a7-46a9-8d90-2fb91fcb5c28",
        "title": "Ogiva",
        "author": "Bruno Zago e Guilherme Petreca",
        "published_at": "2020",
        "country": "Brasil"
      },
      {
        "sku": "9cf25b07-82a5-4579-b9f5-2ea30f5c726d",
        "title": "Satsuma Gishiden - volume 3",
        "author": "Hiroshi Hirata",
        "published_at": "2020",
        "country": "Japão"
      },
      {
        "sku": "d57a6b94-6af2-49c6-a982-5eaf2a9c705f",
        "title": "Recado a Adolf - volume 2",
        "author": "Osamu Tezuka",
        "published_at": "2020",
        "country": "Japão"
      },
      {
        "sku": "482df5e9-720b-45f6-aad0-cbfa7d237b2b",
        "title": "Traço de Giz",
        "author": "Miguelanxo Prado",
        "published_at": "2021",
        "country": "Espanha"
      },
      {
        "sku": "b1e42982-8927-4ef7-b905-e11c728b166f",
        "title": "Incal (Todo Incal - volume 1)",
        "author": "Alejandro Jodorowsky e Moebius",
        "published_at": "2021",
        "country": "França"
      },
      {
        "sku": "89d7e927-89ea-4ba5-b44c-82e9ebf57c35",
        "title": "Tartarugas Ninja: Coleção Clássica - volume 2",
        "author": "Peter Laird e Kevin Eastman",
        "published_at": "2021",
        "country": "Estados Unidos"
      },
      {
        "sku": "16aef57f-9948-4085-8722-62cb5f6d4b56",
        "title": "Tomie - volume 1",
        "author": "Junji Ito",
        "published_at": "2021",
        "country": "Japão"
      },
      {
        "sku": "1dbe0c92-5f5f-45e9-9738-7b8f0b5c4e7d",
        "title": "Bran Mak Morn: O Último Rei dos Pictos",
        "author": "Robert E. Howard",
        "published_at": "2021",
        "country": "Estados Unidos"
      },
      {
        "sku": "4f6e8db5-63f9-42b0-9c3d-87ba9f8c4d3e",
        "title": "Red Sonja: A Balada da Deusa Ruiva",
        "author": "Roy Thomas, Esteban Maroto e Santi Casas",
        "published_at": "2021",
        "country": "Estados Unidos"
      },
      {
        "sku": "1b5c7f9e-d4f8-4b59-b5f9-c3d48b9e6c7d",
        "title": "Tomie - volume 2",
        "author": "Junji Ito",
        "published_at": "2021",
        "country": "Japão"
      },
      {
        "sku": "9f48b7e6-5d3b-4c0d-8b7d-5c3d4e6f8b7c",
        "title": "Dan Brand e Outros Clássicos",
        "author": "Frank Frazetta",
        "published_at": "2021",
        "country": "Estados Unidos"
      },
      {
        "sku": "d7b5e8f9-4c6b-4b0d-9f4e-5b8c7e6d4f9e",
        "title": "Trilogia Gatilho",
        "author": "Carlos Estefan e Pedro Mauro",
        "published_at": "2021",
        "country": "Brasil"
      },
      {
        "sku": "2c7e9d5f-4b6f-4e0d-8b9f-5d3b4e7c8f9d",
        "title": "Tartarugas Ninja: Coleção Clássica - volume 3",
        "author": "Peter Laird e Kevin Eastman",
        "published_at": "2021",
        "country": "Estados Unidos"
      },
      {
        "sku": "9f4e5b8c-7d6b-4e0d-8f9c-4b7e6d3f9e5b",
        "title": "Hokusai",
        "author": "Shotaro Ishinomori",
        "published_at": "2021",
        "country": "Japão"
      },
      {
        "sku": "5b8f7c6e-4d3b-4e9f-9d5c-7b4e6f8c9d3b",
        "title": "Fredric, William e a Amazona",
        "author": "Jean-Marc Lainé e Thierry Olivier",
        "published_at": "2021",
        "country": "França"
      },
      {
        "sku": "7c8e9d5f-4b6f-4e9d-8b5c-6f7e4b9d5c8f",
        "title": "As Crônicas da Era do Gelo - volume 1",
        "author": "Jiro Taniguchi",
        "published_at": "2021",
        "country": "Japão"
      },
      {
        "sku": "8b9f4e5d-6c7b-4e0d-9f5c-7e4b8f9c6d3b",
        "title": "Shamisen: Canções do Mundo Flutuante",
        "author": "Guilherme Petreca e Tiago Minamisawa",
        "published_at": "2021",
        "country": "Brasil"
      },
      {
        "sku": "4b7e8f9d-5c6b-4e0d-9f4e-6d3b8f9c5e7d",
        "title": "Copra - Round Um",
        "author": "Michel Fiffe",
        "published_at": "2021",
        "country": "Estados Unidos"
      },
      {
        "sku": "9f4e5c8b-7d6b-4e0d-9b5c-4e7d8f9c5b6f",
        "title": "Copra - Round Dois",
        "author": "Michel Fiffe",
        "published_at": "2021",
        "country": "Estados Unidos"
      },
      {
        "sku": "5c7e8f9b-6d4e-4e9f-9b5c-7f8d4e9c6b7d",
        "title": "As Crônicas da Era do Gelo - volume 2",
        "author": "Jiro Taniguchi",
        "published_at": "2021",
        "country": "Japão"
      },
      {
        "sku": "8f9c5b7e-4d6b-4e0d-9f5c-6d3b9e7c5f8d",
        "title": "O Grande Livro dos Vampiros",
        "author": "Stephen Jones",
        "published_at": "2021",
        "country": "Reino Unido"
      },
      {
        "sku": "7c9e5f8b-6d4e-4e9f-9b5c-8f4e6b9d7c5f",
        "title": "Yellow Cab",
        "author": "Christophe Chabouté",
        "published_at": "2021",
        "country": "França"
      },
      {
        "sku": "5b9e8f7c-4d6b-4e0d-9f5c-8d7c4e9f6b5c",
        "title": "A Lanterna de Nix - volume 1",
        "author": "Kan Takahama",
        "published_at": "2021",
        "country": "Japão"
      },
      {
        "sku": "7e9f6c8b-5d4e-4e0d-9b5c-8f6d4e9b7c5e",
        "title": "Antes do Incal (Todo Incal - volume 2)",
        "author": "Alejandro Jodorowsky e Zoran Janjetov",
        "published_at": "2021",
        "country": "França"
      },
      {
        "sku": "8c5b7e9f-4d6b-4e0d-9f5c-8d7e9c5b6f4e",
        "title": "A Espera",
        "author": "Keum Suk Gendry-Kim",
        "published_at": "2021",
        "country": "Coreia do Sul"
      },
      {
        "sku": "9f6b7c5d-4e8b-4e0d-9f5c-8d7e9c5b6f4e",
        "title": "A Lanterna de Nix - volume 2",
        "author": "Kan Takahama",
        "published_at": "2021",
        "country": "Japão"
      },
      {
        "sku": "5b6f8c7d-4e9f-4e0d-9b5c-8e7f9c5d6b4e",
        "title": "O Diário do Chaves (Livro)",
        "author": "Roberto Gómez Bolaños",
        "published_at": "2021",
        "country": "México"
      },
      {
        "sku": "bc431ac1-2f6a-4973-987c-4a3edb2d0c60",
        "title": "Incal Final (Todo Incal - volume 3)",
        "author": "Alejandro Jodorowsky e Moebius",
        "published_at": "2022",
        "country": "França"
      },
      {
        "sku": "0a52fc69-7641-4f53-b2df-3c5eb6f99a77",
        "title": "Arena",
        "author": "Alexandre Callari e Alan Patrick",
        "published_at": "2022",
        "country": "Brasil"
      },
      {
        "sku": "573ade94-2d49-49c9-b8d7-90f6c16ae75d",
        "title": "Spectreman - volume 2",
        "author": "Souji Ushio e Daiji Kazumine",
        "published_at": "2022",
        "country": "Japão"
      },
      {
        "sku": "d0e8937b-2814-4a63-a1b3-3d39ed1f429f",
        "title": "Celestia",
        "author": "Manuele Fior",
        "published_at": "2022",
        "country": "Itália"
      },
      {
        "sku": "3dcf25f8-9cd3-40e1-ae63-fb5bdf93ea4d",
        "title": "Tarzan",
        "author": "Roy Thomas e John Buscema",
        "published_at": "2022",
        "country": "Estados Unidos"
      },
      {
        "sku": "c4e39581-512c-4e78-a312-f3adf7c4b6ed",
        "title": "Elric: Stormbringer",
        "author": "P. Craig Russell",
        "published_at": "2022",
        "country": "Estados Unidos"
      },
      {
        "sku": "bf5c731d-8246-4149-9a63-f43cfbe6d78b",
        "title": "Spectreman - volume 3",
        "author": "Souji Ushio e Daiji Kazumine",
        "published_at": "2022",
        "country": "Japão"
      },
      {
        "sku": "29df05ea-4f37-49d3-a5b9-cf3a6d2eb461",
        "title": "Jun",
        "author": "Keum Suk Gendry-Kim",
        "published_at": "2022",
        "country": "Coreia do Sul"
      },
      {
        "sku": "94cfa237-bf21-49c3-b5ad-d3c6b8e905fa",
        "title": "Mais Forte Que A Espada - volume 1",
        "author": "Hiroshi Hirata",
        "published_at": "2022",
        "country": "Japão"
      },
      {
        "sku": "3b8e65af-d473-40fa-b9e5-fca4c23d7f58",
        "title": "Mais Forte Que A Espada - volume 2",
        "author": "Hiroshi Hirata",
        "published_at": "2022",
        "country": "Japão"
      },
      {
        "sku": "61bf43da-7e4b-4f8d-9c52-bfa6d73029ed",
        "title": "A Obsolescência Programada dos Nossos Sentimentos",
        "author": "Zidrou e Aimée de Jongh",
        "published_at": "2022",
        "country": "França"
      },
      {
        "sku": "94e2c1af-7b39-4237-9df6-c3b8f52a4d1e",
        "title": "Horácio Completo - volume 3",
        "author": "Mauricio de Sousa",
        "published_at": "2022",
        "country": "Brasil"
      },
      {
        "sku": "05b97df4-39c2-4e76-9f5a-bc3e8d14f63a",
        "title": "Conan, O Cimério - volume 1",
        "author": "Jean-David Morvan, Mathieu Gabella, Vincent Brugeas e Robin Recht",
        "published_at": "2022",
        "country": "França"
      },
      {
        "sku": "7b39e2f4-3a5c-41d2-97f8-bca16d9e52cf",
        "title": "Spectreman - volume 4",
        "author": "Souji Ushio e Daiji Kazumine",
        "published_at": "2022",
        "country": "Japão"
      },
      {
        "sku": "0d4fa8e9-5c23-42b7-b9f6-e3a2c59d87fa",
        "title": "A Balada para Sophie",
        "author": "Filipe Melo e Juan Cavia",
        "published_at": "2022",
        "country": "Portugal"
      },
      {
        "sku": "4c9fb7e3-2a5d-4e39-8fa6-b3c9e5d74fa2",
        "title": "Tartarugas Ninja: Coleção Clássica - volume 5",
        "author": "Peter Laird e Kevin Eastman",
        "published_at": "2022",
        "country": "Estados Unidos"
      },
      {
        "sku": "7df8a9e2-3c5b-41e6-b9f7-c2e8a59d43fa",
        "title": "Um Bairro Distante",
        "author": "Jiro Taniguchi",
        "published_at": "2022",
        "country": "Japão"
      },
      {
        "sku": "94b7a3e9-f5c2-41d3-97f8-a5c9e72d43fa",
        "title": "A Bomba",
        "author": "Didier Alcante e Laurent-Frédéric Bollée",
        "published_at": "2022",
        "country": "França"
      },
      {
        "sku": "2a5d3c7f-49b7-4e91-9fa6-d3b8f94c52fa",
        "title": "Maxwell, o Gato Mágico (nova edição)",
        "author": "Alan Moore",
        "published_at": "2022",
        "country": "Inglaterra"
      },
      {
        "sku": "8fa6d3b9-4c7e-49b3-9f5a-e3a59d4fa72c",
        "title": "Hotel Harbour-View: Tokyo Killers",
        "author": "Natsuo Sekikawa e Jiro Taniguchi",
        "published_at": "2022",
        "country": "Japão"
      },
      {
        "sku": "3c5a7e8f-49d2-4b9e-9f5a-b3e6c9d72fa4",
        "title": "A Valise do Professor",
        "author": "Jiro Taniguchi",
        "published_at": "2022",
        "country": "Japão"
      },
      {
        "sku": "9f5b7a3e-4c8d-49e9-9fa6-d3b7f9c52a4e",
        "title": "Calafrios",
        "author": "Junji Ito",
        "published_at": "2022",
        "country": "Japão"
      },
      {
        "sku": "5c7d94e2-3a59-4f9e-b9fa-d3e8a72c54fa",
        "title": "A Polícia Secreta para Crimes Mágicos (Livro)",
        "author": "Emanoel Ferreira",
        "published_at": "2022",
        "country": "Brasil"
      },
      {
        "sku": "9d3a7f5b-4e8c-4b9f-9fa6-d3e8a52c74fa",
        "title": "Dente de Leite",
        "author": "Patrick Martins e Igor Frederico",
        "published_at": "2022",
        "country": "Brasil"
      },
      {
        "sku": "7e8f5a9d-4c3b-49b7-9fa6-d3e9a72c54fa",
        "title": "Horácio Completo - volume 4",
        "author": "Mauricio de Sousa",
        "published_at": "2022",
        "country": "Brasil"
      },
      {
        "sku": "9f3c7a5e-4b6d-4e9f-9fa6-c2d8a59d73fa",
        "title": "Copra - Round Três",
        "author": "Michel Fiffe",
        "published_at": "2022",
        "country": "Estados Unidos"
      },
      {
        "sku": "7a9e4f5b-3c8d-49f7-9fa6-b2e5d9a7c4fa",
        "title": "Purgatório",
        "author": "Christophe Chabouté",
        "published_at": "2022",
        "country": "França"
      },
      {
        "sku": "5c7f3a9e-4d8b-49e9-9fa6-d3a7e4f9c2fa",
        "title": "MW",
        "author": "Osamu Tezuka",
        "published_at": "2022",
        "country": "Japão"
      },
      {
        "sku": "e4d1f58b-1a94-4f4e-8b2b-7c7e4b32a9e0",
        "title": "Castaca e as Armas dos Metabarões (Coleção Metabarões - volume 3)",
        "author": "Alejandro Jodorowsky, Das Pastoras, Travis Charest e Zoran Janjetov",
        "published_at": "2024",
        "country": "França"
      },
      {
        "sku": "f7c9e58a-4d72-4f9e-8b3a-7a9f6b1d2e4c",
        "title": "Blueberry - volume 2",
        "author": "Jean-Michel Charlier e Jean Giraud (Moebius)",
        "published_at": "2024",
        "country": "França"
      },
      {
        "sku": "d3b8a7e9-4c5f-4e9b-9fa2-7e8c6b1f5d9a",
        "title": "Borboleta Assassina - volume 1",
        "author": "Yuka Nagate",
        "published_at": "2024",
        "country": "Japão"
      },
      {
        "sku": "a6b7e4c5-3f8d-4e9f-9fa2-7c5b9e7d8f2a",
        "title": "Power Rangers/Tartarugas Ninjas - volume 1",
        "author": "Ryan Parrott, Simone Di Meo e Walter Baiamonte",
        "published_at": "2024",
        "country": "Estados Unidos"
      },
      {
        "sku": "c5b9f2a7-3e8d-4e9f-9fa7-6a7b9e4f5c2a",
        "title": "Domínio Público - volume 1",
        "author": "Chip Zdarsky",
        "published_at": "2024",
        "country": "Estados Unidos"
      },
      {
        "sku": "e7a5b9c2-4f8d-4e9f-9fa2-7c5a9b6e4f3d",
        "title": "Conan, o Bárbaro: Adaptação Oficial do Filme (livro)",
        "author": "L. Sprague de Camp e Lin Carter",
        "published_at": "2024",
        "country": "Estados Unidos"
      },
      {
        "sku": "b7e9f5a6-3c8d-4e9f-9fa7-d3a6b7e5f9c2",
        "title": "Borboleta Assassina - volume 3",
        "author": "Yuka Nagate",
        "published_at": "2024",
        "country": "Japão"
      },
      {
        "sku": "9e7b5c8f-3a6d-4e9f-9fa2-7b6e9a4f5d2c",
        "title": "Os Exércitos do Conquistador",
        "author": "Jean-Pierre Dionnet e Jean-Claude Gal",
        "published_at": "2024",
        "country": "França"
      },
      {
        "sku": "6b7a5e9c-4f3d-4e9f-9fa7-3c9a5b7e6d2f",
        "title": "Incal: Kill Cara de Cão",
        "author": "Brandon Thomas e Pete Woods",
        "published_at": "2024",
        "country": "Estados Unidos"
      },
      {
        "sku": "5e9f7c8a-3b6d-4e9f-9fa7-7c9a6b5e4d2f",
        "title": "O diário de meu pai",
        "author": "Jiro Taniguchi",
        "published_at": "2024",
        "country": "Japão"
      },
      {
        "sku": "7a5b6c9e-4f8d-4e9f-9fa7-3d9e7a5b6f2c",
        "title": "A Estrada",
        "author": "Manu Larcenet",
        "published_at": "2024",
        "country": "França"
      },
      {
        "sku": "9f6b7a5c-3e8d-4e9f-9fa2-7a5b6e4f9c3d",
        "title": "Coleção Crepax: Drácula, Frankenstein e Outras Histórias",
        "author": "Guido Crepax",
        "published_at": "2024",
        "country": "Itália"
      },
      {
        "sku": "c9e7f5a6-4b8d-4e9f-9fa2-7b5a6e4d2f9c",
        "title": "O Bom Assaltante",
        "author": "Pomaski Pichetshote e Alexandre Tefenkgi",
        "published_at": "2024",
        "country": "Estados Unidos"
      },
      {
        "sku": "7b5c9e4f-3a8d-4e9f-9fa2-7e6b5a9f7d3c",
        "title": "Estrada para a Eternidade",
        "author": "Mitsuo Katsumi",
        "published_at": "2024",
        "country": "Japão"
      },
      {
        "sku": "6a5c9e7f-4b8d-4e9f-9fa2-7c9a5b6e4f3d",
        "title": "Mundo sem fim",
        "author": "Jamie Delano e John Higgins",
        "published_at": "2024",
        "country": "Estados Unidos"
      },
      {
        "sku": "3e9b7a5c-4f8d-4e9f-9fa7-6b7e9a5c6f2d",
        "title": "Battle Royale - volume 1",
        "author": "Koushun Takami e Masayuki Taguchi",
        "published_at": "2024",
        "country": "Japão"
      },
      {
        "sku": "9b7a6e4f-3c8d-4e9f-9fa2-7c5a9b6f7d2e",
        "title": "Fire - volume 2",
        "author": "Hidoko Mizuno",
        "published_at": "2024",
        "country": "Japão"
      },
      {
        "sku": "4b9f7a6e-3d8d-4e9f-9fa2-7c5a9b7e6f2d",
        "title": "Conan, o Cimério - volume 4",
        "author": "Christophe Bec, Julien Blondel, Jean-Luc Masbou e outros",
        "published_at": "2024",
        "country": "França"
      },
      {
        "sku": "6e9b7a5c-4d8d-4e9f-9fa2-7a5b6c9e7f2d",
        "title": "O Último Ronin - anos perdidos",
        "author": "Kevin Eastman, Tom Waltz e Ben Bishop",
        "published_at": "2024",
        "country": "Estados Unidos"
      },
      {
        "sku": "3c6b9e7a-4f8d-4e9f-9fa2-7e5a9b6f7d2c",
        "title": "A saga de Elric - volume 1 (livro)",
        "author": "Michael Moorcock",
        "published_at": "2024",
        "country": "Inglaterra"
      }
    ]

    puts "🚀 Importing books..."

    # Create or find countries
    country_names = books_data.map { |b| b[:country] }.uniq
    countries_map = Country.where(name: country_names).index_by(&:name)

    missing_countries = country_names - countries_map.keys
    if missing_countries.any?
      Country.insert_all(missing_countries.map { |name| { name: name, created_at: Time.current, updated_at: Time.current } })
      countries_map = Country.where(name: country_names).index_by(&:name)
    end

    # Create or find authors and associate them with countries
    author_data = books_data.map { |b| { name: b[:author], country_id: countries_map[b[:country]].id } }.uniq
    existing_authors = Author.where(name: author_data.map { |a| a[:name] }).index_by(&:name)

    # Create new authors if they don't exist yet
    new_authors = author_data.reject { |a| existing_authors.key?(a[:name]) }

    if new_authors.any?
      inserted_authors = Author.insert_all(new_authors)

      # Retrieve inserted authors from the DB to update the existing_authors map
      updated_authors = Author.where(name: new_authors.map { |a| a[:name] }).index_by(&:name)
      existing_authors.merge!(updated_authors)
    end

    # Creating books with country_id
    books = books_data.map do |b|
      author = existing_authors[b[:author]]

      {
        title: b[:title],
        sku: b[:sku],
        published_at: Date.new(b[:published_at].to_i),
        author_id: author&.id, # ✅ This is enough
        created_at: Time.current,
        updated_at: Time.current
      }
    end

    # Insert books into the database without `id` or `country_id`
    Book.insert_all(books)

    puts "✅ Books imported successfully!"
  end
end
