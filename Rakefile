require 'rake'
require 'faker'

# require 'rspec/core/rake_task'
require_relative 'db/config'
require_relative 'app/models/contact'

desc "create the database"
task "db:create" do
  touch 'db/ar-address.sqlite3'
end

desc "seed the database"
task "db:seed" do 

  1000.times do
    Contact.create :first_name    => Faker::Name.first_name,
                     :last_name     => Faker::Name.last_name,
                     :company       => Faker::Company.name,
                     :phone_number  => Faker::Number.number(10),
                     :email         => Faker::Internet.email
  end

  # #create
  Contact.create(first_name: 'Alex', 
                        last_name: 'Fiore',
                        company: 'Unemployed',
                        phone_number: '14088921154',
                        email: 'blah@blah.com')

  # #destroy
  Contact.find_by_id(999).destroy

  # #update contact
  Contact.find_by_id(998).update(first_name: 'Alex', 
                                 last_name: 'Fiore',
                                 company: 'Unemployed',
                                 phone_number: '14088921154',
                                 email: 'blah@blah.com')

  # #show all
  Contact.all

end

desc "drop the database"
task "db:drop" do
  rm_f 'db/ar-address.sqlite3'
end

desc "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
task "db:migrate" do
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
    ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
  end
end


desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

