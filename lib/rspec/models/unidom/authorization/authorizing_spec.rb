describe Unidom::Authorization::Authorizing, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      authorizer_id:   SecureRandom.uuid,
      authorizer_type: 'Unidom::Authorization::Authorizer::Mock',
      authorized_id:   SecureRandom.uuid,
      authorized_type: 'Unidom::Authorization::Authorized::Mock',
      permission_id:   SecureRandom.uuid
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    permission_attributes = {
      name: 'User Management',
      path: 'administration/users'
    }

    it_behaves_like 'belongs_to', model_attributes, :permission, Unidom::Authorization::Permission, permission_attributes

    it_behaves_like 'monomorphic scope', model_attributes, :permission_is, :permission

  end

end
