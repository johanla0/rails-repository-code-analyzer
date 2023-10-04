# frozen_string_literal: true

# == Schema Information
#
# Table name: repositories
#
#  id         :integer          not null, primary key
#  full_name  :string
#  git_url    :string
#  language   :string
#  name       :string
#  ssh_url    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  github_id  :integer
#  user_id    :integer          not null
#
# Indexes
#
#  index_repositories_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Repository < ApplicationRecord
  RELEVANT_FIELDS = %i[full_name git_url language name ssh_url].freeze
  SUPPORTED_LANGUAGES = %i[javascript ruby].freeze

  include Presentable
  extend Enumerize

  belongs_to :user
  has_many :checks, dependent: :destroy, class_name: 'Repository::Check'

  enumerize :language, in: SUPPORTED_LANGUAGES

  validates :github_id, :language, presence: true
end
