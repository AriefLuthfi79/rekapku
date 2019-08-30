module Features
  def create_category
    visit categories_path
    click_on 'New Category'
    fill_in 'Name', with: "Barang Pecah"
    click_on 'Save changes'
  end
end
