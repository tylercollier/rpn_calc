require_relative '../app/rpn_calc'

describe RpnCalc do
  it 'properly computes example inputs' do
    %w(5 8 +).each do |term|
      subject.add_term term
    end
    expect(subject.peek).to eq(13)
    %w(-3 -2 * 5 +).each do |term|
      subject.add_term term
    end
    expect(subject.peek).to eq(11)
    %w(2 9 3 + *).each do |term|
      subject.add_term term
    end
    expect(subject.peek).to eq(24)
    %w(20 13 - 2 /).each do |term|
      subject.add_term term
    end
    expect(subject.peek).to eq(3.5)
  end
end
