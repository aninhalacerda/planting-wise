require 'sinatra'
require 'mongoid'

# DB Setup
Mongoid.load! "config/mongoid.yml"

# Model
class Entry
  include Mongoid::Document

  field :umidade, type: Numeric
  validates :umidade, presence: true
end

# Endpoints
get '/' do
  entries = Entry.all
  entries.to_json
end

post '/umidade/:umidade' do
  Entry.create(umidade: params[:umidade])
end
