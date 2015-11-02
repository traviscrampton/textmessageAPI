class Message < ActiveRecord::Base
  belongs_to :contact
    before_create :send_sms

private

  def send_sms
    begin
      response = RestClient::Request.new(
      :method => :post,
      :url => 'https://api.twilio.com/2010-04-01/Accounts/AC0d858fcfbfd335ae2d0faa190bc56b70/Messages.json',
      :user => 'AC0d858fcfbfd335ae2d0faa190bc56b70',
      :password => '7e8301db7d163c2dc799a765db244d81',
      :payload => { :Body => body,
                    :From => from,
                    :To => to}
      ).execute
    rescue
      false
    end
  end
end
