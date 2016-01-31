describe User do

  before(:each) {
    @user = create :user
  }

  subject { @user }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match 'test.com'
  end

  it "creates an admin" do
    admin = create :admin
    expect(admin.admin).to be 1
  end

  it "scopes admin" do
      create :admin
      expect(User.admin.first.admin).to be 1
  end
end
