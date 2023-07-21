# frozen_string_literal: true

class CustomCheckboxListComponent < ViewComponent::Base
  attr_reader :field, :model, :size, :classes

  def initialize(
    field:,
    model:,
    size:,
    comparitor: nil,
    classes: '',
    data: nil,
    checked: nil,
    disabled: false,
    iterator_prefix: '',
    constraint: nil,
    constrained_classes: nil
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
    @constraint = constraint
    @constrained_classes = constrained_classes
  end

  def disabled?(index)
    return @disabled if @constraint.nil?

    new_index = prefix_iterator(index)

    new_index >= constrained_max
  end

  def list_class(index)
    new_index = prefix_iterator(index)
    return classes if @constraint.nil? || @constrained_classes.nil?

    return "#{classes} #{@constrained_classes}" if new_index >= constrained_max

    classes
  end

  def data(index)
    new_index = prefix_iterator(index)
    return new_index + 1 if @data.blank?

    @data
  end

  def comparitor
    @comparitor || model.send(field)
  end

  def checked?(index)
    new_index = prefix_iterator(index)
    return new_index + 1 <= comparitor if @checked.nil?

    @checked
  end

  def value(index)
    return unless @checked.nil?

    new_index = prefix_iterator(index)

    checked?(index) ? new_index : new_index + 1
  end

  private

  def constrained_max
    size - @constraint
  end

  def prefix_iterator(index)
    return index if @iterator_prefix.blank?

    "#{@iterator_prefix}#{index}".to_i
  end
end
