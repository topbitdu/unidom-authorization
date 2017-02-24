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

    it_behaves_like 'scope', :path_is, [
      { attributes_collection: [ model_attributes ], count_diff: 1, args: [ model_attributes[:path]           ] },
      { attributes_collection: [ model_attributes ], count_diff: 0, args: [ "/#{model_attributes[:path]}"     ] },
      { attributes_collection: [ model_attributes ], count_diff: 0, args: [ "#{model_attributes[:path]}.html" ] } ]

  end

end
