shared_examples "paginated list" do |route_left, route_right|
  it { expect(json_response).to have_key(:meta) }
  it { expect(json_response[:meta]).to have_key(:pagination) }
  it { expect(json_response[:meta][:pagination]).to have_key(:per_page) }
  it { expect(json_response[:meta][:pagination]).to have_key(:total_pages) }
  it { expect(json_response[:meta][:pagination]).to have_key(:total_objects) }
end
