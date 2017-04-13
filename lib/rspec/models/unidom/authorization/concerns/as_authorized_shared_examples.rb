shared_examples 'Unidom::Authorization::Concerns::AsAuthorized' do |model_attributes, permission, authorizer|

  before :each do
    @authorized = described_class.create! model_attributes
  end

  after :each do
  end

  context '#is_authorized!' do

    it "should be able to be authorized by #{authorizer.inspect}" do
      authorizing = @authorized.is_authorized! permission: permission, by: authorizer
      expect(authorizing).to     be_present
      expect(authorizing).to     be_a(Unidom::Authorization::Authorizing)
      expect(authorizing).not_to be_new_record
    end

    it "should be able to be authorized by #{authorizer.inspect}, at #{Time.now.inspect}" do
      authorizing = @authorized.is_authorized! permission: permission, by: authorizer, at: Time.now
      expect(authorizing).to     be_present
      expect(authorizing).to     be_a(Unidom::Authorization::Authorizing)
      expect(authorizing).not_to be_new_record
    end

  end

  context '#is_authorized?' do

    it "should be able to be authorized by #{authorizer.inspect}" do
      expect(@authorized.is_authorized? permission: permission).to be_falsey
      @authorized.is_authorized!        permission: permission, by: authorizer
      expect(@authorized.is_authorized? permission: permission).to be_truthy
    end

    it "should be able to be authorized by #{authorizer.inspect}, at #{Time.now.inspect}" do
      expect(@authorized.is_authorized? permission: permission, at: Time.now).to be_falsey
      @authorized.is_authorized!        permission: permission, by: authorizer, at: Time.now
      expect(@authorized.is_authorized? permission: permission, at: Time.now).to be_truthy
    end

  end

  context '#is_prohibited!' do

    it "should be able to be prohibited" do
      authorizing = @authorized.is_authorized! permission: permission, by: authorizer
      expect(authorizing).to     be_present
      expect(authorizing).to     be_a(Unidom::Authorization::Authorizing)
      expect(authorizing).not_to be_new_record

      prohibiting = @authorized.is_prohibited! permission: permission
      expect(prohibiting).to be_present
      expect(prohibiting).to eq(1)
    end

    it "should be able to be prohibited at #{Time.now.inspect}" do
      authorizing = @authorized.is_authorized! permission: permission, by: authorizer, at: Time.now
      expect(authorizing).to     be_present
      expect(authorizing).to     be_a(Unidom::Authorization::Authorizing)
      expect(authorizing).not_to be_new_record

      prohibiting = @authorized.is_prohibited! permission: permission, at: Time.now
      expect(prohibiting).to be_present
      expect(prohibiting).to eq(1)
    end

  end

  context do

    authorizing_1_attribtues = {
        permission_id:   SecureRandom.uuid,
        authorizer_id:   SecureRandom.uuid,
        authorizer_type: 'Unidom::Authorization::Authorizer::Mock'
      }

    authorizing_2_attribtues = {
        permission_id:   SecureRandom.uuid,
        authorizer_id:   SecureRandom.uuid,
        authorizer_type: 'Unidom::Authorization::Authorizer::Mock'
      }

    it_behaves_like 'has_many', model_attributes, :authorizings, Unidom::Authorization::Authorizing, [ authorizing_1_attribtues, authorizing_2_attribtues ]

    authorized = described_class.create! model_attributes
    it_behaves_like 'assert_present!', authorized, :is_authorized!, [ { permission: permission, by: authorizer, at: Time.now } ], [ :permission, :by, :at ]
    it_behaves_like 'assert_present!', authorized, :is_authorized?, [ { permission: permission,                 at: Time.now } ], [ :permission,      :at ]
    it_behaves_like 'assert_present!', authorized, :is_prohibited!, [ { permission: permission,                 at: Time.now } ], [ :permission,      :at ]

  end

end
