require 'rspec/rails/swagger'
require 'rails_helper'

RSpec.describe 'Contacts', type: :request, capture_example: true do
  path '/contacts' do
    get(summary: 'Get contacts') do
      consumes 'application/json'
      produces 'application/json'
      tags :contacts
      let!(:contacts) { create_list(:contacts, 10) }
    end
  end
end
