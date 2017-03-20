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

    it_behaves_like 'validates text', model_attributes, :name,
      length: 2..described_class.columns_hash['name'].limit
    it_behaves_like 'validates text', model_attributes, :path,
      length: 2..described_class.columns_hash['path'].limit

    it_behaves_like 'scope', :path_is, [
      { attributes_collection: [ model_attributes ], count_diff: 1, args: [ model_attributes[:path]           ] },
      { attributes_collection: [ model_attributes ], count_diff: 0, args: [ "/#{model_attributes[:path]}"     ] },
      { attributes_collection: [ model_attributes ], count_diff: 0, args: [ "#{model_attributes[:path]}.html" ] } ]

    it_behaves_like 'Unidom::Authorization::Concerns::AsPermission', model_attributes

  end

end
