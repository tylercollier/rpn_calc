require_relative '../../app/rpn/math'

describe RPN::Math do
  it 'raises a specific error when in invalid operator is used' do
    expect { subject.arity 'some invalid operator' }.to raise_error(RPN::InvalidOperatorError)
  end

  it 'can handle unary operators such as ++' do
    expect(subject.compute '++', 2).to eq(3)
  end
end
