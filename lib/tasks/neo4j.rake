namespace :neo4j do
    desc "Seed Neo4j database"
    task :db_seed => [:environment, :db_clear, :load_data]

    desc "sandbox"
    task :sandbox => :environment do
        user = create_user
        category = create_category
        asset = create_asset
        book = create_book(user, category)
        [user, category, asset, book].each{|n| puts n.inspect}
    end

    desc "Load data"
    task :load_data => :environment do
        users = (1..10).to_a.map{|n| create_user}
        categories = (1..10).to_a.map{|n| create_category}
        assets = (1..20).to_a.map{|n| create_asset}
        books = (1..40).to_a.map do |n| 
            user = users.sample
            sample_categories = categories.sample(3)
            create_book(user, sample_categories)
        end
    end

    desc "Clear Neo4j database"
    task :db_clear => :environment do
        User.destroy_all
        Category.destroy_all
        Asset.destroy_all
        Book.destroy_all
    end

    def create_user
        fname, lname = Faker::Name.first_name, Faker::Name.last_name
        full_name = "#{fname} #{lname}"
        email = "#{fname.parameterize}@#{lname.parameterize}.com"
        User.create(name: full_name, email: email)
    end

    def create_category
        Category.create(name: Faker::Color.color_name.capitalize)
    end

    def create_asset
        Asset.create(title: Faker::Vehicle.make_and_model)
    end

    def create_book(user, category)
        Book.create(isbn: Faker::Code.isbn, title: Faker::Book.title, year_published: Faker::Number.between(from: 1950, to: 2019), author: user, categories: category)
    end
end