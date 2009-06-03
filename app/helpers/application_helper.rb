module ApplicationHelper

  def row_class(index)
    index.even? ? 'even' : 'odd'
  end

  def icon(answer)
    case answer
    when '+': 'plus.png'
    when '-': 'minus.png'
    else 'nada.png'
    end
  end

end
