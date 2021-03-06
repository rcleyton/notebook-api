class Contact < ApplicationRecord
  belongs_to :kind  #optional: true
  has_many :phones

  def as_json(options={})
    hash = super(options)
    hash[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
    hash
  end

  # def author
  #   "Cleyton Silva"
  # end

  # def kind_description
  #   self.kind.description
  # end

  # def as_json(options={})
  #   super(
  #     root: true,
  #     methods: [:author, :kind_description]
  #     # include: { kind: { only: :description }}
  #     )þ
  # end
end
