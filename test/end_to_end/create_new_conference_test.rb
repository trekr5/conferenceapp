require 'test_helper'

# NOTE: We're assuming here that the user is already logged in
describe 'when creating a new conference' do
  it 'is possible to specify the conference name and see it listed on the page' do
    create_a_new_conference_named "Tech Conference"
    page_must_show_a_conference_named "Tech Conference"
  end
end
