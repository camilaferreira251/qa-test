require "spec_helper"
require "webmock/rspec"



describe 'acesso valido' do
it "dados corretos" do
stub_request(:post, "http://app.auth/login").

   with(:body => {
          'Content-Type'=>'application/json',
          'string' => '{"email":"qa@veek.com.br","password":"123456"}'
        }).

   to_return(:status => 200, :body => "OK")
end
end

describe 'incompletos' do
it "email" do
stub_request(:post, "http://app.auth/login").

   with(:body => {
          'Content-Type'=>'application/json',
          'string' => '{"email":"","password":"123456"}'
        }).

   to_return(:status => 422, :body => "Email is required")
end

it "password incorreto" do
stub_request(:post, "http://app.auth/login").

   with(:body => {
          'Content-Type'=>'application/json',
          'string' => '{"email":"qa@veek.com.br","password":"12345"}'
        }).

   to_return(:status => 422, :body => "Invalid password")
end

it "password" do
stub_request(:post, "http://app.auth/login").

   with(:body => {
          'Content-Type'=>'application/json',
          'string' => '{"email":"qa@veek.com.br","password":""}'
        }).

   to_return(:status => 422, :body => "Password is required")
end

it "email invalido" do
stub_request(:post, "http://app.auth/login").

   with(:body => {
          'Content-Type'=>'application/json',
          'string' => '{"email":"qaveek.com.br","password":"12345"}'
        }).

   to_return(:status => 422, :body => "Invalid email")
end

end

