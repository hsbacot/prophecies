# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'coffeescript', :input => 'coffeescript', :output => 'public/js'
guard 'sass', :input => 'sass', :output => 'public/css'

guard :rspec do
  watch(%r{^spec/.+_spec\.rb$})
end