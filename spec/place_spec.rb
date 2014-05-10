require 'spec_helper'

require_relative '../lib/ally/detector/place'

describe Ally::Detector::Place do
  context 'detect place' do
    it 'by itself' do
      r = subject.inquiry('statue of liberty').detect
      r.first['geometry']['location']['lat'].should == 40.689249
      r.first['geometry']['location']['lng'].should == -74.0445
    end

    it 'with a reference to a street' do
      r = subject.inquiry('I\'m an alumni of my old college at 295 old westport road, MA').detect
      r.first['formatted_address'].should == 'Old Westport Rd, Dartmouth, MA 02747, USA'
    end
  end
end
