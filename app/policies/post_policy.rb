class PostPolicy < ApplicationPolicy
  def update?
    return true if admin?
    return true if user_or_admin && !post_approved?

    return false
  end

  private

    def user_or_admin
      record.user_id == user.id || admin?
    end

    def admin?
      admin_types.include?(user.type)
    end

    def post_approved?
      record.approved?
    end
end
