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

  it 'delete request should be delete method' do
    page.driver.delete('/test', params: { test: '1', hel: '2' })
    Trap.last.request_method.should eq 'DELETE'
  end

  it 'post request should be post method' do
    page.driver.post('/test', params: { test: '1', hel: '2' })
    Trap.last.request_method.should eq 'POST'
  end

  it 'get request should be get method' do
    page.driver.get('/test', params: { test: '1', hel: '2' })
    Trap.last.request_method.should eq 'GET'
  end

  it 'put request should be put method' do
    page.driver.put('/test', params: { test: '1', hel: '2' })
    Trap.last.request_method.should eq 'PUT'
  end

end