shared_examples 'Unidom::Authorization::Concerns::AsAuthorized' do |model_attributes, permission, authorizer|

  context do

    authorizing_1_attribtues = {
        permission_id:   SecureRandom.uuid,
        authorizer_id:   SecureRandom.uuid,
        authorizer_type: 'Unidom::Authorization::Authorizer::Mock'
      }

    authorizing_2_attribtues = {
        permission_id:   SecureRandom.uuid,
        authorizer_id:   SecureRandom.uuid,
        authorizer_type: 'Unidom::Authorization::Authorizer::Mock'
      }

    it_behaves_like 'has_many', model_attributes, :authorizings, Unidom::Authorization::Authorizing, [ authorizing_1_attribtues, authorizing_2_attribtues ]

    authorized = described_class.create! model_attributes
    it_behaves_like 'assert_present!', authorized, :is_authorized!, [ { permission: permission, by: authorizer, at: Time.now } ], [ :permission, :by, :at ]
    it_behaves_like 'assert_present!', authorized, :is_authorized?, [ { permission: permission,                 at: Time.now } ], [ :permission,      :at ]
    it_behaves_like 'assert_present!', authorized, :is_prohibited!, [ { permission: permission,                 at: Time.now } ], [ :permission,      :at ]

  end

end
