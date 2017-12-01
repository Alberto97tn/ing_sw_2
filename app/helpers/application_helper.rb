module ApplicationHelper
  def random_string
    ('a'..'z').to_a.shuffle.join
  end

  def random_number
    ('0'..'9').to_i.shuffle.join
  end
end
