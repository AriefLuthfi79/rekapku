module Features
  def create_category
    visit categories_path
    fill_in 'Name', with: "Barang Pecah"
    click_on 'Create Category'
  end
end
