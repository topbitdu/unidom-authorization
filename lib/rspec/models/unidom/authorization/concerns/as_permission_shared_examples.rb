shared_examples 'Unidom::Authorization::Concerns::AsPermission' do |model_attributes|

  authorizing_1_attribtues = {
      authorized_id:   SecureRandom.uuid,
      authorized_type: 'Unidom::Authorization::Authorized::Mock',
      authorizer_id:   SecureRandom.uuid,
      authorizer_type: 'Unidom::Authorization::Authorizer::Mock'
    }

  authorizing_2_attribtues = {
      authorized_id:   SecureRandom.uuid,
      authorized_type: 'Unidom::Authorization::Authorized::Mock',
      authorizer_id:   SecureRandom.uuid,
      authorizer_type: 'Unidom::Authorization::Authorizer::Mock'
    }

  it_behaves_like 'has_many', model_attributes, :authorizings, Unidom::Authorization::Authorizing, [ authorizing_1_attribtues, authorizing_2_attribtues ]

end
