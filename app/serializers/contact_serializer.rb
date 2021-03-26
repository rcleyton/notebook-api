class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate #, :author

  has_many :phones
  has_one :address

  belongs_to :kind do
    link(:related) { kind_url(object.kind.id)}
  end

  # def author
  #   "Cleyton Silva"
  # end
  
  # link(:self) { contact_url(object.id)}
  # link(:kind) { kind_url(object.kind.id)}

  def attributes(*args)
    hash = super(*args)
    #hash[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    hash[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    hash
  end

end
