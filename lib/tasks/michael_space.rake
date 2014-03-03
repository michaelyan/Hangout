namespace :michael_space do
  desc "TODO"
  task import_data: :environment do
      csv_location = Rails.root.join('app', 'assets', 'FDNY_Firehouse_Listing.csv')
      file = File.new(csv_location, "r")
      file.each_line do |line|
          split = line.split(",")
          name = split[0]
          address = split[1]
          borough = split[2]
          f = Firehouse.new(name: name, address: address, borough: borough)
          f.save
      end
  end

end
