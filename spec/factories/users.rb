FactoryGirl.define do
  factory :user do
    email 'titopuente@requisitions.com'
    provider 'Facebook'
    uid '19fa0m0asd02mfad'
    password '290fasd02f'

    factory :user_no_email do
      email ''
    end
  end
end
