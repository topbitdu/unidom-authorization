shared_examples 'Unidom::Authorization::Concerns::AsPermission' do |model_attributes, authorized, authorizer|

  before :each do
    @permission = described_class.create! model_attributes
  end

  after :each do
  end

  context '#authorize!' do

    it "should be able to authorize #{authorized.inspect} by #{authorizer.inspect}" do
      authorizing = @permission.authorize! authorized, by: authorizer
      expect(authorizing).to     be_present
      expect(authorizing).to     be_a(Unidom::Authorization::Authorizing)
      expect(authorizing).not_to be_new_record
    end

    it "should be able to authorize #{authorized.inspect} by #{authorizer.inspect}, at #{Time.now.inspect}" do
      authorizing = @permission.authorize! authorized, by: authorizer, at: Time.now
      expect(authorizing).to     be_present
      expect(authorizing).to     be_a(Unidom::Authorization::Authorizing)
      expect(authorizing).not_to be_new_record
    end

  end

  context '#authorize?' do

    it "should be able to authorize #{authorized.inspect} by #{authorizer.inspect}" do
      expect(@permission.authorize? authorized).to be_falsey
      @permission.authorize!        authorized, by: authorizer
      expect(@permission.authorize? authorized).to be_truthy
    end

    it "should be able to authorize #{authorized.inspect} by #{authorizer.inspect}, at #{Time.now.inspect}" do
      expect(@permission.authorize? authorized, at: Time.now).to be_falsey
      @permission.authorize!        authorized, by: authorizer, at: Time.now
      expect(@permission.authorize? authorized, at: Time.now).to be_truthy
    end

  end

  context '#prohibit!' do

    it "should be able to prohibit #{authorized.inspect}" do
      authorizing = @permission.authorize! authorized, by: authorizer
      expect(authorizing).to     be_present
      expect(authorizing).to     be_a(Unidom::Authorization::Authorizing)
      expect(authorizing).not_to be_new_record

      prohibiting = @permission.prohibit! authorized
      expect(prohibiting).to be_present
      expect(prohibiting).to eq(1)
    end

    it "should be able to prohibit #{authorized.inspect} at #{Time.now.inspect}" do
      authorizing = @permission.authorize! authorized, by: authorizer, at: Time.now
      expect(authorizing).to     be_present
      expect(authorizing).to     be_a(Unidom::Authorization::Authorizing)
      expect(authorizing).not_to be_new_record

      prohibiting = @permission.prohibit! authorized, at: Time.now
      expect(prohibiting).to be_present
      expect(prohibiting).to eq(1)
    end

  end

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
