import { Controller } from '@hotwired/stimulus';
import Rails from '@rails/ujs';

export default class extends Controller {
  static targets = ['input', 'listData'];

  connect() {}

  // search friend
  searchByName() {
    Rails.ajax({
      url: `/friends?search=${this.inputTarget.value}`,
      type: 'get',
      dataType: 'json',
      success: (res) => {
        this.listDataTarget.innerHTML = res.html;
      },
    });
  }

  // search user
  searchByEmail() {
    Rails.ajax({
      url: `/users?search=${this.inputTarget.value}`,
      type: 'get',
      dataType: 'json',
      success: (res) => {
        this.listDataTarget.innerHTML = res.html;
      },
    });
  }
}
