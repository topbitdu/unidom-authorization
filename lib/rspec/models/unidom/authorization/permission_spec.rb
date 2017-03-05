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

    name_max_length = described_class.columns_hash['name'].limit
    path_max_length = described_class.columns_hash['path'].limit

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates', model_attributes, :name,
      {             } => 0,
      { name: nil   } => 2,
      { name: ''    } => 2,
      { name: '1'   } => 1,
      { name: 'A'   } => 1,
      { name: '11'  } => 0,
      { name: 'AA'  } => 0,
      { name: '111' } => 0,
      { name: 'AAA' } => 0,
      { name: '1'*(name_max_length-1) } => 0,
      { name: 'A'*(name_max_length-1) } => 0,
      { name: '1'*name_max_length     } => 0,
      { name: 'A'*name_max_length     } => 0,
      { name: '1'*(name_max_length+1) } => 1,
      { name: 'A'*(name_max_length+1) } => 1

    it_behaves_like 'validates', model_attributes, :path,
      {             } => 0,
      { path: nil   } => 0,
      { path: ''    } => 0,
      { path: '1'   } => 1,
      { path: 'A'   } => 1,
      { path: '11'  } => 0,
      { path: 'AA'  } => 0,
      { path: '111' } => 0,
      { path: 'AAA' } => 0,
      { path: '1'*(path_max_length-1) } => 0,
      { path: 'A'*(path_max_length-1) } => 0,
      { path: '1'*path_max_length     } => 0,
      { path: 'A'*path_max_length     } => 0,
      { path: '1'*(path_max_length+1) } => 1,
      { path: 'A'*(path_max_length+1) } => 1

    it_behaves_like 'scope', :path_is, [
      { attributes_collection: [ model_attributes ], count_diff: 1, args: [ model_attributes[:path]           ] },
      { attributes_collection: [ model_attributes ], count_diff: 0, args: [ "/#{model_attributes[:path]}"     ] },
      { attributes_collection: [ model_attributes ], count_diff: 0, args: [ "#{model_attributes[:path]}.html" ] } ]

  end

end
