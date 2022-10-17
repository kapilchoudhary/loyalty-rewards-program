module InvoicesHelper
  def user_loyalty_points
    current_user.loyalty_points.sum(&:point)
  end
end
