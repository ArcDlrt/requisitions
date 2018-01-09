module ProfilesHelper

  def genders_list
    {
      I18n.t('genders.male') => 'M',
      I18n.t('genders.female') => 'F',
    }
  end
end