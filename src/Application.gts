import { Component } from '@lifeart/gxt';
import { List } from './components/List.gts';
import { Toolbar } from './components/Toolbar.gts';

export default class Application extends Component {
    <template>
      <Toolbar />
      <List />
        <div class="window" style="margin: 32px; width: 250px">
    <div class="title-bar">
      <div class="title-bar-text">
        My First VB4 Programs
      </div>
    </div>
    <div class="window-body">
      <p>Hello, worlds!</p>
    </div>
  </div>
    </template>
}