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

    post(summary: 'Create contact') do
      consumes 'application/json'
      produces 'application/json'
      tags :contacts
      parameter :data,
        in: :body,
        required: true,
        schema: {
          '$ref' => '#/definitions/createContact'
        }
      
      response(201, description: 'Contact created') do
        let(:data) do
          {
            data: {
              name: 'Ruby Maphia',
              phone: '+254 712345678',
              email: 'rmaphia@gmail.com',
              address: 'P.O BOX 1234567 NY'
            }
          }
        end
      end
    end
  end
end
