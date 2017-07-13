SETTING = YAML.load_file("#{Rails.root}/config/elasticsearchsetting.yml")['elasticsearch']
puts `curl -XDELETE #{SETTING['host']}:#{SETTING['port']}/#{SETTING['index']}`
def create
  (1.upto(100000)).each do |n|
    gender = ["Male","Female"].sample
    #name = ["N'gambi","Ng'ombe","O'neal"]
    person = {}
    person["id"] = n
    person["first_name"]= Faker::Name.first_name
    person["last_name"] =  Faker::Name.last_name
    person["middle_name"] = [Faker::Name.first_name,""].sample
    person["gender"] = gender
    person["birthdate"]= Faker::Time.between("1964-01-01".to_time, Time.now()).to_date
    person["birthdate_estimated"] = 1
    person["date_of_death"] = Date.today
    person["nationality"]=  "Malawi"
    person["place_of_birth"] = "Health Facility"
    person["district"] = JSON.parse(File.open("#{Rails.root}/app/assets/data/districts.json").read).keys.sample
    person["mother_first_name"]= Faker::Name.first_name
    person["mother_last_name"] =  Faker::Name.last_name
    person["mother_middle_name"] = [Faker::Name.first_name,""].sample
    person["father_first_name"]= Faker::Name.first_name
    person["father_last_name"] =  Faker::Name.last_name
    person["father_middle_name"] = [Faker::Name.first_name,""].sample 

    SimpleElasticSearch.add(person)

    puts "#{person["first_name"]} #{person["last_name"]}"
  end

end

create