import { Controller } from 'stimulus';
import { get } from '@rails/request.js';

export default class extends Controller {
  static targets = ['nextPageLink'];

  initialize() {
    this.observeNextPageLink();
  }

  async observeNextPageLink() {
    if (!this.hasNextPageLinkTarget) return;

    await nextIntersection(this.nextPageLinkTarget);
    this.getNextPage();
  }

  async getNextPage() {
    const response = await get(this.nextPageLinkTarget.href); // AJAX request
    const html = await response.text;
    const doc = new DOMParser().parseFromString(html, 'text/html');
    const nextPageHTML = doc.querySelector(
      `[data-controller~=${this.identifier}]`
    ).innerHTML;
    this.nextPageLinkTarget.outerHTML = nextPageHTML;
  }
}

const nextIntersection = (targetElement) => {
  return new Promise((resolve) => {
    new IntersectionObserver(([element]) => {
      if (!element.isIntersecting) {
        return;
      } else {
        resolve();
      }
    }).observe(targetElement);
  });
};
