require 'rspec/rails/swagger'
require 'rails_helper'

RSpec.configure do |config|
  # Specify a root directory where the generated Swagger files will be saved.
  config.swagger_root = Rails.root.to_s + '/swagger'

  # Define one or more Swagger documents and global metadata for each.
  config.swagger_docs = {
    'v1/swagger.json' => {
      swagger: '2.0',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      definitions: {
        createContact: {
          type: :object,
          properties: {
            data: {
              type: :object,
              required: %i[name phone email address],
              properties: {
                name: { type: :string, example: 'santos' },
                phone: { type: :string, example: '+254 712345678' },
                email: { type: :string, example: 'santos@gmail.com' },
                address: { type: :string, example: 'P.O BOX 123456' }
              }
            }
          }
        }
      }
    }
  }
end
