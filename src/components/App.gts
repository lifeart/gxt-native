import { Component, tracked, cellFor } from '@lifeart/gxt';
import { EventCard } from './EventCard.gts';
import { EventDialog } from './EventDialog.gts';


const events = [
  {
    id: 1,
    title: 'Summer Music Festival',
    minPrice: 45,
    imageUrl: 'https://via.placeholder.com/300x200',
    description: 'Enjoy a weekend of live music, food, and fun!',
  },
  {
    id: 2,
    title: 'Art Exhibition Opening',
    minPrice: 20,
    imageUrl: 'https://via.placeholder.com/300x200',
    description: 'Explore the latest works from emerging artists.',
  },
  {
    id: 3,
    title: 'Tech Conference',
    minPrice: 150,
    imageUrl: 'https://via.placeholder.com/300x200',
    description: 'Learn from industry experts and network with peers.',
  },
  // Add more event data as needed
];

export class App extends Component {
  @tracked events = events.map((event) => {
    cellFor(event, 'isFavorite');
    event.isFavorite = !!localStorage.getItem(`event-${event.id}`);
    return event;
  });

  @tracked selectedEvent: {
    id: number;
    title: string;
    minPrice: number;
    imageUrl: string;
    description: string;
    detailedDescription: string; // Add a field for detailed description
  } | null = null;
  @tracked showDialog = false;

  toggleFavorite = (eventId: number) => {
    const event = this.events.find((e) => e.id === eventId);
    if (event) {
      event.isFavorite = !event.isFavorite;
      if (event.isFavorite) {
        localStorage.setItem(`event-${eventId}`, 'true');
      } else {
        localStorage.removeItem(`event-${eventId}`);
      }
    }
  };

  openDialog = (event: {
    id: number;
    title: string;
    minPrice: number;
    imageUrl: string;
    description: string;
    detailedDescription: string;
  }) => {
    this.selectedEvent = event;
    this.showDialog = true;
  };

  closeDialog = () => {
    this.showDialog = false;
  };

  <template>
    <div class='bg-gray-100 p-4'>
      <h1 class='text-2xl font-bold mb-4'>
        {{#if this.showDialog}}
        Selected Event
        {{else}}
        Upcoming Events
        {{/if}}
      </h1>
      {{#if this.showDialog}}
        <EventDialog
          @event={{this.selectedEvent}}
          @isOpen={{this.showDialog}}
          @onClose={{this.closeDialog}}
        />
      {{else}}
           <div class='grid grid-cols-1 gap-4 h-screen overflow-scroll'>
        {{#each this.events as |event|}}
          <EventCard
            @event={{event}}
            @onToggleFavorite={{this.toggleFavorite}}
          />
          <button
            class='bg-blue-500 text-white px-3 py-2 rounded mt-2'
            {{on 'click' (fn this.openDialog event)}}
          >View</button>
        {{/each}}
      </div>
      {{/if}}
    </div>
  </template>
}