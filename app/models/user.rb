class User < ActiveRecord::Base
  # validates :fname, uniqueness: true
  validates :lname, uniqueness: {scope: [:fname, :lname], message: 'Name already exist in system'}
  def info
    {
      id: id,
      first_name: fname,
      last_name: lname,
      is_active: true
    }
  end
end
