// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['dropdownContent', 'changebg'];

  connect() {
    this.dropdownContentTarget.hidden = true;
  }

  onclicked() {
    this.changebgTarget.classList.add('btn btn-primary');
  }
}
