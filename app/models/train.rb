### BEGIN LICENSE
# Copyright (C) 2012 Benoît Legat benoit.legat@gmail.com
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
### END LICENSE

class Train < ActiveRecord::Base
  #attr_accessible :success, :guess

  # guess = nil means give up. '' means no guess.
  # So no validates presence: true.
  
  belongs_to :user
  validates :user_id, presence: true
  
  belongs_to :list
  validates :list_id, presence: true
  
  has_many :fragments, foreign_key: :train_id, class_name: "TrainFragment"
  
  validates :finished, inclusion: { in: [true, false] }
  validates :type_of_train, presence: true # 1 = Fill-in         2 = Multiple choice
  validates :error_policy, presence: true    # 1 = Ask just once   2 = Ask again
  validates :q_to_a, presence: true    # 1 = q->a   2 = q<-a   3 = q<->a
  
  
  
  # validates :include_sub_lists, presence: true # TODO PROBLEM!?
  

end
# == Schema Information
# Schema version: 20130822154326
#
# Table name: trains
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  word_id    :integer
#  guess      :string(255)
#  success    :boolean
#  created_at :datetime        not null
#  updated_at :datetime        not null
#
# Indexes
#
#  index_trains_on_word_id  (word_id)
#  index_trains_on_user_id  (user_id)
#

