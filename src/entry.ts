import './style.css';
import { renderComponent } from '@lifeart/gxt';
import MyApp from './Application';
renderComponent(new MyApp({}), document.getElementById('app'));