require 'spec_helper'

describe 'Checkout' do

  before(:each) do
    @one_tea_for_free = BuyOneGetOne.new('FR1')
    @volume_apples = VolumeRebate.new('AP1', 3, 10)
    @co = Checkout.new([@one_tea_for_free, @volume_apples])
  end

  it 'two Fruit teas, one for free, rest as marked' do
    %w(FR1 AP1 FR1 CF1).each do |item|
      @co.scan(item)
    end

    #in challange but must does not correspond with basic Arithmetic :) 3,11 + 5 + 3,11 + 11,23 = 22,45 - One Tea (3,11) = 19,34
    #expect(@co.total).to eq( "$22.25" )

    expect(@co.total).to eq( "$19.34" )

  end

  it 'buy two apples get one for free' do
    %w(FR1 FR1).each do |item|
      @co.scan(item)
    end
    expect(@co.total).to eq( "$3.11" )
  end

  it 'three apples should yeild a $1,5 discount' do
    %w(AP1 AP1 FR1 AP1).each do |item|
      @co.scan(item)
    end
    expect(@co.total).to eq( "$16.61" )
  end

end