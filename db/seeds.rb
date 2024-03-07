# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Destroying suggestions..."
Suggestion.destroy_all
puts "Creating suggestions..."
Suggestion.create!(
  title: "Serbia",
  quote: "Belgrade is not just a city; it's a vibe, a spirit, an energy that captivates the soul.",
  author: "Emir Kusturica",
  subtitle: "Exploring Serbia: A Cultural and Natural Odyssey",
  paragraph1: "Nestled in the heart of the Balkans, Serbia beckons travelers with its captivating blend of rich culture, pristine nature, and the dynamic cityscape of Belgrade. Embark on a journey through this multifaceted destination, where every corner reveals a story waiting to be told.",
  paragraph2: "Begin your exploration in Belgrade, the vibrant capital that seamlessly blends centuries of history with a modern urban landscape. Wander through the cobbled streets of the historic Stari Grad (Old Town), where Ottoman and Austro-Hungarian architecture stand side by side, a testament to the city's tumultuous past.",
  paragraph3: 'Escape the bustle of the city and venture into Serbia\'s pristine wilderness. Tara National Park, a UNESCO Biosphere Reserve, enchants visitors with its dense forests, crystal-clear rivers, and dramatic limestone cliffs. Hike to Banjska Stena for panoramic views of the Drina River canyon below, or embark on a thrilling rafting adventure along the Tara River, known as the "Tear of Europe."'
)
Suggestion.create!(
  title: "France",
  quote: "France is a feast for the senses, a symphony of art, cuisine, and history.",
  author: "Unknown",
  subtitle: "Discovering France: A Journey Through Time and Taste",
  paragraph1: "Embark on a sensory journey through France, where every corner is infused with the essence of art, culture, and gastronomy. From the romantic streets of Paris to the sun-kissed vineyards of Bordeaux, this country beckons travelers with its timeless charm and unparalleled beauty.",
  paragraph2: "Indulge in the rich tapestry of French cuisine, where each dish is a masterpiece crafted with passion and precision. From delicate pastries to savory cheeses, every bite tells a story of tradition and innovation, reflecting the diverse regions and culinary heritage of France.",
  paragraph3: "Immerse yourself in France's rich cultural heritage, where history comes to life in majestic castles, ancient ruins, and world-renowned museums. Whether you're exploring the opulent Palace of Versailles or tracing the footsteps of Vincent van Gogh in Provence, each experience is a glimpse into the soul of this enchanting country."
)
Suggestion.create!(
  title: "Italy",
  quote: "Italy is a dream that keeps returning for the rest of your life.",
  author: "Anna Akhmatova",
  subtitle: "La Dolce Vita: Exploring the Heart of Italy",
  paragraph1: "Journey to Italy, where every moment is infused with the passion and romance of la dolce vita. From the rolling hills of Tuscany to the ancient streets of Rome, this country captivates the imagination with its timeless beauty and vibrant culture.",
  paragraph2: "Savor the flavors of Italy, where food is more than sustenance; it's a celebration of life itself. Indulge in freshly made pasta, artisanal cheeses, and velvety gelato, each dish a testament to the culinary mastery and love for good food that defines Italian cuisine.",
  paragraph3: "Immerse yourself in Italy's rich tapestry of art and history, where every corner holds a treasure waiting to be discovered. Marvel at the masterpieces of Michelangelo in Florence, wander through the ancient ruins of Pompeii, or simply lose yourself in the maze-like streets of Venice, where every bridge leads to a new adventure."
)
Suggestion.create!(
  title: "Spain",
  quote: "Spain is a fiesta for the senses, a whirlwind of color, flavor, and passion.",
  author: "Unknown",
  subtitle: "España: A Tapestry of Tradition and Innovation",
  paragraph1: "Experience the vibrant soul of Spain, where tradition and modernity intertwine in a kaleidoscope of culture and cuisine. From the lively streets of Madrid to the sun-drenched shores of Barcelona, this country invites travelers to immerse themselves in its rich tapestry of history, art, and gastronomy.",
  paragraph2: "Savor the flavors of Spain, where each bite is a symphony of taste and texture. Indulge in tapas on a bustling street corner, sip on sangria under the shade of an orange tree, or feast on paella by the sea, each dish a reflection of Spain's diverse regions and culinary heritage.",
  paragraph3: "Explore Spain's rich cultural heritage, where ancient castles stand guard over medieval towns and modernist masterpieces dazzle in cosmopolitan cities. Whether you're marveling at the architectural wonders of Antoni Gaudí in Barcelona or tracing the footsteps of Don Quixote in La Mancha, each experience is a journey through the heart and soul of Spain."
)
Suggestion.create!(
  title: "United Kingdom",
  quote: "The United Kingdom is a land of contrasts, where ancient traditions and modern innovation collide.",
  author: "Unknown",
  subtitle: "Exploring the British Isles: From London's Bustle to Scotland's Highlands",
  paragraph1: "Discover the magic of the United Kingdom, where centuries of history and culture await around every corner. From the iconic landmarks of London to the rugged landscapes of the Scottish Highlands, this country offers a wealth of experiences for travelers of all tastes and interests.",
  paragraph2: "Indulge in the rich tapestry of British cuisine, where classic dishes and multicultural flavors come together in a symphony of taste. Enjoy a traditional afternoon tea in a quaint tearoom, feast on fish and chips by the seaside, or sample innovative dishes at a Michelin-starred restaurant in the heart of the capital.",
  paragraph3: "Immerse yourself in the United Kingdom's diverse cultural heritage, where ancient castles and stately homes stand testament to the country's royal past, while modern museums and galleries showcase its dynamic present. Whether you're exploring the historic streets of Edinburgh or wandering through the picturesque villages of the Cotswolds, each destination offers a glimpse into the rich tapestry of British life."
)
Suggestion.create!(
  title: "Latvia",
  quote: "Latvia is a hidden gem waiting to be discovered, where medieval charm meets Baltic beauty.",
  author: "Unknown",
  subtitle: "Exploring Latvia: From Riga's Riches to the Tranquility of the Countryside",
  paragraph1: "Embark on a journey through Latvia and uncover a land of enchanting forests, charming cities, and rich cultural heritage. From the vibrant streets of Riga to the tranquil shores of the Baltic Sea, every corner of this country offers a unique blend of history and natural beauty.",
  paragraph2: "Indulge in the flavors of Latvian cuisine, where hearty soups and savory pies are served alongside delicate pastries and sweet berry desserts. Sample traditional dishes like grey peas with bacon or head to one of the many bustling markets to discover local delicacies and artisanal treats.",
  paragraph3: "Immerse yourself in Latvia's rich cultural traditions, from the colorful folklore and traditional music to the vibrant festivals and celebrations that take place throughout the year. Explore ancient castles and medieval towns, hike through pristine national parks, or simply relax and soak up the peaceful atmosphere of this hidden gem in the heart of the Baltics."
)
Suggestion.create!(
  title: "Portugal",
  quote: "Portugal is a land of timeless beauty, where the past whispers in the cobblestone streets and the sea sings in the crashing waves.",
  author: "Unknown",
  subtitle: "Discovering Portugal: From Lisbon's Hills to Porto's Vineyards",
  paragraph1: "Explore the wonders of Portugal, where sun-drenched beaches, historic cities, and lush vineyards await at every turn. From the colorful streets of Lisbon to the charming villages of the Algarve, this country offers a wealth of experiences for travelers seeking beauty and adventure.",
  paragraph2: "Indulge in the flavors of Portuguese cuisine, where fresh seafood, hearty stews, and sweet pastries tempt the taste buds. Savor a custard tart with a bica (espresso) in a traditional café, feast on grilled sardines by the seaside, or sample the famous port wine in the vineyards of the Douro Valley.",
  paragraph3: "Immerse yourself in Portugal's rich history and culture, from the ancient ruins and Moorish castles to the vibrant street art and fado music that fills the air. Whether you're exploring the historic neighborhoods of Porto or hiking through the rugged landscapes of Madeira, each destination offers a glimpse into the soul of this captivating country."
)
Suggestion.create!(
  title: "Netherlands",
  quote: "The Netherlands is a masterpiece of engineering and innovation, where windmills turn and tulips bloom against a backdrop of vibrant cities and picturesque countryside.",
  author: "Unknown",
  subtitle: "Exploring the Netherlands: A Journey through Time and Tradition",
  paragraph1: "The Netherlands beckons visitors with its picturesque canals, historic windmills, and vibrant cultural scene. From the bustling streets of Amsterdam to the charming villages of the countryside, there's something for everyone in this enchanting country.",
  paragraph2: "Indulge in the flavors of Dutch cuisine, from savory pancakes and hearty stews to sweet stroopwafels and creamy cheeses. Visit a local market to sample fresh herring, indulge in a traditional rijsttafel (rice table) feast, or enjoy a leisurely bike ride through fields of blooming tulips.",
  paragraph3: "Immerse yourself in Dutch culture and history as you explore the country's iconic landmarks, from the UNESCO-listed canals of Amsterdam to the historic windmills of Kinderdijk. Discover world-class museums, vibrant festivals, and charming historic towns as you journey through this unique and dynamic destination."
)
Suggestion.create!(
  title: "Belgium",
  quote: "Belgium is a treasure trove of art, culture, and culinary delights, where every city tells a story and every meal is a masterpiece.",
  author: "Unknown",
  subtitle: "Discovering Belgium: From Brussels' Grandeur to Bruges' Charm",
  paragraph1: "Explore the rich tapestry of Belgium, where medieval castles, bustling cities, and tranquil countryside await at every turn. From the grandeur of Brussels to the charm of Bruges, this small country packs a big punch when it comes to history, culture, and gastronomy.",
  paragraph2: "Indulge in the flavors of Belgian cuisine, where chocolate, waffles, and beer reign supreme. Sample decadent pralines in a quaint chocolate shop, savor a crispy cone of Belgian fries with mayonnaise, or enjoy a glass of Trappist beer brewed by monks in centuries-old abbey breweries.",
  paragraph3: "Immerse yourself in Belgium's rich artistic heritage as you explore the country's world-class museums, galleries, and historic landmarks. Discover masterpieces by Flemish painters, marvel at Gothic cathedrals, and wander through cobblestone streets lined with medieval guildhalls, all while experiencing the warm hospitality and charm of the Belgian people."
)
Suggestion.create!(
  title: "Norway",
  quote: "Norway is a land of breathtaking beauty, where towering fjords, cascading waterfalls, and snow-capped peaks stretch as far as the eye can see.",
  author: "Unknown",
  subtitle: "Exploring Norway: From Oslo's Sophistication to the Majesty of the Fjords",
  paragraph1: "Discover the wonders of Norway, where nature takes center stage in a landscape of unparalleled beauty and diversity. From the cosmopolitan streets of Oslo to the remote villages of the Arctic Circle, this country offers a wealth of experiences for travelers seeking adventure and tranquility.",
  paragraph2: "Indulge in the flavors of Norwegian cuisine, where fresh seafood, wild game, and hearty breads are staples of the traditional diet. Feast on salmon cured in the crisp Arctic air, warm up with a bowl of hearty fish soup, or sample reindeer meat prepared in the traditional Sami style.",
  paragraph3: "Immerse yourself in Norway's rich cultural heritage as you explore the country's historic landmarks, vibrant festivals, and ancient traditions. Whether you're hiking through pristine forests, cruising through glacier-carved fjords, or chasing the Northern Lights across the Arctic sky, each moment in Norway is a testament to the country's natural beauty and enduring spirit."
)
Suggestion.create!(
  title: "Ireland",
  quote: "Ireland is a land of myths and legends, where ancient ruins stand testament to a rich history and rugged landscapes invite exploration.",
  author: "Unknown",
  subtitle: "Exploring Ireland: From Dublin's Charms to the Wilds of Connemara",
  paragraph1: "Discover the magic of Ireland, where rolling green hills, dramatic cliffs, and cozy pubs await at every turn. From the vibrant streets of Dublin to the tranquil shores of the Wild Atlantic Way, this country offers a wealth of experiences for travelers seeking beauty and adventure.",
  paragraph2: "Indulge in the flavors of Irish cuisine, where hearty stews, freshly caught seafood, and warm soda breads are staples of the traditional diet. Sample a pint of Guinness in a historic pub, feast on a traditional Irish breakfast with all the trimmings, or savor the sweetness of a creamy pint of Irish whiskey.",
  paragraph3: "Immerse yourself in Ireland's rich cultural heritage as you explore the country's ancient castles, picturesque villages, and lively festivals. Whether you're hiking along the rugged coastline of County Kerry or exploring the ancient ruins of the Boyne Valley, each destination offers a glimpse into the soul of this captivating country."
)
Suggestion.create!(
  title: "Greece",
  quote: "Greece is a symphony of history, where every stone whispers tales of gods and heroes, empires and conquests.",
  author: "Unknown",
  subtitle: "Discovering Greece: A Journey through Myth and Legend",
  paragraph1: "Greece invites travelers to explore its ancient ruins, sun-drenched islands, and vibrant cultural scene. From the historic streets of Athens to the idyllic beaches of Santorini, there's something for everyone in this enchanting country.",
  paragraph2: "Discover the iconic landmarks of Athens, from the majestic Acropolis to the ancient Agora. Explore the picturesque villages of the Peloponnese, where olive groves stretch to the horizon and ancient ruins dot the landscape.",
  paragraph3: "Indulge in the flavors of Greek cuisine, from the tangy feta cheese of Crete to the succulent souvlaki of Athens. Sip on a glass of ouzo as you watch the sunset over the Aegean Sea, and let the magic of Greece capture your heart."
)
Suggestion.create!(
   title: "China",
   quote: "China is a land of ancient wonders and modern marvels, where the past and present converge in a symphony of culture and innovation.",
   author: "Unknown",
   subtitle: "Exploring China: From the Great Wall to the Bustling Streets of Shanghai",
   paragraph1: "Embark on a journey through China and discover a land of diverse landscapes, rich history, and vibrant culture. From the iconic landmarks of Beijing to the tranquil beauty of Guilin, this vast country offers a wealth of experiences for travelers seeking adventure and discovery.",
   paragraph2: "Indulge in the flavors of Chinese cuisine, where regional specialties and culinary traditions reflect the country's diverse cultural heritage. Feast on spicy Sichuan hotpot, savor the delicate flavors of Cantonese dim sum, or sample street food delights in bustling night markets.",
   paragraph3: "Immerse yourself in China's rich cultural heritage as you explore ancient temples, traditional tea houses, and bustling markets. Whether you're hiking along the Great Wall, cruising down the Yangtze River, or marveling at the Terracotta Warriors, each destination offers a glimpse into the soul of this captivating country."
)
Suggestion.create!(
   title: "Vietnam",
   quote: "Vietnam is a land of contrasts, where ancient temples stand alongside modern skyscrapers, and tranquil rice paddies give way to bustling cities.",
   author: "Unknown",
   subtitle: "Discovering Vietnam: From Hanoi's Old Quarter to the Mekong Delta",
   paragraph1: "Explore the beauty and diversity of Vietnam, where lush landscapes, rich history, and vibrant culture await at every turn. From the chaotic streets of Ho Chi Minh City to the serene beauty of Ha Long Bay, this country offers a wealth of experiences for travelers seeking adventure and tranquility.",
   paragraph2: "Indulge in the flavors of Vietnamese cuisine, where fresh herbs, aromatic spices, and bold flavors are the hallmarks of traditional dishes. Sample a steaming bowl of pho at a bustling street stall, feast on crispy banh mi sandwiches in a local market, or enjoy a traditional seafood feast on the banks of the Mekong River.",
   paragraph3: "Immerse yourself in Vietnam's rich cultural heritage as you explore ancient temples, vibrant markets, and traditional villages. Whether you're trekking through the mountainous landscapes of Sapa, cruising along the Perfume River in Hue, or cycling through the picturesque countryside of Hoi An, each destination offers a glimpse into the heart and soul of this captivating country."
)
Suggestion.create!(
   title: "Thailand",
   quote: "Thailand is a land of smiles, where the warmth of the sun is matched only by the hospitality of its people.",
   author: "Unknown",
   subtitle: "Exploring Thailand: From Bangkok's Bustle to Phuket's Beaches",
   paragraph1: "Discover the magic of Thailand, where ancient temples, bustling markets, and pristine beaches await at every turn. From the vibrant streets of Bangkok to the tranquil beauty of the Andaman Sea, this country offers a wealth of experiences for travelers seeking adventure and relaxation.",
   paragraph2: "Indulge in the flavors of Thai cuisine, where spicy curries, fragrant soups, and fresh seafood tempt the taste buds. Sample a fiery bowl of tom yum goong in a bustling street market, feast on aromatic green curry in a traditional Thai restaurant, or enjoy a beachside barbecue with freshly caught fish and tropical fruits.",
   paragraph3: "Immerse yourself in Thailand's rich cultural heritage as you explore ancient temples, colorful festivals, and traditional villages. Whether you're trekking through the lush jungles of Chiang Mai, snorkeling in the crystal-clear waters of the Similan Islands, or learning the art of Thai massage in a tranquil spa, each destination offers a glimpse into the heart and soul of this enchanting country."
)
Suggestion.create!(
   title: "Japan",
   quote: "Japan is a land of contrasts, where ancient traditions and cutting-edge technology coexist in harmony.",
   author: "Unknown",
   subtitle: "Discovering Japan: From Tokyo's Neon Lights to Kyoto's Temples",
   paragraph1: "Explore the wonders of Japan, where ancient temples, futuristic cities, and serene landscapes await at every turn. From the bustling streets of Tokyo to the tranquil beauty of Mount Fuji, this country offers a wealth of experiences for travelers seeking adventure and tranquility.",
   paragraph2: "Indulge in the flavors of Japanese cuisine, where delicate sushi, savory ramen, and crispy tempura are the hallmarks of traditional dishes. Sample fresh sashimi at a bustling fish market, enjoy a traditional tea ceremony in a serene garden, or feast on a multi-course kaiseki meal in a Michelin-starred restaurant.",
   paragraph3: "Immerse yourself in Japan's rich cultural heritage as you explore ancient shrines, traditional ryokan inns, and vibrant festivals. Whether you're soaking in a hot spring bath in Hakone, exploring the historic streets of Kyoto, or hiking along the Kumano Kodo pilgrimage trail, each destination offers a glimpse into the soul of this captivating country."
)
Suggestion.create!(
   title: "Nepal",
   quote: "Nepal is a land of Himalayan wonders, where towering peaks, ancient temples, and vibrant cultures await discovery.",
   author: "Unknown",
   subtitle: "Exploring Nepal: From Kathmandu's Bazaars to Everest's Base Camp",
   paragraph1: "Embark on a journey through Nepal and discover a land of breathtaking beauty, rich history, and warm hospitality. From the bustling streets of Kathmandu to the tranquil beauty of Pokhara, this country offers a wealth of experiences for travelers seeking adventure and spiritual enlightenment.",
   paragraph2: "Indulge in the flavors of Nepalese cuisine, where spicy curries, hearty dal bhat, and sweet treats like sel roti delight the taste buds. Sample momos (dumplings) in a local teahouse, enjoy a traditional Newari feast in a historic courtyard, or sip on a cup of sweet chai as you watch the sunset over the Himalayas.",
   paragraph3: "Immerse yourself in Nepal's rich cultural heritage as you explore ancient temples, monasteries, and traditional villages. Whether you're trekking through the Annapurna Sanctuary, rafting down the raging rivers of the Terai, or meditating in the shadow of Mount Everest, each destination offers a glimpse into the soul of this mystical land."
)
Suggestion.create!(
  title: "India",
  quote: "India is a land of wonders, where ancient traditions and spiritual enlightenment await at every turn.",
  author: "Unknown",
  subtitle: "Discovering India: From Delhi's Chaos to Kerala's Backwaters",
  paragraph1: "Embark on a journey through India and discover a land of diverse landscapes, rich history, and vibrant culture. From the bustling streets of Delhi to the tranquil backwaters of Kerala, this vast country offers a wealth of experiences for travelers seeking adventure and enlightenment.",
  paragraph2: "Indulge in the flavors of Indian cuisine, where aromatic spices, bold flavors, and regional specialties tantalize the taste buds. Sample street food delights in a bustling bazaar, feast on traditional thali meals in a family-run restaurant, or savor a cup of masala chai as you watch the sunrise over the Ganges.",
  paragraph3: "Immerse yourself in India's rich cultural heritage as you explore ancient temples, majestic palaces, and colorful festivals. Whether you're trekking through the Himalayas, meditating in an ashram in Rishikesh, or cruising down the backwaters of Kerala, each destination offers a glimpse into the soul of this enchanting country."
)

Suggestion.create!(
  title: "Sri Lanka",
  quote: "Sri Lanka is a tropical paradise, where pristine beaches, ancient ruins, and lush jungles await exploration.",
  author: "Unknown",
  subtitle: "Exploring Sri Lanka: From Colombo's Bustle to the Serenity of Sigiriya",
  paragraph1: "Discover the beauty and diversity of Sri Lanka, where ancient history, rich culture, and natural wonders abound. From the bustling streets of Colombo to the serene beauty of Sigiriya, this island nation offers a wealth of experiences for travelers seeking adventure and relaxation.",
  paragraph2: "Indulge in the flavors of Sri Lankan cuisine, where fragrant spices, fresh seafood, and tropical fruits are the stars of the culinary scene. Sample spicy curries in a local eatery, feast on hoppers and string hoppers for breakfast, or enjoy a traditional Sri Lankan rice and curry meal in a family-run guesthouse.",
  paragraph3: "Immerse yourself in Sri Lanka's rich cultural heritage as you explore ancient temples, colonial forts, and lush tea plantations. Whether you're trekking through the misty hills of Ella, surfing on the pristine beaches of Arugam Bay, or spotting wildlife in Yala National Park, each destination offers a glimpse into the soul of this captivating island."
)
Suggestion.create!(
    title: "Brazil",
    quote: "Brazil is a land of samba rhythms, lush rainforests, and endless beaches, where the spirit of Carnaval pulsates through the streets.",
    author: "Unknown",
    subtitle: "Exploring Brazil: From Rio's Iconic Landmarks to the Amazon Rainforest",
    paragraph1: "Embark on a journey through Brazil and uncover a land of vibrant culture, breathtaking landscapes, and rich biodiversity. From the iconic landmarks of Rio de Janeiro to the pristine wilderness of the Amazon Rainforest, this vast country offers a wealth of experiences for travelers seeking adventure and discovery.",
    paragraph2: "Indulge in the flavors of Brazilian cuisine, where exotic fruits, grilled meats, and savory snacks delight the senses. Sample feijoada, Brazil's national dish, savor a refreshing caipirinha cocktail on the beach, or indulge in a traditional churrasco barbecue in a local rodizio restaurant.",
    paragraph3: "Immerse yourself in Brazil's rich cultural heritage as you explore historic cities, colonial towns, and indigenous villages. Whether you're dancing samba in the streets of Salvador, trekking through the Pantanal wetlands, or marveling at the natural wonder of Iguazu Falls, each destination offers a glimpse into the soul of this captivating country."
)
Suggestion.create!(
  title: "Mexico",
  quote: "Mexico is a land of ancient civilizations, vibrant fiestas, and rich cultural traditions, where every corner tells a story.",
  author: "Unknown",
  subtitle: "Discovering Mexico: From Mexico City's Bustle to the Yucatan's Ruins",
  paragraph1: "Explore the wonders of Mexico, where ancient ruins, colonial architecture, and pristine beaches await at every turn. From the bustling streets of Mexico City to the tranquil beauty of the Riviera Maya, this diverse country offers a wealth of experiences for travelers seeking adventure and relaxation.",
  paragraph2: "Indulge in the flavors of Mexican cuisine, where spicy tacos, flavorful moles, and refreshing aguas frescas tantalize the taste buds. Sample street food delights in a bustling mercado, feast on traditional tamales and pozole in a local cantina, or sip on a margarita as you watch the sunset over the Pacific Ocean.",
  paragraph3: "Immerse yourself in Mexico's rich cultural heritage as you explore ancient pyramids, colorful markets, and vibrant festivals. Whether you're snorkeling in the crystal-clear waters of Cozumel, exploring the historic streets of Oaxaca, or marveling at the pyramids of Teotihuacan, each destination offers a glimpse into the heart and soul of this enchanting country."
)
Suggestion.create!(
  title: "Ecuador",
  quote: "Ecuador is a land of stunning natural beauty, where snow-capped mountains, lush rainforests, and pristine beaches await exploration.",
  author: "Unknown",
  subtitle: "Exploring Ecuador: From Quito's Highlands to the Galapagos Islands",
  paragraph1: "Discover the beauty and diversity of Ecuador, where ancient cultures, vibrant markets, and breathtaking landscapes come together in harmony. From the historic streets of Quito to the pristine shores of the Galapagos Islands, this country offers a wealth of experiences for travelers seeking adventure and immersion in nature.",
  paragraph2: "Indulge in the flavors of Ecuadorian cuisine, where fresh seafood, tropical fruits, and hearty stews are the highlights of the culinary scene. Sample ceviche on the coast, feast on traditional llapingachos in the highlands, or sip on a cup of rich Ecuadorian coffee as you take in the stunning views of the Andes.",
  paragraph3: "Immerse yourself in Ecuador's rich cultural heritage as you explore ancient Inca ruins, colonial churches, and indigenous villages. Whether you're hiking through the cloud forests of Mindo, snorkeling with sea lions in the Galapagos, or shopping for handicrafts in Otavalo Market, each destination offers a glimpse into the soul of this captivating country."
)
Suggestion.create!(
  title: "Colombia",
  quote: "Colombia is a land of diverse landscapes, vibrant cities, and warm hospitality, where every corner reveals a new adventure.",
  author: "Unknown",
  subtitle: "Discovering Colombia: From Bogota's Culture to Cartagena's Charm",
  paragraph1: "Embark on a journey through Colombia and discover a land of stunning natural beauty, rich cultural heritage, and warm hospitality. From the historic streets of Bogota to the picturesque beaches of Cartagena, this diverse country offers a wealth of experiences for travelers seeking adventure and immersion in Latin American culture.",
  paragraph2: "Indulge in the flavors of Colombian cuisine, where fresh seafood, tropical fruits, and hearty soups are the highlights of the culinary scene. Sample arepas in a bustling mercado, feast on bandeja paisa in a traditional restaurant, or sip on a cup of rich Colombian coffee as you watch the sunset over the Caribbean Sea.",
  paragraph3: "Immerse yourself in Colombia's rich cultural heritage as you explore ancient archaeological sites, colonial towns, and indigenous villages. Whether you're hiking through the Andes, exploring the lush coffee region, or dancing salsa in the streets of Cali, each destination offers a glimpse into the soul of this vibrant country."
)
Suggestion.create!(
  title: "Peru",
  quote: "Peru is a land of ancient mysteries, where the legacy of the Inca civilization is etched into the landscape and the spirit of the Andes echoes through the valleys.",
  author: "Unknown",
  subtitle: "Exploring Peru: From Lima's Gastronomy to Machu Picchu's Majesty",
  paragraph1: "Discover the wonders of Peru, where ancient ruins, vibrant markets, and breathtaking landscapes await at every turn. From the historic streets of Lima to the majestic heights of Machu Picchu, this diverse country offers a wealth of experiences for travelers seeking adventure and cultural immersion.",
  paragraph2: "Indulge in the flavors of Peruvian cuisine, where fresh ceviche, flavorful anticuchos, and hearty stews are the highlights of the culinary scene. Sample street food delights in a bustling mercado, feast on traditional pachamanca in the Andes, or sip on a pisco sour as you take in the stunning views of the Sacred Valley.",
  paragraph3: "Immerse yourself in Peru's rich cultural heritage as you explore ancient Inca ruins, colonial churches, and indigenous villages. Whether you're hiking the Inca Trail, cruising down the Amazon River, or exploring the floating islands of Lake Titicaca, each destination offers a glimpse into the soul of this captivating country."
)
Suggestion.create!(
  title: "Argentina",
  quote: "Argentina is a land of passion and beauty, where tango rhythms fill the air and the spirit of the gauchos roams free.",
  author: "Unknown",
  subtitle: "Discovering Argentina: From Buenos Aires' Culture to Patagonia's Wilderness",
  paragraph1: "Embark on a journey through Argentina and discover a land of diverse landscapes, rich culture, and warm hospitality. From the vibrant streets of Buenos Aires to the rugged beauty of Patagonia, this country offers a wealth of experiences for travelers seeking adventure and immersion in Latin American culture.",
  paragraph2: "Indulge in the flavors of Argentine cuisine, where juicy steaks, flavorful empanadas, and dulce de leche delights await. Sample grilled meats in a traditional parrilla, enjoy a mate tea ceremony with locals, or sip on a glass of Malbec wine as you watch the sunset over the vineyards of Mendoza.",
  paragraph3: "Immerse yourself in Argentina's rich cultural heritage as you explore historic neighborhoods, ancient ruins, and lively festivals. Whether you're trekking through the Andes, tango dancing in Buenos Aires, or marveling at the Iguazu Falls, each destination offers a glimpse into the soul of this captivating country."
)
Suggestion.create!(
  title: "Bolivia",
  quote: "Bolivia is a land of ancient traditions and stunning landscapes, where the spirit of the Andes runs deep and the colors of the markets dazzle the senses.",
  author: "Unknown",
  subtitle: "Exploring Bolivia: From La Paz's Heights to the Salt Flats of Uyuni",
  paragraph1: "Discover the beauty and diversity of Bolivia, where towering mountains, vast salt flats, and colorful markets await at every turn. From the bustling streets of La Paz to the remote wilderness of the Altiplano, this country offers a wealth of experiences for travelers seeking adventure and cultural immersion.",
  paragraph2: "Indulge in the flavors of Bolivian cuisine, where hearty soups, spicy stews, and fresh produce are the highlights of the culinary scene. Sample street food delights in a bustling mercado, feast on traditional salteñas in a local cafe, or sip on a cup of coca tea to combat altitude sickness in the Andes.",
  paragraph3: "Immerse yourself in Bolivia's rich cultural heritage as you explore ancient ruins, colonial cities, and indigenous villages. Whether you're hiking through the Cordillera Real, exploring the silver mines of Potosi, or marveling at the wildlife of the Amazon Rainforest, each destination offers a glimpse into the soul of this enchanting country."

# Seed data for users

User.destroy_all
Trip.destroy_all
DailySchedule.destroy_all

user1 = User.create!(
  email: 'john.doe@example.com',
  password: 'password123',
  nickname: 'Johhan'
)

user2 = User.create!(
  email: 'jim.lahey@trailer.com',
  password: 'password456',
  nickname: 'Jimbo'
)

user3 = User.create!(
  email: 'alice.smith@example.com',
  password: 'password789',
  nickname: 'Alice'
)

# Seed data for trips
trip1 = Trip.create!(
  flights: 123.45,
  text_suggestion: 'A trip to Paris',
  location: 'Paris, France',
  preferences: 'None',
  start_date: Date.today,
  end_date: Date.today + 7
)

trip2 = Trip.create!(
  flights: 234.56,
  text_suggestion: 'A trip to London',
  location: 'London, UK',
  preferences: 'None',
  start_date: Date.today + 14,
  end_date: Date.today + 21
)

# Seed data for daily_schedules
schedule1 = DailySchedule.create!(
  date: Date.today,
  plan: 'Visit Eiffel Tower and Louvre Museum',
  trip_id: 1
)

schedule2 = DailySchedule.create!(
  date: Date.today + 1,
  plan: 'Explore the Montmartre district',
  trip_id: 1
)

schedule3 = DailySchedule.create!(
  date: Date.today + 2,
  plan: 'Take a Seine river cruise',
  trip_id: 1
)

schedule4 = DailySchedule.create!(
  date: Date.today + 14,
  plan: 'Visit the British Museum',
  trip_id: 2
)

schedule5 = DailySchedule.create!(
  date: Date.today + 15,
  plan: 'Explore the Tower of London',
  trip_id: 2
)

schedule6 = DailySchedule.create!(
  date: Date.today + 16,
  plan: 'Take a ride on the London Eye',
  trip_id: 2
)

# Seed data for user_trips
trip1 = UserTrip.create!(
  user_id: 1,
  trip_id: 1
)

trip2 = UserTrip.create!(
  user_id: 2,
  trip_id: 1
)

trip3 = UserTrip.create!(
  user_id: 3,
  trip_id: 2
)

trip4 = UserTrip.create!(
  user_id: 1,
  trip_id: 2
)

trip5 = UserTrip.create!(
  user_id: 2,
  trip_id: 2
)

trip6 = UserTrip.create!(
  user_id: 3,
  trip_id: 1
)
