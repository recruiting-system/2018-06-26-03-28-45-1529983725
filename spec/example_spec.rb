require 'json'
require_relative '../app'

RSpec.describe '#TestRunner4Ruby' do
  before do
    file = File.read('test-data.json')
    @test_data = JSON.parse(file)
  end

  it 'tests custom code against test data' do
    app = App.new
    @test_data.each do |test_datum|
      expected_result = test_datum['expectedResult']
      result = app.run(*test_datum['params'])
      expect(result).to eq expected_result
    end
  end
end