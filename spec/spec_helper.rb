# frozen_string_literal: true

require 'pry'

$LOAD_PATH.unshift(File.dirname(__FILE__))

Dir[File.expand_path('../lib/**/*.rb', __dir__)].each { |f| require f }
