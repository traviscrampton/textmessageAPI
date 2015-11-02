require 'rails_helper'

describe Message, vcr: true do
  it "doesn't save the message if twilio gives an error" do
    message = Message.new(body: "Hola", :to => "111111", :from => "8052508054")
    expect(message.save).to eq false
  end
end
