return unless Rails.env.development?

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

User.create!(
  email: 'dev.one@email.com',
  password: 'nopasswd',
  hospital: Hospital.first
)

User.create!(
  email: 'dev.two@email.com',
  password: 'nopasswd',
  hospital: Hospital.last
)

User.create!(
  email: 'admin.one@email.com',
  password: 'nopasswd',
  role: :admin
)

Hospital.all.each do |hospital|
  10.times do
    Patient.create!(
      hospital: hospital,
      airways: Patient.airways.keys.sample,
      departure_reason: Patient.departure_reasons.keys.sample,
      status: Patient.statuses.keys.sample,
      cns: Faker::Number.number(digits: 15),
      sisreg: Faker::Number.number(digits: 9),
      full_name: Faker::Name.name,
      hospitalization_date: Faker::Date.between(from: 2.days.ago, to: Date.today)
    )
  end
end
