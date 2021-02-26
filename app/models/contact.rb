class Contact < ApplicationRecord
  belongs_to :kind  #optional: true

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
