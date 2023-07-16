# frozen_string_literal: true

class CustomCheckboxListComponent < ViewComponent::Base
  attr_reader :field, :model, :size, :classes, :disabled

  def initialize(
    field:,
    model:,
    size:,
    comparitor: nil,
    classes: '',
    data: nil,
    checked: nil,
    disabled: false,
    iterator_prefix: ''
  )
    @field = field
    @model = model
    @size = size
    @comparitor = comparitor
    @classes = classes
    @data = data
    @checked = checked
    @disabled = disabled
    @iterator_prefix = iterator_prefix
  end

  def data(index)
    new_index = prefix_iterator(index)
    return new_index + 1 unless @data.present?

    @data
  end

  def checked?(index)
    new_index = prefix_iterator(index)
    return new_index + 1 <= @comparitor if @checked.nil?

    @checked
  end

  def value(index)
    return unless @checked.nil?

    new_index = prefix_iterator(index)

    checked?(index) ? new_index : new_index + 1
  end

  private

  def prefix_iterator(index)
    return index unless @iterator_prefix.present?

    "#{@iterator_prefix}#{index}".to_i
  end
end
