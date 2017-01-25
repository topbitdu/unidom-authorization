describe Unidom::Authorization::Permission, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      name: 'User Management',
      path: 'users'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
