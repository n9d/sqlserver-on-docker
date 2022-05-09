
#require 'rubygems' #bundlerを使わない場合
require 'bundler/setup' #bundlerを使う場合
require 'tiny_tds'

client = TinyTds::Client.new username: 'SA', password: 'P@ssw0rd', host: 'sqlserver', port: 1433, database: 'TestDB', azure: false

results = client.execute 'SELECT * FROM inventory'

p results

results.each do |row|
  puts row['name']
end
