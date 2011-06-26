Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, '91kXnXdh8QQxUMwucVyq5A', '2oglRbuepl0ThhZtuifDomvrA5xS3hP7iBI0JvZqC4'
  provider :facebook, '212245775478437', '832c0e6ec78587ce1677bd5a4762b733'
  provider :linked_in, 'yxhhwHM4xxgAAtPaePBei7jDOSu--9G0v3Ro53PkaA3sX9z60slv-fkG_-sL0cNt', '2KPzgqcj3MIDalSZm5h2tLJKT0u4Ub7QE8aFpBMgyldQpcJU-tHGzykdCkT-5_d5'
end