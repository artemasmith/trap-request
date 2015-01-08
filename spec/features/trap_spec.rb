require 'spec_helper'

describe 'Requests' do
  it 'should record post requests' do
    expect{page.driver.post('/test', params: { test: '1', hel: '2' })}.to change{Trap.count}.by(1)
    page.driver.status_code.should eql 200
  end

  it 'should record put request' do
    expect{page.driver.put('/test', params: { test: '1', hel: '2' })}.to change{Trap.count}.by(1)
    page.driver.status_code.should eql 200
  end

  it 'should record get request' do
    expect{page.driver.get('/test', params: { test: '1', hel: '2' })}.to change{Trap.count}.by(1)
    page.driver.status_code.should eql 200
  end

  it 'should record delete request' do
    expect{page.driver.delete('/test', params: { test: '1', hel: '2' })}.to change{Trap.count}.by(1)
    page.driver.status_code.should eql 200
  end
end