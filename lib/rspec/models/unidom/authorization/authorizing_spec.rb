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

    #it_behaves_like 'belongs_to', model_attributes, :permission, Unidom::Authorization::Permission, { name: 'User Management', path: 'administration/users'}

    it_behaves_like 'scope', :permission_is, [
      { attributes_collection: [ model_attributes ], count_diff: 1, args: [ model_attributes[:permission_id] ] },
      { attributes_collection: [ model_attributes ], count_diff: 1, args: [ Unidom::Authorization::Permission.new(id: model_attributes[:permission_id]) ] },
      { attributes_collection: [ model_attributes ], count_diff: 0, args: [ model_attributes[:authorized_id] ] },
      { attributes_collection: [ model_attributes ], count_diff: 0, args: [ Unidom::Authorization::Permission.new(id: model_attributes[:authorized_id]) ] } ]

  end

end
