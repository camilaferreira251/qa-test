require "spec_helper"
require "webmock/rspec"



describe 'acessar conta' do
it "dados corretos" do
stub_request(:get, "https://app.account/me").

   with(:body => {
          'Content-Type'=>'application/json',
          'string' => '{"user_id":"11oaO9XwEpTm6","name":"QA User","email":"qa@veek.com.br","userState":"Active","userPlan":"Amazing Phone Plan","phone":5511989898787}'
        }).

   to_return(:status => 200, :body => "OK")
end

it "dados incorretos" do
stub_request(:get, "https://app.account/me").

   with(:body => {
          'Content-Type'=>'application/json',
          'string' => '{"email":"qa@veek.com.br","password":"123"}'
        }).

   to_return(:status => 400, :body => "Request was not validated")
end

end

