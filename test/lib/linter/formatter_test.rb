# frozen_string_literal: true

require 'test_helper'

class Linter::FormatterTest < ActiveSupport::TestCase
  test 'format linter JSON to database stored JSON' do
    check = repository_checks(:created)
    json_data = ApplicationContainer[:linter].build(check)
    json_result, *_issues_count = Linter::Formatter.build(check, json_data)
    # expected_json = load_fixture('files/json_formatted.json')
    expected_json = load_fixture('files/json_formatted_success.json')

    assert_equal JSON.parse(expected_json), JSON.parse(json_result)
  end
end
