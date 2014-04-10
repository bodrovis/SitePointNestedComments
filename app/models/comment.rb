# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  author     :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#  parent_id  :integer
#

class Comment < ActiveRecord::Base
  acts_as_tree order: 'created_at DESC'

  def to_digraph_label
    title
  end
end
