shared_examples 'Unidom::Authorization::Concerns::AsPermission' do |model_attributes, authorized, authorizer|

  context do

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

    permission = described_class.create! model_attributes
    it_behaves_like 'assert_present!', permission, :authorize!, [ authorized, { by: authorizer, at: Time.now } ], [ { 0 => :authorized }, :by, :at ]
    it_behaves_like 'assert_present!', permission, :authorize?, [ authorized, {                 at: Time.now } ], [ { 0 => :authorized },      :at ]
    it_behaves_like 'assert_present!', permission, :prohibit!,  [ authorized, {                 at: Time.now } ], [ { 0 => :authorized },      :at ]

  end

end
