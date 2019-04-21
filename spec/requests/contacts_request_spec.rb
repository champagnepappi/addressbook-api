require 'rspec/rails/swagger'
require 'rails_helper'

RSpec.describe 'Contacts', type: :request, capture_example: true do
  path '/contacts' do
    get(summary: 'Get contacts') do
      consumes 'application/json'
      produces 'application/json'
      tags :contacts
      let!(:contacts) { create_list(:contacts, 10) }

      response(200, description: 'Return all available contacts') do
        it 'Returns 10 contacts' do
          body = JSON(response.body)
          expect(body.count).to eq(10)
        end
      end
    end
  end
end
