return unless Rails.env.development?

User.create!(
  email: 'user@email.com',
  password: 'nopasswd'
)

Hospital.create!(
  acronym: 'HMSJ',
  name: 'Hospital Municipal São José',
  city: 'Joinville',
  phone_number: '(47) 3441-6666',
  email: 'hmsj@joinville.sc.br'
)

Hospital.create!(
  acronym: 'HRHDS',
  name: 'Hospital Regional Hans Dieter Schmidt',
  city: 'Joinville',
  phone_number: '(47) 3461-5500',
  email: 'hrhds@saude.sc.gov.br'
)
