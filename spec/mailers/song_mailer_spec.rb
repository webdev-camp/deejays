
RSpec.describe SongMailer, :type => :mailer do
  let(:song) { create :song }

  shared_examples_for "an song mail" do
    describe "mail basics" do
      it 'renders the subject' do
        expect(mail.subject.to_s).to include( "song")
      end
      it 'renders the receiver email' do
        expect(mail.to).to eq([Rails.application.secrets.admin_email])
      end
    end
    describe "song details" do
      it "includes the total price" do
        expect(mail.body).to include(song.id)
        expect(mail.body).to include( song.title)
        expect(mail.body).to include( song.artist)
      end
    end
  end

  describe 'notification mail' do
    let(:mail) { SongMailer.notify(song) }
      it_should_behave_like "an song mail" do
    end
    it "should include song" do
      expect(mail.body).to include("new Song")
    end
  end

end
