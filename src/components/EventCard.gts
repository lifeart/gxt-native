import { Component, tracked } from '@lifeart/gxt';


export class EventCard extends Component<{
  Args: {
    event: {
      id: number;
      title: string;
      minPrice: number;
      imageUrl: string;
      description: string;
      detailedDescription: string; // Add a field for detailed description
    };
    onToggleFavorite: (eventId: number) => void;
  };
}> {
  @tracked isFavorite = false;

  constructor(args: any) {
    super(args);
    this.isFavorite = !!localStorage.getItem(`event-${this.args.event.id}`);
  }

  toggleFavorite = () => {
    this.isFavorite = !this.isFavorite;
    if (this.isFavorite) {
      localStorage.setItem(`event-${this.args.event.id}`, 'true');
    } else {
      localStorage.removeItem(`event-${this.args.event.id}`);
    }
    this.args.onToggleFavorite(this.args.event.id);
  };

  <template>
    <div class='bg-white rounded-lg shadow p-4 mb-4 relative'>
      <img
        src={{@event.imageUrl}}
        alt={{@event.title}}
        class='w-full h-48 object-cover mb-2 rounded-t-lg'
      />
      <h2 class='text-lg font-medium'>{{@event.title}}</h2>
      <p class='text-gray-600 mb-2'>From ${{@event.minPrice}}</p>
      <p class='text-sm text-gray-700 line-clamp-3'>{{@event.description}}</p>
      <button
        class='bg-blue-500 text-white px-3 py-2 rounded mt-2'
        {{on 'click' this.toggleFavorite}}
      >
        {{if this.isFavorite 'Remove Favorite' 'Add to Favorites'}}
      </button>
    </div>
  </template>
}
