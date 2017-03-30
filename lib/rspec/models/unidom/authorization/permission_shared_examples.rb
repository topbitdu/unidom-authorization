shared_examples 'Unidom::Authorization::Permission' do |model_attributes, authorized, authorizer|

  context do

    it_behaves_like 'Unidom::Authorization::Concerns::AsPermission', model_attributes, authorized, authorizer

  end

end
