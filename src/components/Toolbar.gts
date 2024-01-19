import { Component } from '@lifeart/gxt';


export class Toolbar extends Component {
    <template>
        <div class="toolbar" style="margin-top:50px;">
  <div class="toolbar__left">
    <span class="toolbar-button">
      <i class="ion-ios-menu" style="font-size:32px; vertical-align:-6px;"></i>
    </span>
  </div>

  <div class="toolbar__center">
    Navigation Bar
  </div>

  <div class="toolbar__right">
    <span class="toolbar-button">Label</span>
  </div>
</div>
    </template>
}