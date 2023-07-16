# frozen_string_literal: true

class CustomCheckboxComponent < ViewComponent::Base
  attr_reader :model, :field, :value, :nil, :checked, :classes, :data, :disabled

  def initialize(
    model:,
    field:,
    value: nil,
    checked: nil,
    classes: '',
    data: nil,
    disabled: false
  )
    @model = model
    @field = field
    @checked = checked
    @value = value || !checked
    @classes = classes
    @data = data
    @disabled = disabled
  end
end
