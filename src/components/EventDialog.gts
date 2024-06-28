import { Component, tracked } from '@lifeart/gxt';

export class EventDialog extends Component<{
  Args: {
    event: {
      title: string;
      detailedDescription: string;
      imageUrl: string;
      minPrice: number;
    };
    isOpen: boolean;
    onClose: () => void;
  };
  Element: HTMLDivElement;
}> {
  handleClick = (event: Event) => {
    // Only close if the click is outside the dialog content
    if (event.target === this.element) {
      this.args.onClose();
    }
  };

  <template>
    <div
      class='bg-white rounded-lg shadow p-4 mb-4 relative'
      {{on 'click' this.handleClick}}
      ...attributes
    >
      <div
        class='bg-white w-full max-w-md rounded-lg overflow-hidden shadow-lg'
      >
        <img
          src={{@event.imageUrl}}
          alt={{@event.title}}
          class='w-full h-48 object-cover'
        />
        <div class='p-4'>
          <h2 class='text-xl font-medium mb-2'>{{@event.title}}</h2>
          <p class='text-gray-700 mb-4'>{{@event.detailedDescription}}</p>
          <p class='text-gray-600 mb-2'>From ${{@event.minPrice}}</p>
          <button
            class='bg-green-500 text-white px-4 py-2 rounded'
          >Purchase</button>
          <button
            class='bg-gray-300 text-gray-700 px-4 py-2 rounded ml-2'
            {{on 'click' @onClose}}
          >Close</button>
        </div>
      </div>
    </div>
  </template>
}