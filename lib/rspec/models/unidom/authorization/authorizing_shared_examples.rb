shared_examples 'Unidom::Authorization::Authorizing' do |model_attributes, authorizer_class_list, authorizer_attributes_list|

  before :each do
  end

  after :each do
  end

  context do

    authorizer_class_list.each_with_index do |authorizer_class, index|
      it_behaves_like 'belongs_to', model_attributes, :authorizer, authorizer_class, authorizer_attributes_list[index]
    end

    it_behaves_like 'polymorphic scope', model_attributes, :authorized_by, :authorizer, authorizer_class_list

  end

end
