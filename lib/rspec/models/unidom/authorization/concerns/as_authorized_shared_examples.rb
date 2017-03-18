shared_examples 'Unidom::Authorization::Concerns::AsAuthorized' do |model_attributes|

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

end
