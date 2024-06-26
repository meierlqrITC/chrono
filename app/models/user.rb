class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role

  def ist_verwalter?
    role.rolle == 'Verwalter'
  end

  def ist_dozent?
    role.rolle == 'Dozent'
  end

  def ist_student?
    role.rolle == 'Student'
  end
end